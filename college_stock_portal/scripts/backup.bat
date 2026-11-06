@echo off
setlocal

set "ROOT=C:\wamp64\www\New folder\college_stock_portal"
set "BACKUP_DIR=%ROOT%\backups"
set "MYSQLDUMP=C:\wamp64\bin\mysql\mysql9.1.0\bin\mysqldump.exe"
set "DB_USER=root"
set "DB_NAME=college_stock_db"
set "LOGFILE=%BACKUP_DIR%\auto_backup.log"

for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set DATETIME=%%I
set "TARGET_FILE=%BACKUP_DIR%\auto_db_%DATETIME%.sql"
set FILE_SIZE=0
set OK=0

echo [%DATETIME%] Backup started >> "%LOGFILE%"

"%MYSQLDUMP%" --single-transaction --routines -u %DB_USER% %DB_NAME% > "%TARGET_FILE%" 2>> "%LOGFILE%"
set DUMP_RC=%ERRORLEVEL%

if exist "%TARGET_FILE%" for %%A in ("%TARGET_FILE%") do set FILE_SIZE=%%~zA
if %DUMP_RC% EQU 0 if %FILE_SIZE% GTR 0 set OK=1

if %OK% EQU 1 (
    echo [%DATETIME%] Backup OK >> "%LOGFILE%"
    powershell -NoProfile -Command "Compress-Archive -Path '%ROOT%\uploads\*' -DestinationPath '%BACKUP_DIR%\auto_uploads_%DATETIME%.zip' -Force" >> "%LOGFILE%" 2>&1
    forfiles /p "%BACKUP_DIR%" /m auto_db_*.sql /d -30 /c "cmd /c del @path" >nul 2>&1
    forfiles /p "%BACKUP_DIR%" /m auto_uploads_*.zip /d -30 /c "cmd /c del @path" >nul 2>&1
) else (
    echo [%DATETIME%] Backup FAILED - exit code %DUMP_RC%, size %FILE_SIZE% >> "%LOGFILE%"
    if exist "%TARGET_FILE%" del "%TARGET_FILE%"
)

endlocal