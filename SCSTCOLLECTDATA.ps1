Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

#set location to script path
Set-Location (Split-Path -Parent $MyInvocation.MyCommand.Path)

###
#BEGIN SELF ELEVATE TO ADMIN
###

# Self-elevate the script if not already running as administrator
if (-Not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] 'Administrator')) {
 if ([int](Get-CimInstance -Class Win32_OperatingSystem | Select-Object -ExpandProperty BuildNumber) -ge 6000) {
  $CommandLine = "-File `"" + $MyInvocation.MyCommand.Path + "`" " + $MyInvocation.UnboundArguments
  Start-Process -FilePath PowerShell.exe -Verb Runas -ArgumentList $CommandLine
  Exit
 }
}

###
#END SELF ELEVATE TO ADMIN
###


##
#The section above allows us to run a Powershell script that isnt signed ONCE and ONLY DURING THIS SESSION
##

##
#BEGIN VARIABLES
##

$PSTitle = "Scavengers Community Support Tool Data Only"

$host.UI.RawUI.WindowTitle = $PSTitle

$scstlog = "$env:USERPROFILE\Downloads\SCSTInfo.log"

##
#END VARIABLES
##

##
#BEGIN LOGGING This section gathers information about the computer specs and creates and appends the data to the SST logfile.
##

Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsHardwareAbstractionLayer | Out-File -FilePath "$scstlog" -Encoding utf8 -Force

Get-CimInstance -ClassName CIM_Processor | Select-Object -Property Name, MaxClockSpeed, SocketDesignation, Manufacturer | Out-File -FilePath "$scstlog" -Encoding utf8 -Append

Get-CimInstance -ClassName CIM_VideoController | Format-Table -AutoSize -Property Name, CurrentHorizontalResolution, CurrentVerticalResolution, CurrentRefreshRate, @{Name="AdapterRamGB"; Expression={[int]($_.AdapterRam/1GB)}}, DriverDate, DriverVersion | Out-File -FilePath "$scstlog" -Encoding utf8 -Append

Get-CimInstance -ClassName CIM_PhysicalMemory | Format-Table -AutoSize Manufacturer, PartNumber, Speed, DeviceLocator, @{Name="CapacityGB"; Expression={[int]($_.Capacity/1GB)}} | Out-File -FilePath "$scstlog" -Encoding utf8 -Append

Get-CimInstance -ClassName CIM_DiskDrive | Format-Table -AutoSize DeviceID, Model, @{Name="SizeGB"; Expression={[int]($_.Size/1GB)}} | Out-File -FilePath "$scstlog" -Encoding utf8 -Append

Get-CimInstance -ClassName CIM_LogicalDisk | Format-Table -AutoSize DeviceID, @{Name="SizeGB"; Expression={[int]($_.Size/1GB)}} | Out-File -FilePath "$scstlog" -Encoding utf8 -Append

##
#END LOGGING
##

##
#BEGIN LOG TRANSMITTAL Here we are automatically posting the SST.log file to the discord for dev tracking and troubleshooting.
##



##
#END LOG TRANSMITTAL
##

##
#BEGIN HOUSEKEEPING Here we are removing all of the files and folders we created during the process so we arent leaving things behind.
##

#Remove-Item -Path "$env:TEMP\SCST.log"

##
#END HOUSEKEEPING
##
