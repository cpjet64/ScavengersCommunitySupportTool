$Label2_Click = {
}
$Label1_Click = {
}
$UnofficialToolLabel_Click = {
}
$PleaseWaitLabel_Click = {
}
$VersionLabel_Click = {
}
$AboutMeLabel_Click = {
}
$LauncherWindow_Load = {
}
$CloseButton_Click = {
	$LauncherWindow.Close()
}
$DataCollectorButton_Click = {
	usernameinput
	$CloseButton.Enabled = $false
	$DataCollectorButton.Enabled = $false
	$RepairToolButton.Enabled = $false
	$PleaseWaitLabel.Visible = $true
	start-Sleep 1
	datacollector -wait
	start-Sleep 1
	$PleaseWaitLabel.Visible = $false
	$CloseButton.Enabled = $true
	$RepairToolButton.Enabled = $true
	$DataCollectorButton.Enabled = $true
}
$RepairToolButton_Click = {
	usernameinput
	$CloseButton.Enabled = $false
	$DataCollectorButton.Enabled = $false
	$RepairToolButton.Enabled = $false
	$PleaseWaitLabel.Visible = $true
	start-Sleep 1
	repairtool -wait
	start-Sleep 1
	$PleaseWaitLabel.Visible = $false
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

function repairtool {
(& ".\SCSTRepair.ps1")
}

function datacollector {
(& ".\SCSTInfo.ps1")
}

Add-Type -AssemblyName System.Windows.Forms
. (Join-Path $PSScriptRoot 'loader.designer.ps1')
$LauncherWindow.ShowDialog()


function usernameinput {
([void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic'))
$msg   = 'Please Enter Your Discord Username'
$discordusernameentry = [Microsoft.VisualBasic.Interaction]::InputBox($discordusernameentry)
if (Test-Path $env:TEMP\SCSTDiscord.txt) {
    Set-Content -Path "$env:TEMP\SCSTDiscord.txt" -Value "$discordusernameentry" -Encoding UTF8
}
else {
    New-Item "$env:TEMP\SCSTDiscord.txt"
	Set-Content -Path "$env:TEMP\SCSTDiscord.txt" -Value "$discordusernameentry" -Encoding UTF8
}
}
