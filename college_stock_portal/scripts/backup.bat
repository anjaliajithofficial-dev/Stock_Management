@echo off
setlocal

set BACKUP_DIR=C:\wamp64\www\New folder\college_stock_portal\backups
set MYSQLDUMP="C:\wamp64\bin\mysql\mysql9.1.0\bin\mysqldump.exe"
set DB_USER=root
set DB_PASS=
set DB_NAME=college_stock_db
set LOGFILE=%BACKUP_DIR%\auto_backup.log

for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set DATETIME=%%I
set TARGET_FILE=%BACKUP_DIR%\auto_db_%DATETIME%.sql

echo [%DATETIME%] Backup started >> "%LOGFILE%"

if "%DB_PASS%"=="" (
    %MYSQLDUMP% -u %DB_USER% %DB_NAME% > "%TARGET_FILE%" 2>> "%LOGFILE%"
) else (
    %MYSQLDUMP% -u %DB_USER% -p%DB_PASS% %DB_NAME% > "%TARGET_FILE%" 2>> "%LOGFILE%"
)

REM Check if the file exists AND is larger than 0 bytes
for %%A in ("%TARGET_FILE%") do set FILE_SIZE=%%~zA

if %FILE_SIZE% GTR 0 (
    echo [%DATETIME%] Backup OK >> "%LOGFILE%"
    REM Delete backups older than 30 days (only if backup was successful)
    forfiles /p "%BACKUP_DIR%" /m auto_db_*.sql /d -30 /c "cmd /c del @path" >nul 2>&1
) else (
    echo [%DATETIME%] Backup FAILED - File is empty >> "%LOGFILE%"
    REM Delete the useless 0-byte file
    del "%TARGET_FILE%"
)

endlocal