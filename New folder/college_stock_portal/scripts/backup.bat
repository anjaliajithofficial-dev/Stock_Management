@echo off
setlocal

set BACKUP_DIR=C:\wamp64\www\New folder\college_stock_portal\backups
set MYSQLDUMP="C:\wamp64\bin\mysql\mysql9.1.0\bin\mysqldump.exe"
set DB_USER=root
set DB_PASS=
set DB_NAME=college_stock_db
set LOGFILE=%BACKUP_DIR%\auto_backup.log

REM Get date and time using PowerShell (wmic is deprecated on Windows 11)
for /f %%I in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd_HH-mm-ss"') do set DATETIME=%%I

echo [%DATETIME%] Backup started >> "%LOGFILE%"

if "%DB_PASS%"=="" (
    %MYSQLDUMP% -u %DB_USER% %DB_NAME% > "%BACKUP_DIR%\auto_db_%DATETIME%.sql" 2>> "%LOGFILE%"
) else (
    %MYSQLDUMP% -u %DB_USER% -p%DB_PASS% %DB_NAME% > "%BACKUP_DIR%\auto_db_%DATETIME%.sql" 2>> "%LOGFILE%"
)

if errorlevel 1 (
    echo [%DATETIME%] Backup FAILED >> "%LOGFILE%"
) else (
    echo [%DATETIME%] Backup OK >> "%LOGFILE%"
)

REM Delete backups older than 30 days
forfiles /p "%BACKUP_DIR%" /m auto_db_*.sql /d -30 /c "cmd /c del @path" >nul 2>&1

endlocal