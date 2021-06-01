##
#SCST v1.5.0
##
$ResetWinFWButton_Click = {
  FWWarningForm
}
$MSUpdateButton_Click = {
  MSUWaitWarningForm
}
$ResetNetButton_Click = {
  NetWarningForm
}
$ResetAppDataButton_Click = {
  LocalAppDataRename
}
$LauncherWindow_Load = {
}
$CloseButton_Click = {
  Cleanup -Wait
  $LauncherWindow.Close()
}
$RepairToolButton_Click = {
  $RepairToolButton.Enabled = $false
  if ($null = $discordusername) {}
  else {DiscordUserNameEntryForm}
  if ($null = $discordusername) {RepairWaitWarningForm}
  else {DiscordUserNameEntryForm}
}
$DataCollectorButton_Click = {
  $DataCollectorButton.Enabled = $false
  if ($null = $discordusername) {}
  else {DiscordUserNameEntryForm}
  if ($null = $discordusername) {DataCollector}
  else {DiscordUserNameEntryForm}
  $CloseButton.Enabled = $true
}
$AcceptCheckbox_CheckedChanged = {
  if ($AcceptCheckBox.Checked) {$DataCollectorButton.Visible = $true}
  else {$DataCollectorButton.Visible = $false}
  if ($AcceptCheckBox.Checked) {$RepairToolButton.Visible = $true}
  else {$RepairToolButton.Visible = $false}
}
###
#Variables
###
$scavlocal = "$env:LOCALAPPDATA\Scavenger"
$scavlocalnewname = "$env:LOCALAPPDATA\ScavengerBAK$(get-date -format yyyymmdd-hhmm)"
$scstinfo = "$env:temp\SCSTInfo.log"
$scstrepair = "$env:temp\SCSTRepair.log"
$scstdism = "$env:TEMP\SCSTDISM.log"
$msupdatelog = "$env:TEMP\MSUpdates.log"
$destinationdirectx = "$env:TEMP\directx_Jun2010_redist.exe"
$directxunpack = "$env:TEMP\DirectXInstaller\"
$dxsetup = "$env:TEMP\DirectXInstaller\DXSETUP.exe"
$destinationvcredisx86 = "$env:TEMP\vc_redist.x86.exe"
$destinationvcredisx64 = "$env:TEMP\vc_redist.x64.exe"
$zippedlogs = "$env:temp\SCSTBigLogs.Zip"
$sourcedirectx = "https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe"
$sourcevcredisx86 = "https://aka.ms/vs/16/release/vc_redist.x86.exe"
$sourcevcredisx64 = "https://aka.ms/vs/16/release/vc_redist.x64.exe"
###
#Variables END
###
###
#Functions
###
function FWWarningForm{
  . (Join-Path $PSScriptRoot 'FWWarningForm.ps1')
  . (Join-Path $PSScriptRoot 'FWWarningForm.designer.ps1')
  $FWWarningForm.ShowDialog()
}
function MSUWaitWarningForm{
  . (Join-Path $PSScriptRoot 'MSUWaitWarningForm.ps1')
  . (Join-Path $PSScriptRoot 'MSUWaitWarningForm.designer.ps1')
  $MSUWaitWarningForm.ShowDialog()
}
function DiscordUserNameEntryForm{
  . (Join-Path $PSScriptRoot 'DiscordUNForm.ps1')
  . (Join-Path $PSScriptRoot 'DiscordUNForm.designer.ps1')
  $DiscordUNEntryForm.ShowDialog()
}
function NetWarningForm{
  . (Join-Path $PSScriptRoot 'NetWarningForm.ps1')
  . (Join-Path $PSScriptRoot 'NetWarningForm.designer.ps1')
  $NetWarningForm.ShowDialog()
}
function RepairWaitWarningForm{
  . (Join-Path $PSScriptRoot 'RepairWaitWarningForm.ps1')
  . (Join-Path $PSScriptRoot 'RepairWaitWarningForm.designer.ps1')
  $RepairWaitWarningForm.ShowDialog()
}
function MSUpdate{
  $msupdatelog = "$env:USERPROFILE\Desktop\MSUpdates.log"
  Add-Content -Path "$msupdatelog" -Value "`r`nMSUPDATE STARTS HERE EACH RUN" -Encoding UTF8
  write-host "Install-PackageProvider -Name NuGet -RequiredVersion 2.8.5.201 -Force"
  Install-PackageProvider -Name NuGet -RequiredVersion 2.8.5.201 -Force
  write-host "Set-PSRepository PSGallery -InstallationPolicy Trusted"
  Set-PSRepository PSGallery -InstallationPolicy Trusted
  write-host "Install-Module PSWindowsUpdate"
  Install-Module PSWindowsUpdate
  write-host "Set-ExecutionPolicy RemoteSigned -Force"
  Set-ExecutionPolicy RemoteSigned -Force
  write-host "Import-Module -Name PSWindowsUpdate"
  Import-Module -Name PSWindowsUpdate
  write-host "Add-WUServiceManager -MicrosoftUpdate -Confirm:$false"
  Add-WUServiceManager -MicrosoftUpdate -Confirm:$false
  write-host "Get-WindowsUpdate -MicrosoftUpdate -NotTitle 'Preview'"
  Get-WindowsUpdate -MicrosoftUpdate -NotTitle "Preview" 
  write-host "Install-WindowsUpdate -MicrosoftUpdate -NotTitle 'Preview' -AcceptAll -IgnoreReboot | Select-Object -Property Result,KB,Size,Title | Out-File '$msupdatelog' -Append -Encoding UTF8"
  Install-WindowsUpdate -MicrosoftUpdate -NotTitle "Preview" -AcceptAll -IgnoreReboot | Select-Object -Property Result,KB,Size,Title | Out-File "$msupdatelog" -Append -Encoding UTF8
  write-host "Set-PSRepository PSGallery -InstallationPolicy Untrusted"
  Set-PSRepository PSGallery -InstallationPolicy Untrusted
  Set-Variable uploadtype "MSUpdates"
  Set-Variable logfiletoupload "$msupdatelog"
  UploadtoDiscordSmallText -Wait
}

