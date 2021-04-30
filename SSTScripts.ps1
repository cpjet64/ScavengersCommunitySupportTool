Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

##
#The section above allows us to run a Powershell script that isnt signed ONCE and ONLY DURING THIS SESSION
##

#Variables
$sstpath = "$env:UserProfile\Downloads\SST"
$sstlog = "$sstpath\SST.log"
$dismlog = Get-Content -Path "$env:UserProfile\downloads\SST\SST-DISM.log"
$sourcedirectx = "https://download.microsoft.com/download/8/4/A/84A35BF1-DAFE-4AE8-82AF-AD2AE20B6B14/directx_Jun2010_redist.exe"
$destinationdirectx = "$env:UserProfile\downloads\SST\directx_Jun2010_redist.exe"
$sourcevcredisx86 = "https://aka.ms/vs/16/release/vc_redist.x86.exe"
$destinationvcredisx86 = "$env:UserProfile\downloads\SST\vc_redist.x86.exe"
$sourcevcredisx64 = "https://aka.ms/vs/16/release/vc_redist.x64.exe"
$destinationvcredisx64 = "$env:UserProfile\downloads\SST\vc_redist.x64.exe"
$dxsetup = "$env:UserProfile\Downloads\SST\DirectXInstaller\DXSETUP.exe"

##
#This section gathers information about the computer specs and creates and appends the data to the SST logfile
##
Get-ComputerInfo | select WindowsProductName, WindowsVersion, OsHardwareAbstractionLayer | Out-File -FilePath "$sstlog" -Encoding utf8 -Force

Get-CimInstance -ClassName CIM_Processor | Select-Object -Property Name, MaxClockSpeed, SocketDesignation, Manufacturer | Out-File -FilePath "$sstlog" -Encoding utf8 -Append

Get-CimInstance -ClassName CIM_VideoController | Format-Table -AutoSize Name, CurrentHorizontalResolution, CurrentVerticalResolution, CurrentRefreshRate, @{Name="AdapterRamGB"; Expression={[int]($_.AdapterRam/1GB)}}, DriverDate, DriverVersion | Out-File -FilePath "$sstlog" -Encoding utf8 -Append

Get-CimInstance -ClassName CIM_PhysicalMemory | Format-Table -AutoSize Manufacturer, PartNumber, Speed, DeviceLocator, @{Name="CapacityGB"; Expression={[int]($_.Capacity/1GB)}} | Out-File -FilePath "$sstlog" -Encoding utf8 -Append

Get-CimInstance -ClassName CIM_DiskDrive | Format-Table -AutoSize DeviceID, Model, @{Name="SizeGB"; Expression={[int]($_.Size/1GB)}} | Out-File -FilePath "$sstlog" -Encoding utf8 -Append

Get-CimInstance -ClassName CIM_LogicalDisk | Format-Table -AutoSize DeviceID, @{Name="SizeGB"; Expression={[int]($_.Size/1GB)}} | Out-File -FilePath "$sstlog" -Encoding utf8 -Append

##
#This section collects the logs for System File Checker within the last day and appends it to the SST logfile
##

Add-Content -Path "$sstlog" -Value "`r`nSFC LOG"

$sr = get-content c:\windows\Logs\CBS\CBS.log | where {$_.Contains("[SR]")} | Select-object -Property @{Name="LastCheckDate"; Expression = {$_.substring(0,10)}} -last 1
get-content c:\windows\Logs\CBS\CBS.log | where-object {$_.Contains("[SR]") -and $_.Contains($sr.lastcheckdate)} | Select-String -notmatch "Verify complete","Verifying","Beginning Verify and Repair" | Out-File -FilePath "$sstlog" -Encoding utf8 -Append

##
#This section collects the custom log for DISM and appends it to the SST logfile then deletes the custom logfile because housekeeping is important
##

Add-Content -Path "$sstlog" -Value "`r`nDISM LOG"

Add-Content -Path "$sstlog" -Value $dismlog

Remove-Item -Path "$sstpath\SST-DISM.log"

##
#This section downloads all of the lastest DirectX and Visual C++ Redistributables to the SST folder and then installs them silently and ensures the system does not automatically restart as we want the user to restart manually when we tell them to.
##

Invoke-WebRequest -Uri $sourcedirectx -OutFile $destinationdirectx

Invoke-WebRequest -Uri $sourcevcredisx86 -OutFile $destinationvcredisx86

Invoke-WebRequest -Uri $sourcevcredisx64 -OutFile $destinationvcredisx64

Start-Process -FilePath $destinationdirectx -ArgumentList “/Q /T:$sstpath\DirectXInstaller\” -Wait

Start-Process -FilePath $dxsetup -ArgumentList “/silent” -Wait

Start-Process -FilePath $destinationvcredisx86 -ArgumentList “/install /quiet /norestart” -Wait

Start-Process -FilePath $destinationvcredisx64 -ArgumentList “/install /quiet /norestart” -Wait