# Run a Powershell script that isnt signed ONCE and ONLY DURING THIS SESSION
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Set location to script path
Set-Location (Split-Path -Parent $MyInvocation.MyCommand.Path)

# Includes
. .\New-ScstLog.ps1

# Settings
$PSTitle = "Scavengers Community Support Tool Data Only"
$scstlog = "SCSTInfo.log"

# Set Window Title
$host.UI.RawUI.WindowTitle = $PSTitle

# Generate Log
New-ScstLog $scstlog