function ResetNetwork{
  Write-Host "netsh winsock reset catalog"
  netsh winsock reset catalog
  Write-Host "netsh interface ipv4 reset"
  netsh interface ipv4 reset
  Write-Host "netsh interface ipv6 reset"
  netsh interface ipv6 reset
  Write-Host "arp d"
  arp d
  Write-Host "netsh winsock reset"
  netsh winsock reset
  Write-Host "netsh int tcp reset"
  netsh int tcp reset
  Write-Host "netsh int ip reset"
  netsh int ip reset
  Write-Host "netsh int ip delete neighbors"
  netsh int ip delete neighbors
  Write-Host "netsh int ip delete destinationcache"
  netsh int ip delete destinationcache
  Write-Host "netsh int ip delete arpcache"
  netsh int ip delete arpcache
  Write-Host "ipconfig /flushDNS"
  ipconfig /flushDNS
  Write-Host "ipconfig /registerDNS"
  ipconfig /registerDNS
  Write-Host "ipconfig /displayDNS"
  ipconfig /displayDNS
  Write-Host "NBTStat -R"
  NBTStat -R
  Write-Host "NBTStat -RR"
  NBTStat -RR
  RestartComputer
}
function ResetWinFW{
  Write-Host "netsh advfirewall reset"
  netsh advfirewall reset
  RestartComputer
}
function CompressLogs{
  $compress = @{
    LiteralPath = "$scstdism", "$msupdatelog"
    CompressionLevel = "Fastest"
    DestinationPath = "$zippedlogs"
  }
  Compress-Archive @compress
}
function UploadtoDiscordSmallText{
#$Uri = $TestUri
$Uri = $OfficialUri
  $content = @"
$discordusername Submitted this $uploadtype log file.
"@
  $payload = [pscustomobject]@{
    content = $content
  }
  Invoke-RestMethod -Uri $Uri -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'Application/Json'
  function Submit-TextFile ($filePath,$Uri) {
    $filename = (Get-ChildItem $filePath).Name
    $filecontents = Get-Content $filePath -Raw
    $boundary = [guid]::NewGuid().ToString()
    $contentinfo = "Content-Disposition: form-data; name=`"file`"; filename=`"$filename`"`nContent-Type: text/html; charset=utf-8`n"
    $body = "--$boundary`n$contentinfo`n$filecontents`n--$boundary--`n"
    $params = @{
      Uri = $Uri
      Body = $body
      Method = 'Post'
      ContentType = "multipart/form-data; boundary=$boundary"
    }
    Invoke-RestMethod @params
  }
  $filePath = (Get-Item $logfiletoupload).FullName
  Submit-TextFile $filePath $Uri
}
function UploadtoDiscordZipped ($filePath, $Uri) {
$Uri = $TestUri
#$Uri = $OfficialUri
    $filename = (Get-ChildItem $filePath).Name
    $fileBytes = [System.IO.File]::ReadAllBytes($filePath)
    $filecontents = [System.Text.Encoding]::GetEncoding("ISO-8859-1").GetString($fileBytes)
    $boundary = [guid]::NewGuid().ToString()
    $contentinfo = "Content-Disposition: form-data; name=`"file`"; filename=`"$filename`"`n"
    $contentinfo += "Content-Type: application/x-zip-compressed`n"
    $contentinfo += "Content-Length: $($filecontents.Length)`n"
    $body = "--$boundary`n$contentinfo`n$filecontents`n--$boundary--`n"
    $params = @{
      Uri         = $Uri
      Body        = $body
      Method      = 'Post'
      ContentType = "multipart/form-data; boundary=$boundary"
    }
    Invoke-RestMethod @params | ConvertTo-Json -Depth 99 | Set-Content sf.json
  }
  $filePath = (Get-Item $zippedlogs).FullName
  UploadtoDiscordZipped $filePath $Uri
}
function Cleanup{
  $msgBox =  [System.Windows.MessageBox]::Show("Cleaning up files we download/created please wait until the tool fully closes. Press OK to continue.",'SCST','Ok','Exclamation')
  if (Test-Path $scstinfo) {Remove-Item -Path "$scstinfo"}
  if (Test-Path $scstrepair) {Remove-Item -Path "$scstrepair"}
  if (Test-Path $scstdism) {Remove-Item -Path "$scstdism"}
  if (Test-Path $destinationdirectx) {Remove-Item -Path "$destinationdirectx"}
  if (Test-Path $directxunpack) {Remove-Item -Path "$directxunpack" -Recurse}
  if (Test-Path $destinationvcredisx86) {Remove-Item -Path "$destinationvcredisx86"}
  if (Test-Path $destinationvcredisx64) {Remove-Item -Path "$destinationvcredisx64"}
  if (Test-Path $zippedlogs) {Remove-Item -Path "$zippedlogs"}
}
function DataCollector{
  Start-Sleep 1
  Write-Host "Data Collection Starting"
  if (Test-Path $scstinfo) {Remove-Item -Path "$scstinfo"}
  else {New-Item "$scstinfo"}
  Get-ComputerInfo | Select-Object WindowsProductName,WindowsVersion,OsHardwareAbstractionLayer | Out-File -FilePath "$scstinfo" -Encoding UTF8 -Force
  Get-CimInstance -ClassName CIM_Processor | Select-Object -Property Name,MaxClockSpeed,SocketDesignation,Manufacturer | Out-File -FilePath "$scstinfo" -Encoding UTF8 -Append
  Get-CimInstance -ClassName CIM_VideoController | Format-Table -AutoSize -Property Name,@{Name = "CrtHorizontalRes"; Expression = {($_.CurrentHorizontalResolution)}},@{Name = "CrtVerticalRes"; Expression = {($_.CurrentVerticalResolution)}},@{Name = "CrtRefreshRate"; Expression = {($_.CurrentRefreshRate)}},@{Name = "AdapterRamGB"; Expression = {[int]($_.AdapterRam / 1GB)}},DriverVersion | Out-File -FilePath "$scstinfo" -Encoding UTF8 -Append
  Get-CimInstance -ClassName CIM_PhysicalMemory | Format-Table -AutoSize Manufacturer,PartNumber,Speed,DeviceLocator,@{ Name = "CapacityGB"; Expression = {[int]($_.Capacity / 1GB)}} | Out-File -FilePath "$scstinfo" -Encoding UTF8 -Append
  Get-CimInstance -ClassName CIM_DiskDrive | Format-Table -AutoSize DeviceID,Model,@{ Name = "SizeGB"; Expression = { [int]($_.Size / 1GB) } } | Out-File -FilePath "$scstinfo" -Encoding UTF8 -Append
  Get-CimInstance -ClassName CIM_LogicalDisk | Format-Table -AutoSize DeviceID,@{ Name = "SizeGB"; Expression = { [int]($_.Size / 1GB) } } | Out-File -FilePath "$scstinfo" -Encoding UTF8 -Append
  Start-Sleep 1
  Write-Host "Now uploading system info to Discord"
  Set-Variable uploadtype "Info"
  Set-Variable logfiletoupload "$scstinfo"
  UploadtoDiscordSmallText -Wait
  Write-Host "Uploading system info to Discord finished"
  Write-Host "Data collection complete"
}
function Repair{
  $CloseButton.Enabled = $false
  $DataCollectorButton.Enabled = $false
  $RepairToolButton.Enabled = $false
  Write-Host "Repair Process Starting"
  if (Test-Path "$scstdism") {}
  else { New-Item "$scstdism" }
  Write-Host "Now running the Windows System File Checker"
  Start-Process -FilePath "$env:SystemRoot\System32\sfc.exe" -ArgumentList "/scannow" -Wait -NoNewWindow
  Write-Host "Now running the Windows DISM Tool"
  Start-Process -FilePath "$env:SystemRoot\System32\Dism.exe" -ArgumentList "/Online /Cleanup-Image /RestoreHealth /LogPath:$scstdism" -Wait -NoNewWindow
  Write-Host "Now downloading the latest DirectX Redistributable From Microsoft"
  Invoke-WebRequest -Uri $sourcedirectx -OutFile "$destinationdirectx"
  Write-Host "Now downloading the latest Visual C++ 32bit Redistributable From Microsoft"
  Invoke-WebRequest -Uri $sourcevcredisx86 -OutFile "$destinationvcredisx86"
  Write-Host "Now downloading the latest Visual C++ 64bit Redistributable From Microsoft"
  Invoke-WebRequest -Uri $sourcevcredisx64 -OutFile "$destinationvcredisx64"
  Write-Host "Now unpacking and installing the DirectX Redistributable"
  if (Test-Path -Path "$directxunpack") {Remove-Item -Path "$directxunpack" -Recurse
    Start-Process -FilePath "$destinationdirectx" -ArgumentList "/Q /T:$directxunpack" -Wait
    Start-Process -FilePath "$dxsetup" -ArgumentList "/silent" -Wait}
  else { Start-Process -FilePath "$destinationdirectx" -ArgumentList "/Q /T:$directxunpack" -Wait
    Start-Process -FilePath "$dxsetup" -ArgumentList "/silent" -Wait }
  Write-Host "Now installing the Visual C++ 32bit Redistributable"
  Start-Process -FilePath "$destinationvcredisx86" -ArgumentList "/install /quiet /norestart" -Wait
  Write-Host "Now installing the Visual C++ 64bit Redistributable"
  Start-Process -FilePath "$destinationvcredisx64" -ArgumentList "/install /quiet /norestart" -Wait
  Write-Host "Now building our log file"
  if (Test-Path $scstrepair) {Remove-Item -Path "$scstrepair"}
  else {New-Item "$scstrepair"}
  Add-Content -Path "$scstrepair" -Value "`r`nSFC LOG BEGINS HERE" -Encoding UTF8
  $sr = Get-Content c:\windows\Logs\CBS\CBS.log | Where-Object { $_.Contains("[SR]") } | Select-Object -Property @{ Name = "LastCheckDate"; Expression = { $_.substring(0,10) } } -Last 1
  Get-Content c:\windows\Logs\CBS\CBS.log | Where-Object { $_.Contains("[SR]") -and $_.Contains($sr.lastcheckdate) } | Select-String -NotMatch "Verify complete","Verifying","Beginning Verify and Repair" | Out-File -FilePath "$scstrepair" -Encoding UTF8 -Append
  Add-Content -Path "$scstrepair" -Value "`r`nDISM LOG BEGINS HERE" -Encoding UTF8
  $getscstdism = Get-Content -Raw -Path "$scstdism"
  Add-Content -Path "$scstrepair" -Value "$getscstdism" -Encoding UTF8
  Start-Sleep 1
  DataCollector -Wait
  Set-Variable uploadtype "Repair"
  Set-Variable logfiletoupload "$scstrepair"
  Write-Host "Now collecting, compressing, and uploading our repair log files to Discord"
  UploadtoDiscordSmallText -Wait
  Write-Host "Uploading to Discord finished"
  Write-Host "Repair Process Finished."
  RestartComputer
  $CloseButton.Enabled = $true
  $LauncherWindow.Close()
}
function Test-PendingReboot{
 if (Get-ChildItem "HKLM:\Software\Microsoft\Windows\CurrentVersion\Component Based Servicing\RebootPending" -EA Ignore) { return $true }
 if (Get-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update\RebootRequired" -EA Ignore) { return $true }
 if (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager" -Name PendingFileRenameOperations -EA Ignore) { return $true }
 try { 
   $util = [wmiclass]"\\.\root\ccm\clientsdk:CCM_ClientUtilities"
   $status = $util.DetermineIfRebootPending()
   if(($status -ne $null) -and $status.RebootPending){
     return $true
   }
 }catch{}
 return $false
}
function RestartComputer{
  $msgBox =  [System.Windows.MessageBox]::Show("You must restart your computer.`r`n`r`nMake sure to save your work!`r`n`r`nPress Ok to continue and restart now.",'SCST','Ok','Exclamation')
  switch  ($msgBox) {'Ok' {shutdown /r /f}}
}
function LocalAppDataRename{
  if (Test-Path "$scavlocal") {Rename-Item -Path "$scavlocal" -NewName "$scavlocalnewname"
    $msgBox =  [System.Windows.MessageBox]::Show("Your LocalAppData Scavengers folder has`r`nbeen renamed to $scavlocalnewname`r`n`r`nPlease close the tool and relaunch the game.",'SCST','Ok','Information')}
  else {$msgBox = [System.Windows.MessageBox]::Show("Unable to locate the folder.`r`nPlease post this in the Official Scavengers Discord Technical-Issues channel for assistance.",'SCST','Ok','Error')}
}
###
#Functions END
###
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms
.(Join-Path $PSScriptRoot 'ScavengersCST.keys.ps1')
.(Join-Path $PSScriptRoot 'ScavengersCST.designer.ps1')
$LauncherWindow.ShowDialog()