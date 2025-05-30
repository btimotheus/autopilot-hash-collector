@echo off
echo Starting Autopilot hardware hash collection...

:: Change to the drive where this script is located
cd /d %~dp0

:: Launch PowerShell and run the wrapper script
powershell -NoProfile -ExecutionPolicy Bypass -Command "& '.\Collect-AutopilotHash.ps1'"

echo.
echo Press [S] to shut down the computer, or any other key to exit.
choice /C SY /N /M "Press S to shut down, or Y to skip: "

if errorlevel 2 (
    echo Exiting without shutdown.
) else (
    echo Shutting down...
    shutdown /s /t 0
)
