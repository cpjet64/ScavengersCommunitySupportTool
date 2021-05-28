$discordusernameinput = Read-Host "Please enter your Discord username to include the numbers" | Write-Host 

Clear-Host
$YearCalc = Read-Host "When were you born?"
$Now = (Get-Date -uformat "%Y") -$YearCalc
$Maybe = $Now -1
Write-Host "You are $Maybe or $Now years old "



$WshShell = New-Object -ComObject wscript.shell
$Time = Get-Date -UFormat %R
$Message ="Test for $Env:computername at: " + $Time
$PopUp = $WshShell.popup("$Message",0,"Task Scheduler Pop-up",1)


Clear-Host
$YearCalc = Read-Host "When were you born?"
$Now = (Get-Date -uformat "%Y") -$YearCalc
$Maybe = $Now -1
Write-Host "You are $Maybe or $Now years old "




function Get-DiscordUsernameInputBox {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNull()]
        [String]
        $ADiscordUsername
    )
    Write-Output $Age
}

$Command = Show-Command Get-DiscordUsernameInputBox -PassThru
$MyAge = Invoke-Expression $Command




function Get-UserAge {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [ValidateNotNull()]
        [int]
        $Age
    )
    Write-Output $Age
}

$Command = Show-Command Get-UserAge -PassThru
$MyAge = Invoke-Expression $Command