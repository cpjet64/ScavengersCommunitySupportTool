@{
    Root = 'c:\Users\curtp\Downloads\SCSTRepo\ScavengersUE4SupportTool\ScavengersCST.ps1'
    OutputPath = 'c:\Users\curtp\Downloads\SCSTRepo\ScavengersUE4SupportTool\compiled'
    Package = @{
        Enabled = $true
        Obfuscate = $true
        HideConsoleWindow = $true
        DotNetVersion = 'v4.6.2'
        FileVersion = '1.3'
        FileDescription = 'If you received this file from anywhere other than https://github.com/cpjet64/ScavengersUE4SupportTool DELETE IT IMMEDIATELY, RUN A VIRUS SCAN, AND REPORT IT TO Cpjet64#5663 VIA DISCORD IMMEDIATELY'
        ProductName = 'Scavengers Community Support Tool'
        ProductVersion = ''
        Copyright = 'GPL3'
        RequireElevation = $true
        ApplicationIconPath = ''
        PackageType = 'Console'
    }
    Bundle = @{
        Enabled = $true
        Modules = $true
        # IgnoredModules = @()
    }
}
        