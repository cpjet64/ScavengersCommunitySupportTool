@{
    Root = 'c:\Users\curtp\Downloads\SCSTRepo\ScavengersUE4SupportTool\SCSTCOLLECTDATA.ps1'
    OutputPath = 'c:\Users\curtp\Downloads\SCSTRepo\ScavengersUE4SupportTool\out'
    Package = @{
        Enabled = $true
        Obfuscate = $false
        HideConsoleWindow = $false
        DotNetVersion = 'v4.6.2'
        FileVersion = '1.0.0'
        FileDescription = ''
        ProductName = ''
        ProductVersion = ''
        Copyright = ''
        RequireElevation = $false
        ApplicationIconPath = ''
        PackageType = 'Console'
    }
    Bundle = @{
        Enabled = $true
        Modules = $true
        # IgnoredModules = @()
    }
}
        