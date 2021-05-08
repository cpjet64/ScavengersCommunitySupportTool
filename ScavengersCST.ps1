Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
$CloseButton_Click = {
	$LauncherWindow.Close()
}
$DataCollectorButton_Click = {
	Set-Variable -name "scstinfo" -value "$env:temp\SCSTInfo.log"
	Set-Variable -name "uploadtype" -value "Info"
	usernameinput
	$CloseButton.Enabled = $false
	$DataCollectorButton.Enabled = $false
	$RepairToolButton.Enabled = $false
	start-Sleep 1
	CollectInfo -wait
	start-Sleep 1
	Set-Variable -name "logfiletoupload" -value "$scstinfo"
	UploadtoDiscord -wait
	Cleanup -wait
	$CloseButton.Enabled = $true
	$RepairToolButton.Enabled = $true
	$DataCollectorButton.Enabled = $true
}
$RepairToolButton_Click = {
	Set-Variable -name "scstinfo" -value "$env:temp\SCSTInfo.log"
	Set-Variable -name "scstrepair" -value "$env:temp\SCSTRepair.log"
	Set-Variable -name "uploadtype" -value "Repair"
	usernameinput
	$CloseButton.Enabled = $false
	$DataCollectorButton.Enabled = $false
	$RepairToolButton.Enabled = $false
	start-Sleep 1
	CollectInfo -wait
	Repair -wait
	start-Sleep 1
	Set-Variable -name "logfiletoupload" -value "$scstinfo"
	UploadtoDiscord -wait
	Set-Variable -name "logfiletoupload" -value "$scstrepair"
	UploadtoDiscord -wait
	Cleanup -wait
	$CloseButton.Enabled = $true
	$RepairToolButton.Enabled = $true
	$DataCollectorButton.Enabled = $true
}
$AcceptCheckbox_CheckedChanged = {
	if ($AcceptCheckBox.Checked) { $DataCollectorButton.Visible = $true }
	else { $DataCollectorButton.Visible = $false }
	if ($AcceptCheckBox.Checked) { $RepairToolButton.Visible = $true }
	else { $RepairToolButton.Visible = $false }
}
function usernameinput {
([void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic'))
$title = 'Scavengers Community Support Tool'
$msg   = 'Please Enter Your Discord Username Including the Numbers'
$discordusernameentry = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
if (Test-Path $env:TEMP\SCSTDiscord.txt) {
	Set-Content -Path "$env:TEMP\SCSTDiscord.txt" -Value "$discordusernameentry" -Encoding UTF8}
else {
	New-Item "$env:TEMP\SCSTDiscord.txt"
	Set-Content -Path "$env:TEMP\SCSTDiscord.txt" -Value "$discordusernameentry" -Encoding UTF8}
}
function UploadtoDiscord
{
$discordusername = Get-Content -Path "$env:temp\SCSTDiscord.txt" 
$TestUri = 'https://discord.com/api/webhooks/838597970369708123/f95KX4IkB4qbt10eMdiW9SMyBEf_5uMPsr2vwXtoxNmE6OG4B0fFGM_KUesDb8wOTEJQ'
$OfficialUri = 'https://discordapp.com/api/webhooks/839604797006938144/P0w_nD7lmD2tMh-Q8htVy3BqDNf4qnBsAohF1c7c_idOAvvfYwpSyumyUTHVSV9ht7mh'
$Uri = $TestUri
$content = @"

$discordusername Submitted this $uploadtype log file.

"@
$payload = [PSCustomObject]@{
    content = $content
}
Invoke-RestMethod -Uri $Uri -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'Application/Json'
function Submit-TextFile($filePath,$Uri){
    $filename = (Get-ChildItem $filePath).Name
    $filecontents = Get-Content $filePath -raw
    $boundary = [guid]::NewGuid().ToString()
    $contentinfo = "Content-Disposition: form-data; name=`"file`"; filename=`"$filename`"`nContent-Type: text/html; charset=utf-8`n"
    $body = "--$boundary`n$contentinfo`n$filecontents`n--$boundary--`n"
    $params = @{
        Uri         = $Uri
        Body        = $body
        Method      = 'Post'
        ContentType = "multipart/form-data; boundary=$boundary"
    }
    Invoke-RestMethod @params
}
$filePath = (Get-Item $logfiletoupload).FullName
Submit-TextFile $filePath $Uri
}
function Cleanup
{
if (Test-Path $env:TEMP\SCSTDiscord.txt) {
	Remove-Item -Path "$env:temp\SCSTDiscord.txt"}
else {}
if (Test-Path $env:temp\SCSTInfo.log) {
	Remove-Item -Path "$env:temp\SCSTInfo.log"}
else {}
if (Test-Path $env:temp\SCSTRepair.log) {
	Remove-Item -Path "$env:temp\SCSTRepair.log"}
else {}
if (Test-Path $env:temp\SCSTDISM.log) {
	Remove-Item -Path "$env:temp\SCSTDISM.log"}
else {}
}
function CollectInfo
{
if (Test-Path $scstinfo) {}
else {New-Item "$env:temp\SCSTInfo.log"}
Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsHardwareAbstractionLayer | Out-File -FilePath "$scstinfo" -Encoding utf8 -Force
Get-CimInstance -ClassName CIM_Processor | Select-Object -Property Name, MaxClockSpeed, SocketDesignation, Manufacturer | Out-File -FilePath "$scstinfo" -Encoding utf8 -Append
Get-CimInstance -ClassName CIM_VideoController | Format-Table -AutoSize -Property Name, CurrentHorizontalResolution, CurrentVerticalResolution, CurrentRefreshRate, @{Name="AdapterRamGB"; Expression={[int]($_.AdapterRam/1GB)}}, DriverDate, DriverVersion | Out-File -FilePath "$scstinfo" -Encoding utf8 -Append
Get-CimInstance -ClassName CIM_PhysicalMemory | Format-Table -AutoSize Manufacturer, PartNumber, Speed, DeviceLocator, @{Name="CapacityGB"; Expression={[int]($_.Capacity/1GB)}} | Out-File -FilePath "$scstinfo" -Encoding utf8 -Append
Get-CimInstance -ClassName CIM_DiskDrive | Format-Table -AutoSize DeviceID, Model, @{Name="SizeGB"; Expression={[int]($_.Size/1GB)}} | Out-File -FilePath "$scstinfo" -Encoding utf8 -Append
Get-CimInstance -ClassName CIM_LogicalDisk | Format-Table -AutoSize DeviceID, @{Name="SizeGB"; Expression={[int]($_.Size/1GB)}} | Out-File -FilePath "$scstinfo" -Encoding utf8 -Append
}
function Repair
{
$dismlog = "$env:TEMP\SCSTDISM.log"

if (Test-Path "$dismlog") {}
else {New-Item "$dismlog"}
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
    Start-Process -FilePath "$dxsetup" -ArgumentList "/silent" -Wait} 
else {Start-Process -FilePath "$destinationdirectx" -ArgumentList "/Q /T:$env:TEMP\DirectXInstaller\" -Wait
    Start-Process -FilePath "$dxsetup" -ArgumentList "/silent" -Wait}
Start-Process -FilePath "$destinationvcredisx86" -ArgumentList "/install /quiet /norestart" -Wait
Start-Process -FilePath "$destinationvcredisx64" -ArgumentList "/install /quiet /norestart" -Wait
Remove-Item -Path "$destinationdirectx"
Remove-Item -Path "$env:TEMP\DirectXInstaller" -Recurse
Remove-Item -Path "$destinationvcredisx86"
Remove-Item -Path "$destinationvcredisx64"
if (Test-Path $env:TEMP\SCSTRepair.log) {
    Remove-Item -Path "$env:TEMP\SCSTRepair.log"}
else {New-Item "$env:TEMP\SCSTRepair.log"}
$scstrepair = "$env:TEMP\SCSTRepair.log"
Add-Content -Path "$scstrepair" -Value "`r`nSFC LOG BEGINS HERE" -Encoding utf8
$sr = Get-Content c:\windows\Logs\CBS\CBS.log | Where-Object {$_.Contains("[SR]")} | Select-object -Property @{Name="LastCheckDate"; Expression = {$_.substring(0,10)}} -last 1
Get-Content c:\windows\Logs\CBS\CBS.log | where-object {$_.Contains("[SR]") -and $_.Contains($sr.lastcheckdate)} | Select-String -notmatch "Verify complete","Verifying","Beginning Verify and Repair" | Out-File -FilePath "$scstrepair" -Encoding utf8 -Append
Add-Content -Path "$scstrepair" -Value "`r`nDISM LOG BEGINS HERE" -Encoding UTF8
$getdismlog = Get-Content -Path "$env:TEMP\SCSTDISM.log"
Add-Content -Path "$scstrepair" -Value "$getdismlog" -Encoding UTF8
}
Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'ScavengersCST.designer.ps1')
$LauncherWindow.ShowDialog()