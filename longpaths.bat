@echo off
:: Check for administrative privileges
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo "Requesting administrative privileges..."
    powershell -Command "Start-Process cmd -ArgumentList '/c, %~fnx0' -Verb RunAs"
    exit /B
)

:: Now running as administrator, apply the registry change
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem" /v LongPathsEnabled /t REG_DWORD /d 1 /f
