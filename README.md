# Autopilot Hardware Hash Collection Toolset

Hi! I'm a network administrator with no prior scripting experience. I needed a quick and reliable way to collect hardware hashes from used PCs for Windows Autopilot. With the help of Microsoft Copilot, I created this simple toolset that runs directly from the OOBE screen using a USB stick.

This project is shared in case it helps others in a similar situation.
# Autopilot Hardware Hash Collection Toolset

This toolset helps you collect Windows Autopilot hardware hashes from PCs at the OOBE screen, using a USB stick. It was developed with the help of Microsoft Copilot.

## 📁 Files Included

- `Collect-AutopilotHash.ps1`: PowerShell script to collect and save the hardware hash.
- `Run-AutopilotHash.cmd`: CMD script to launch PowerShell, run the wrapper script, and prompt for shutdown.

## 🧰 How to Use

### 1. Prepare the USB Stick

- Copy `Collect-AutopilotHash.ps1` and `Run-AutopilotHash.cmd` to the root of your USB stick.
- Optionally, include `Get-WindowsAutopilotInfo.ps1` if it is not already present on the target PCs (you can download it using `Install-Script -Name Get-WindowsAutopilotInfo` on a PC with internet access).

### 2. On the Target PC

- Boot the PC to the Windows OOBE screen (language selection, etc.).
- Press `Shift + F10` to open Command Prompt.
- Insert the USB stick.
- Navigate to the USB drive (e.g., `D:`) and run:

```cmd
Run-AutopilotHash.cmd
