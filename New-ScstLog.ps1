function New-ScstLog($scstlog){

    # common args
    $outfile = @{FilePath=$scstlog;Encoding="utf8";Append=$true}

    # generate file
    $ProgressPreference = "SilentlyContinue" #hide progress bars
    Get-ComputerInfo | Select-Object WindowsProductName, WindowsVersion, OsHardwareAbstractionLayer | Out-File -FilePath "$scstlog" -Encoding utf8 -Force
    Get-CimInstance -ClassName CIM_Processor | Select-Object -Property Name, MaxClockSpeed, SocketDesignation, Manufacturer | Out-File @outfile
    Get-CimInstance -ClassName CIM_VideoController | Format-Table -AutoSize -Property Name, CurrentHorizontalResolution, CurrentVerticalResolution, CurrentRefreshRate, @{Name="AdapterRamGB"; Expression={[int]($_.AdapterRam/1GB)}}, DriverDate, DriverVersion | Out-File @outfile
    Get-CimInstance -ClassName CIM_PhysicalMemory | Format-Table -AutoSize Manufacturer, PartNumber, Speed, DeviceLocator, @{Name="CapacityGB"; Expression={[int]($_.Capacity/1GB)}} | Out-File @outfile
    Get-CimInstance -ClassName CIM_DiskDrive | Format-Table -AutoSize DeviceID, Model, @{Name="SizeGB"; Expression={[int]($_.Size/1GB)}} | Out-File @outfile
    Get-CimInstance -ClassName CIM_LogicalDisk | Format-Table -AutoSize DeviceID, @{Name="SizeGB"; Expression={[int]($_.Size/1GB)}} | Out-File @outfile

    # return file exists bool
    Test-Path $scstlog
    
}