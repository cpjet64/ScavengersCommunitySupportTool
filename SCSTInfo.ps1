Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
 if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
  $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
  Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
  Exit
 }
}
if (Test-Path $scstinfo) {
  }
  else {
    New-Item "$env:temp\SCSTInfo.log"
  }
$scstinfo = "$env:temp\SCSTInfo.log"
Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsHardwareAbstractionLayer | Out-File -FilePath "$scstinfo" -Encoding utf8 -Force
Get-CimInstance -ClassName CIM_Processor | Select-Object -Property Name, MaxClockSpeed, SocketDesignation, Manufacturer | Out-File -FilePath "$scstinfo" -Encoding utf8 -Append
Get-CimInstance -ClassName CIM_VideoController | Format-Table -AutoSize -Property Name, CurrentHorizontalResolution, CurrentVerticalResolution, CurrentRefreshRate, @{Name="AdapterRamGB"; Expression={[int]($_.AdapterRam/1GB)}}, DriverDate, DriverVersion | Out-File -FilePath "$scstinfo" -Encoding utf8 -Append
Get-CimInstance -ClassName CIM_PhysicalMemory | Format-Table -AutoSize Manufacturer, PartNumber, Speed, DeviceLocator, @{Name="CapacityGB"; Expression={[int]($_.Capacity/1GB)}} | Out-File -FilePath "$scstinfo" -Encoding utf8 -Append
Get-CimInstance -ClassName CIM_DiskDrive | Format-Table -AutoSize DeviceID, Model, @{Name="SizeGB"; Expression={[int]($_.Size/1GB)}} | Out-File -FilePath "$scstinfo" -Encoding utf8 -Append
Get-CimInstance -ClassName CIM_LogicalDisk | Format-Table -AutoSize DeviceID, @{Name="SizeGB"; Expression={[int]($_.Size/1GB)}} | Out-File -FilePath "$scstinfo" -Encoding utf8 -Append
$discordusernameentrysend = Get-Content -Path "$env:TEMP\SCSTDiscord.txt"
$Uri = 'https://discord.com/api/webhooks/838597970369708123/f95KX4IkB4qbt10eMdiW9SMyBEf_5uMPsr2vwXtoxNmE6OG4B0fFGM_KUesDb8wOTEJQ'
$content = @"

$discordusernameentrysend Submitted this log file.

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
$filePath = (Get-Item $scstinfo).FullName
Submit-TextFile $filePath $Uri