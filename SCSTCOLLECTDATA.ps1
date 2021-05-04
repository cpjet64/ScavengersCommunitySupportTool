# Run a Powershell script that isnt signed ONCE and ONLY DURING THIS SESSION
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Set location to script path
Set-Location (Split-Path -Parent $MyInvocation.MyCommand.Path)

# Includes
. .\New-ScstLog.ps1
. .\Submit-TextFile.ps1

# Settings
$pst = "Scavengers Community Support Tool Data Only"
$log = "SCSTInfo.log"
$uri = 'https://discord.com/api/webhooks/838597970369708123/f95KX4IkB4qbt10eMdiW9SMyBEf_5uMPsr2vwXtoxNmE6OG4B0fFGM_KUesDb8wOTEJQ'

# Set Window Title
$host.UI.RawUI.WindowTitle = $pst

# Generate Log and send to Discord
if(New-ScstLog $log){
  $null = Submit-TextFile $log $uri
}
