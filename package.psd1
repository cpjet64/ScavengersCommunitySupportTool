@{
    Root = 'C:\GITHUBREPOS\ScavengersCommunitySupportTool\ScavengersCST.ps1'
    OutputPath = 'C:\GITHUBREPOS\ScavengersCommunitySupportTool\compiled'
    Package = @{
        Enabled = $true
        Obfuscate = $true
        HideConsoleWindow = $false
        DotNetVersion = 'v4.6.2'
        FileVersion = '1.5.0'
        FileDescription = 'Made by Cpjet64 and Hunhow'
        ProductName = 'Scavengers Community Support Tool'
        ProductVersion = ''
        Copyright = 'GNU GPL3'
        RequireElevation = $true
        ApplicationIconPath = ''
        PackageType = 'Console'
        Platform = 'x64'
    }
    Bundle = @{
        Enabled = $true
        Modules = $true
        # IgnoredModules = @()
    }
}
        