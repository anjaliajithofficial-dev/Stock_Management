<?php
class BackupManager
{
    private $db;
    private $backupDir;

    public function __construct()
    {
        $this->db = Database::conn();
        $this->backupDir = BASE_PATH . '/backups/';
        if (!is_dir($this->backupDir)) {
            mkdir($this->backupDir, 0755, true);
        }
    }

    /**
     * Dump the entire database to a .sql file.
     * Uses mysqldump if available; falls back to pure PHP.
     */
    public function dumpDatabase(): string
    {
        $filename = 'db_' . date('Ymd_His') . '.sql';
        $path = $this->backupDir . $filename;

        // Try mysqldump first (faster, more reliable)
        if ($this->mysqldumpToFile($path)) {
            return $filename;
        }

        // Fallback: pure PHP dump
        $this->phpDumpToFile($path);
        return $filename;
    }

    /**
     * Zip all uploaded files (invoices, PDFs, Excel).
     */
    public function zipUploads(): string
    {
        $filename = 'uploads_' . date('Ymd_His') . '.zip';
        $path = $this->backupDir . $filename;

        $zip = new ZipArchive();
        if ($zip->open($path, ZipArchive::CREATE | ZipArchive::OVERWRITE) !== true) {
            throw new RuntimeException('Could not create zip file');
        }

        $uploadDir = BASE_PATH . '/uploads/';
        if (is_dir($uploadDir)) {
            $files = new RecursiveIteratorIterator(
                new RecursiveDirectoryIterator($uploadDir, RecursiveDirectoryIterator::SKIP_DOTS),
                RecursiveIteratorIterator::LEAVES_ONLY
            );
            foreach ($files as $file) {
                if ($file->isFile()) {
                    $relativePath = substr($file->getPathname(), strlen($uploadDir));
                    $zip->addFile($file->getPathname(), $relativePath);
                }
            }
        }

        $zip->close();
        return $filename;
    }

    /**
     * List all backup files (for the admin UI).
     */
    public function listBackups(): array
    {
        $files = glob($this->backupDir . '*.{sql,zip}', GLOB_BRACE) ?: [];
        $result = [];
        foreach ($files as $file) {
            $result[] = [
                'name' => basename($file),
                'size' => filesize($file),
                'date' => date('d-m-Y H:i', filemtime($file)),
            ];
        }
        usort($result, fn($a, $b) => strcmp($b['date'], $a['date']));
        return $result;
    }

    /**
     * Delete a backup file safely (only inside backups folder).
     */
    public function deleteBackup(string $name): bool
    {
        $name = basename($name); // prevent path traversal
        $path = $this->backupDir . $name;
        if (is_file($path)) {
            return unlink($path);
        }
        return false;
    }

    /**
     * Send a backup file to the browser as a download.
     */
    public function download(string $name): void
    {
        $name = basename($name);
        $path = $this->backupDir . $name;
        if (!is_file($path)) {
            http_response_code(404);
            exit('Backup not found');
        }
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename="' . $name . '"');
        header('Content-Length: ' . filesize($path));
        readfile($path);
        exit;
    }

    // ---------- private helpers ----------

private function mysqldumpToFile(string $path): bool
{
    // Locate mysqldump.exe (prefer MySQL 9.1.0, fall back to any installed version)
    $mysqldump = 'C:\\wamp64\\bin\\mysql\\mysql9.1.0\\bin\\mysqldump.exe';
    if (!is_file($mysqldump)) {
        $candidates = glob('C:\\wamp64\\bin\\mysql\\mysql*\\bin\\mysqldump.exe');
        $mysqldump = $candidates ? end($candidates) : 'mysqldump';
    }

    $passwordPart = DB_PASS !== '' ? '--password=' . escapeshellarg(DB_PASS) : '';

    $cmd = sprintf(
        '"%s" --host=%s --user=%s %s %s',
        $mysqldump,
        escapeshellarg(DB_HOST),
        escapeshellarg(DB_USER),
        $passwordPart,
        escapeshellarg(DB_NAME)
    );

    $output = [];
    $returnCode = 0;
    exec($cmd, $output, $returnCode);

    // Log for debugging
    $log = BASE_PATH . '/backups/mysqldump.log';
    @file_put_contents($log,
        "=== " . date('Y-m-d H:i:s') . " ===\n" .
        "CMD: $cmd\n" .
        "Return code: $returnCode\n" .
        "Lines captured: " . count($output) . "\n\n",
        FILE_APPEND
    );

    if ($returnCode !== 0 || empty($output)) {
        return false;
    }

    // Write the captured SQL to the target file ourselves
    $sql = implode("\n", $output);
    $written = file_put_contents($path, $sql);

    return $written !== false && $written > 0;
}

    private function phpDumpToFile(string $path): void
    {
        $out = fopen($path, 'w');
        if (!$out) throw new RuntimeException('Cannot open backup file for writing');

        fwrite($out, "-- College Stock Portal Backup\n");
        fwrite($out, "-- Generated: " . date('Y-m-d H:i:s') . "\n\n");
        fwrite($out, "SET FOREIGN_KEY_CHECKS=0;\n\n");

        // Get all tables
        $tables = $this->db->query("SHOW TABLES")->fetchAll(PDO::FETCH_COLUMN);
        foreach ($tables as $table) {
            $create = $this->db->query("SHOW CREATE TABLE `$table`")->fetch(PDO::FETCH_ASSOC);
            fwrite($out, "DROP TABLE IF EXISTS `$table`;\n");
            fwrite($out, $create['Create Table'] . ";\n\n");

            $rows = $this->db->query("SELECT * FROM `$table`")->fetchAll(PDO::FETCH_ASSOC);
            foreach ($rows as $row) {
                $cols = array_map(fn($c) => "`$c`", array_keys($row));
                $vals = array_map(function ($v) {
                    if ($v === null) return 'NULL';
                    return $this->db->quote((string)$v);
                }, array_values($row));
                fwrite($out, "INSERT INTO `$table` (" . implode(',', $cols) . ") VALUES (" . implode(',', $vals) . ");\n");
            }
            fwrite($out, "\n");
        }

        fwrite($out, "SET FOREIGN_KEY_CHECKS=1;\n");
        fclose($out);
    }
}