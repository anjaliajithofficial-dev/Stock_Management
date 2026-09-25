<?php
require_once __DIR__ . '/../includes/layout.php';
require_role(['GSSSR']);
verify_csrf();
require_once __DIR__ . '/../includes/BackupManager.php';

$backup = new BackupManager();
$message = '';
$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? '';
    try {
        if ($action === 'create') {
            $dbFile = $backup->dumpDatabase();
            $zipFile = $backup->zipUploads();
            $message = "Backup created: $dbFile and $zipFile";
            log_activity('GSSSR created a manual backup');
        } elseif ($action === 'delete') {
            $backup->deleteBackup($_POST['name'] ?? '');
            $message = 'Backup deleted.';
            log_activity('GSSSR deleted a backup: ' . ($_POST['name'] ?? ''));
        }
    } catch (Throwable $e) {
        $error = $e->getMessage();
    }
}

if (isset($_GET['download'])) {
    $backup->download($_GET['download']);
}

$files = $backup->listBackups();
render_header('Data Backup');
?>
<h1 class="h3 mb-3">Data Backup <span class="badge bg-warning text-dark ms-2">GSSSR</span></h1>

<?php if ($message): ?><div class="alert alert-success"><?= e($message) ?></div><?php endif; ?>
<?php if ($error): ?><div class="alert alert-danger"><?= e($error) ?></div><?php endif; ?>

<div class="card metric-card mb-4">
  <div class="card-body">
    <p>Create a full backup of the database and uploaded files. Backups are stored in <code>backups/</code> and can be downloaded anytime.</p>
    <form method="post" class="d-inline">
      <?php csrf_field(); ?>
      <input type="hidden" name="action" value="create">
      <button class="btn btn-primary"><i class="bi bi-shield-check me-1"></i>Create New Backup</button>
    </form>
  </div>
</div>

<div class="card metric-card">
  <div class="card-header bg-white fw-semibold">Existing Backups</div>
  <div class="table-responsive">
    <table class="table mb-0">
      <thead>
        <tr><th>File</th><th>Size</th><th>Created</th><th>Actions</th></tr>
      </thead>
      <tbody>
        <?php if (empty($files)): ?>
        <tr><td colspan="4" class="text-muted text-center py-4">No backups yet.</td></tr>
        <?php else: foreach ($files as $f): ?>
        <tr>
          <td><?= e($f['name']) ?></td>
          <td><?= number_format($f['size'] / 1024, 1) ?> KB</td>
          <td><?= e($f['date']) ?></td>
          <td>
            <a class="btn btn-sm btn-outline-primary" href="?download=<?= urlencode($f['name']) ?>"><i class="bi bi-download me-1"></i>Download</a>
            <form method="post" class="d-inline" onsubmit="return confirm('Delete this backup?');">
              <?php csrf_field(); ?>
              <input type="hidden" name="action" value="delete">
              <input type="hidden" name="name" value="<?= e($f['name']) ?>">
              <button class="btn btn-sm btn-outline-danger"><i class="bi bi-trash me-1"></i>Delete</button>
            </form>
          </td>
        </tr>
        <?php endforeach; endif; ?>
      </tbody>
    </table>
  </div>
</div>
<?php render_footer(); ?>