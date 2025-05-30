# Autopilot Hardware Hash Collection Toolset

Hi! I'm a network administrator with no prior scripting experience. I needed a quick and reliable way to collect hardware hashes from used PCs for Windows Autopilot. With the help of Microsoft Copilot, I created this simple toolset that runs directly from the OOBE screen using a USB stick.

This project is shared in case it helps others in a similar situation.

## 📁 Files Included

- `Collect-AutopilotHash.ps1`: PowerShell script to collect and save the hardware hash.
- `Run-AutopilotHash.cmd`: CMD script to launch PowerShell, run the wrapper script, and prompt for shutdown.
- `Get-WindowsAutopilotInfo.ps1`: Required script to extract the hardware hash (must be included on the USB stick).

## 💡 How to Use

### 1. Prepare the USB Stick

- Copy the following files to the **root** of your USB stick:
  - `Collect-AutopilotHash.ps1`
  - `Run-AutopilotHash.cmd`
  - `Get-WindowsAutopilotInfo.ps1` (see below for how to get it)

### 📥 Required Script: `Get-WindowsAutopilotInfo.ps1`

This script is essential for collecting the hardware hash. It should be included on the USB stick to ensure it works even if the target PC has no internet access.

#### How to Get It

1. On a PC with internet access, open PowerShell **as Administrator**.
2. Run the following command to download the script:

   ```powershell
   Install-Script -Name Get-WindowsAutopilotInfo
   ```
3. After installation, the script is typically saved to:
   C:\Program Files\WindowsPowerShell\Scripts\Get-WindowsAutopilotInfo.ps1

4. Copy this file to the root of your USB stick.

### 2. On the Target PC
- Boot the PC to the Windows OOBE screen (language selection, etc.).
  - Press Shift + F10 to open Command Prompt.
  - Insert the USB stick.
  - Navigate to the USB drive (e.g., D:) and run:
    ``` Run-AutopilotHash.cmd ```

### Feel free to fork, improve, or share this toolset if it helps you or your team!
