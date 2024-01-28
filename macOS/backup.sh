@echo off
setlocal enabledelayedexpansion

echo Hey there! I'm your interactive backup buddy. ^_^

REM Ask the user for the source directory
set /p "source_dir=Enter the source directory: "

REM Check if the source directory exists
if not exist "%source_dir%" (
  echo Oops! The source directory doesn't exist. Please provide a valid path.
  exit /b 1
)

REM Ask the user for the backup directory
set /p "backup_dir=Enter the backup directory: "

REM Check if the backup directory exists, if not, create it
if not exist "%backup_dir%" (
  echo Creating backup directory...
  mkdir "%backup_dir%"
)

REM Create a timestamp for the backup
set "timestamp=%date:~0,4%%date:~5,2%%date:~8,2%%time:~0,2%%time:~3,2%%time:~6,2%"

REM Create a backup archive
set "backup_file=backup_%timestamp%.zip"
powershell Compress-Archive -Path "%source_dir%\*" -DestinationPath "%backup_dir%\%backup_file%"

REM Check if the backup was successful
if %errorlevel% equ 0 (
  echo Backup completed successfully! ^_^
) else (
  echo Oops! Something went wrong with the backup. :(
)

REM Let's wrap it up!
echo All done! Your files are safe and sound. ^_^

endlocal
