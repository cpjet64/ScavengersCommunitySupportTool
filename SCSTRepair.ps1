Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
 if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
  $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
  Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
  Exit
 }
}




function Repair
{
$dismlog = "$env:TEMP\SCST-DISM.log"
Start-Process -FilePath "$env:SystemRoot\System32\sfc.exe" -ArgumentList "/scannow" -Wait
Start-Process -FilePath "$env:SystemRoot\System32\Dism.exe" -ArgumentList "/Online /Cleanup-Image /RestoreHealth /LogPath:$dismlog" -Wait
$sourcedirectx = "https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe"
$destinationdirectx = "$env:TEMP\directx_Jun2010_redist.exe"
Invoke-WebRequest -Uri $sourcedirectx -OutFile "$destinationdirectx"
$sourcevcredisx86 = "https://aka.ms/vs/16/release/vc_redist.x86.exe"
$destinationvcredisx86 = "$env:TEMP\vc_redist.x86.exe"
Invoke-WebRequest -Uri $sourcevcredisx86 -OutFile "$destinationvcredisx86"
$sourcevcredisx64 = "https://aka.ms/vs/16/release/vc_redist.x64.exe"
$destinationvcredisx64 = "$env:TEMP\vc_redist.x64.exe"
Invoke-WebRequest -Uri $sourcevcredisx64 -OutFile "$destinationvcredisx64"
$dxsetup = "$env:TEMP\DirectXInstaller\DXSETUP.exe"
if (Test-Path -Path "$env:TEMP\DirectXInstaller") {
    Remove-Item -Path "$env:TEMP\DirectXInstaller" -Recurse
    Start-Process -FilePath "$destinationdirectx" -ArgumentList "/Q /T:$env:TEMP\DirectXInstaller\" -Wait
    Start-Process -FilePath "$dxsetup" -ArgumentList "/silent" -Wait
} else {
    Start-Process -FilePath "$destinationdirectx" -ArgumentList "/Q /T:$env:TEMP\DirectXInstaller\" -Wait
    Start-Process -FilePath "$dxsetup" -ArgumentList "/silent" -Wait
}
Start-Process -FilePath "$destinationvcredisx86" -ArgumentList "/install /quiet /norestart" -Wait
Start-Process -FilePath "$destinationvcredisx64" -ArgumentList "/install /quiet /norestart" -Wait
Remove-Item -Path "$destinationdirectx"
Remove-Item -Path "$env:TEMP\DirectXInstaller" -Recurse
Remove-Item -Path "$destinationvcredisx86"
Remove-Item -Path "$destinationvcredisx64"
if (Test-Path $env:TEMP\SCSTRepair.log) {
    Remove-Item -Path "$env:TEMP\SCSTRepair.log"
}
else {
    New-Item "$env:TEMP\SCSTRepair.log"
}
$scstlog = "$env:TEMP\SCSTRepair.log"
Add-Content -Path "$scstlog" -Value "`r`nSFC LOG BEGINS HERE" -Encoding utf8
$sr = Get-Content c:\windows\Logs\CBS\CBS.log | Where-Object {$_.Contains("[SR]")} | Select-object -Property @{Name="LastCheckDate"; Expression = {$_.substring(0,10)}} -last 1
Get-Content c:\windows\Logs\CBS\CBS.log | where-object {$_.Contains("[SR]") -and $_.Contains($sr.lastcheckdate)} | Select-String -notmatch "Verify complete","Verifying","Beginning Verify and Repair" | Out-File -FilePath "$scstlog" -Encoding utf8 -Append
Add-Content -Path "$scstlog" -Value "`r`nDISM LOG BEGINS HERE" -Encoding UTF8
$getdismlog = Get-Content -Path "$env:TEMP\SCST-DISM.log"
Add-Content -Path "$scstlog" -Value "$getdismlog" -Encoding UTF8
Remove-Item -Path "$env:TEMP\SCST-DISM.log"
}




Remove-Item -Path "$scstlog"