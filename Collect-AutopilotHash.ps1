# Collect-AutopilotHash.ps1
# This script collects the Autopilot hardware hash and saves it to a CSV file.

Write-Host "Starting Autopilot hardware hash collection..."

# Ensure script can run
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass -Force

# Check if script is running in WinPE
if (-not (Test-Path "X:\Windows")) {
    Write-Host "This script is intended to run in WinPE. Exiting."
    exit
}

# Load the script from local storage (assumes it's already copied into WinPE image)
$scriptPath = "X:\Windows\System32\Get-WindowsAutopilotInfo.ps1"

if (-Not (Test-Path $scriptPath)) {
    Write-Host "Autopilot script not found at $scriptPath"
    exit
}

# Define output path (USB drive or network share)
$usbDrive = Get-Volume | Where-Object { $_.DriveLetter -ne 'X' -and $_.DriveType -eq 'Removable' } | Select-Object -First 1
if ($usbDrive) {
    $outputPath = "$($usbDrive.DriveLetter):\AutoPilotHWID.csv"
} else {
    $outputPath = "X:\AutoPilotHWID.csv"
    Write-Host "No USB drive detected. Saving to X: drive."
}

# Run the script
try {
    . $scriptPath -OutputFile $outputPath -Append
    Write-Host "Hardware hash saved to: $outputPath"
} catch {
    Write-Host "Error collecting hardware hash: $_"
}
