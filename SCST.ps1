Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

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
#
#TESTING ONLY VARIABLES MAKE SURE IF YOU ENABLE IT HERE YOU DISABLE ITS MATCH BELOW
#
#$sstpath = "C:\DIRECTPATHGOESHEREFORTESTING"
#
#

$PSTitle = "Scavengers Community Support Tool"

$host.UI.RawUI.WindowTitle = $PSTitle

$scstpath = "$PSScriptRoot"

New-Item "$sstpath\ScavengersCST.log"

$scstlog = "$sstpath\ScavengersCST.log"

$dismlog = "$env:TEMP\ScavengersCST-DISM.log"

$getdismlog = Get-Content -Path "$env:TEMP\ScavengersCST-DISM.log"

$repairtools = "%SYSTEMROOT%\System32"

$sourcedirectx = "https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe"

$destinationdirectx = "$env:TEMP\directx_Jun2010_redist.exe"

$sourcevcredisx86 = "https://aka.ms/vs/16/release/vc_redist.x86.exe"

$destinationvcredisx86 = "$env:TEMP\vc_redist.x86.exe"

$sourcevcredisx64 = "https://aka.ms/vs/16/release/vc_redist.x64.exe"

$destinationvcredisx64 = "$env:TEMP\vc_redist.x64.exe"

$dxsetup = "$env:TEMP\DirectXInstaller\DXSETUP.exe"

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
#BEGIN REPAIR OPERATION
##

$repairtools = "%SYSTEMROOT%\System32"
$dismlog = "$env:TEMP\ScavengersCST-DISM.log"


#Start-Process -FilePath "$repairtools\sfc.exe" -ArgumentList "/scannow" -Wait

Start-Process -FilePath "$repairtools\DISM.exe" -ArgumentList "/Online /Cleanup-Image /RestoreHealth /LogPath:$dismlog" -Wait

##
#END REPAIR OPERATION
##

##
#BEGIN LOGFILE COMPILATION This section collects the logs for System File Checker within the last day and appends it to the SST logfile
##

Add-Content -Path "$sstlog" -Value "`r`nSFC LOG BEGINS HERE"

$sr = get-content c:\windows\Logs\CBS\CBS.log | Where-Object {$_.Contains("[SR]")} | Select-object -Property @{Name="LastCheckDate"; Expression = {$_.substring(0,10)}} -last 1
get-content c:\windows\Logs\CBS\CBS.log | where-object {$_.Contains("[SR]") -and $_.Contains($sr.lastcheckdate)} | Select-String -notmatch "Verify complete","Verifying","Beginning Verify and Repair" | Out-File -FilePath "$scstlog" -Encoding utf8 -Append

#This section collects the custom log for DISM and appends it to the SST logfile then deletes the custom logfile because housekeeping is important

Add-Content -Path "$sstlog" -Value "`r`nDISM LOG BEGINS HERE"

Add-Content -Path "$sstlog" -Value "$getdismlog"

##
#END LOGFILE COMPILATION 
##

##
#BEGIN FILE DOWNLOADS AND INSTALLS This section downloads all of the lastest DirectX and Visual C++ Redistributables to the SST folder and then installs them silently and ensures the system does not automatically restart as we want the user to restart manually when we tell them to.
##

Invoke-WebRequest -Uri $sourcedirectx -OutFile "$destinationdirectx"

Invoke-WebRequest -Uri $sourcevcredisx86 -OutFile "$destinationvcredisx86"

Invoke-WebRequest -Uri $sourcevcredisx64 -OutFile "$destinationvcredisx64"

##
#Extracting the redists to the temp folder to avoid issues with stupid spaces.
##

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

##
#END FILE DOWNLOADS AND INSTALLS
##

##
#BEGIN HOUSEKEEPING Here we are removing all of the files and folders we created during the process so we arent leaving things behind.
##

Remove-Item -Path "$env:TEMP\SST-DISM.log"

Remove-Item -Path "$destinationdirectx"

Remove-Item -Path "$env:TEMP\DirectXInstaller" -Recurse

Remove-Item -Path "$destinationvcredisx86"

Remove-Item -Path "$destinationvcredisx64"

##
#END HOUSEKEEPING
##

##
#BEGIN LOG TRANSMITTAL Here we are automatically posting the SST.log file to the discord for dev tracking and troubleshooting.
##


##
#BEGIN MESSAGE BOXES
##
#Add-Type -AssemblyName PresentationFramework
#Add-Type -AssemblyName System.Windows.Forms

#[void] [System.Reflection.Assembly]::LoadWithPartialName("Microsoft.VisualBasic") 
#[Microsoft.VisualBasic.Interaction]::MsgBox("This is a UNOFFICIAL tool created by the community for the community. This tool is NOT supported by the game's developer.", "OK,SystemModal,Information,DefaultButton1", "$PSTitle")
#[Microsoft.VisualBasic.Interaction]::MsgBox("Upon completion this tool will automatically send a logfile to the developers to assist in issue tracking and issue resolution. If you are not ok with this then please press cancel and remove this tool from your system.", "'I Accept'Cancel,SystemModal,Information,DefaultButton2", "$PSTitle")
#[Microsoft.VisualBasic.Interaction]::MsgBox("Is this a pirated version of Windows?", "YesNo,SystemModal,Information,DefaultButton2", "$PSTitle")
#[Microsoft.VisualBasic.Interaction]::MsgBox("Pirate versions of Windows are not supported. Please install a Official version.", "OK,SystemModal,Information,DefaultButton2", "$PSTitle")
#[Microsoft.VisualBasic.Interaction]::MsgBox("Have you already run Windows Update and installed all Cumulative, Optional, and Required Updates?", "YesNo,SystemModal,Information,DefaultButton2", "$PSTitle")
#[Microsoft.VisualBasic.Interaction]::MsgBox("Please run Windows Update and install all Cumulative, Optional, and Required Updates before proceeding", "OK,SystemModal,Information,DefaultButton2", "$PSTitle")
#[Microsoft.VisualBasic.Interaction]::MsgBox("Please do not use your computer while this tool is running.", "OK,SystemModal,Information,DefaultButton2", "$PSTitle")
#[Microsoft.VisualBasic.Interaction]::MsgBox("The tool has finished. Please restart your computer then verify your game files through your game launcher. Please contact Cpjet64 in the Official Discord if the tool did not resolve your issue.", "OK,SystemModal,Information,DefaultButton2", "$PSTitle")






##
#END MESSAGE BOXES
##




