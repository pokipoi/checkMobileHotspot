@echo off
:: install.bat

:: Set title and color
title Install checkMobileHotspot
color 0A

:: Get script directory
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

:: Define source file path (in the same folder as script)
set "SOURCE_EXE=%SCRIPT_DIR%\checkMobileHotspot.exe"

:: Get current user's startup folder path
set "STARTUP_FOLDER=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

:: Define destination path
set "DEST_EXE=%STARTUP_FOLDER%\checkMobileHotspot.exe"

echo ===============================
echo  checkMobileHotspot Installer
echo ===============================
echo.

:: Check if source file exists
if not exist "%SOURCE_EXE%" (
    color 0C
    echo Error: 'checkMobileHotspot.exe' not found in script directory
    echo Script directory: %SCRIPT_DIR%
    echo.
    echo Press any key to exit...
    pause >nul
    exit /b 1
)

:: Check if startup folder exists
if not exist "%STARTUP_FOLDER%" (
    mkdir "%STARTUP_FOLDER%" 2>nul
    if not exist "%STARTUP_FOLDER%" (
        color 0C
        echo Error: Unable to access or create Windows startup folder
        echo.
        echo Press any key to exit...
        pause >nul
        exit /b 1
    )
)

:: Try to copy file to startup folder
copy /Y "%SOURCE_EXE%" "%DEST_EXE%" >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo Installation successful!
    echo checkMobileHotspot.exe has been copied to startup folder:
    echo %STARTUP_FOLDER%
) else (
    color 0C
    echo Installation failed!
    echo Please try running this script as administrator.
)

echo.
echo Press any key to exit...
pause >nul