$LauncherWindow = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Button]$DataCollectorButton = $null
[System.Windows.Forms.Button]$RepairToolButton = $null
[System.Windows.Forms.CheckBox]$AcceptCheckBox = $null
[System.Windows.Forms.Label]$UnofficialToolLabel = $null
[System.Windows.Forms.Label]$ClickCheckboxLabel = $null
[System.Windows.Forms.Label]$AboutMeLabel = $null
[System.Windows.Forms.Label]$VersionLabel = $null
[System.Windows.Forms.Button]$CloseButton = $null
[System.Windows.Forms.Label]$SafetyLabel = $null
[System.Windows.Forms.Label]$GithubLabel = $null
[System.Windows.Forms.Label]$PrivacyWarningLabel = $null
[System.Windows.Forms.Button]$ResetAppDataButton = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'scavengerscst.resources.ps1')
$DataCollectorButton = (New-Object -TypeName System.Windows.Forms.Button)
$RepairToolButton = (New-Object -TypeName System.Windows.Forms.Button)
$AcceptCheckBox = (New-Object -TypeName System.Windows.Forms.CheckBox)
$UnofficialToolLabel = (New-Object -TypeName System.Windows.Forms.Label)
$ClickCheckboxLabel = (New-Object -TypeName System.Windows.Forms.Label)
$AboutMeLabel = (New-Object -TypeName System.Windows.Forms.Label)
$VersionLabel = (New-Object -TypeName System.Windows.Forms.Label)
$CloseButton = (New-Object -TypeName System.Windows.Forms.Button)
$SafetyLabel = (New-Object -TypeName System.Windows.Forms.Label)
$GithubLabel = (New-Object -TypeName System.Windows.Forms.Label)
$PrivacyWarningLabel = (New-Object -TypeName System.Windows.Forms.Label)
$ResetAppDataButton = (New-Object -TypeName System.Windows.Forms.Button)
$LauncherWindow.SuspendLayout()
#
#DataCollectorButton
#
$DataCollectorButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]308))
$DataCollectorButton.Name = [System.String]'DataCollectorButton'
$DataCollectorButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]97,[System.Int32]23))
$DataCollectorButton.TabIndex = [System.Int32]1
$DataCollectorButton.Tag = [System.String]''
$DataCollectorButton.Text = [System.String]'Data Collector'
$DataCollectorButton.UseCompatibleTextRendering = $true
$DataCollectorButton.UseVisualStyleBackColor = $true
$DataCollectorButton.Visible = $false
$DataCollectorButton.add_VisibleChanged($AcceptCheckbox_CheckedChanged)
$DataCollectorButton.add_Click($DataCollectorButton_Click)
#
#RepairToolButton
#
$RepairToolButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]250,[System.Int32]308))
$RepairToolButton.Name = [System.String]'RepairToolButton'
$RepairToolButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]97,[System.Int32]23))
$RepairToolButton.TabIndex = [System.Int32]2
$RepairToolButton.Tag = [System.String]''
$RepairToolButton.Text = [System.String]'Repair Tool'
$RepairToolButton.UseCompatibleTextRendering = $true
$RepairToolButton.UseVisualStyleBackColor = $true
$RepairToolButton.Visible = $false
$RepairToolButton.add_VisibleChanged($AcceptCheckbox_CheckedChanged)
$RepairToolButton.add_Click($RepairToolButton_Click)
#
#AcceptCheckBox
#
$AcceptCheckBox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]107,[System.Int32]278))
$AcceptCheckBox.Name = [System.String]'AcceptCheckBox'
$AcceptCheckBox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]151,[System.Int32]24))
$AcceptCheckBox.TabIndex = [System.Int32]4
$AcceptCheckBox.Tag = [System.String]''
$AcceptCheckBox.Text = [System.String]'I Accept All of the Above'
$AcceptCheckBox.UseCompatibleTextRendering = $true
$AcceptCheckBox.UseVisualStyleBackColor = $true
$AcceptCheckBox.add_CheckedChanged($AcceptCheckbox_CheckedChanged)
#
#UnofficialToolLabel
#
$UnofficialToolLabel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$UnofficialToolLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]9))
$UnofficialToolLabel.Name = [System.String]'UnofficialToolLabel'
$UnofficialToolLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]335,[System.Int32]92))
$UnofficialToolLabel.TabIndex = [System.Int32]7
$UnofficialToolLabel.Text = [System.String]'This is a UNOFFICIAL tool created by the community for the community. This tool is NOT supported by the games developer.'
$UnofficialToolLabel.TextAlign = [System.Drawing.ContentAlignment]::TopCenter
$UnofficialToolLabel.UseCompatibleTextRendering = $true
#
#ClickCheckboxLabel
#
$ClickCheckboxLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]259))
$ClickCheckboxLabel.Name = [System.String]'ClickCheckboxLabel'
$ClickCheckboxLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]335,[System.Int32]16))
$ClickCheckboxLabel.TabIndex = [System.Int32]8
$ClickCheckboxLabel.Text = [System.String]'Please check the box below to proceed.'
$ClickCheckboxLabel.TextAlign = [System.Drawing.ContentAlignment]::TopCenter
$ClickCheckboxLabel.UseCompatibleTextRendering = $true
#
#AboutMeLabel
#
$AboutMeLabel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]6.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$AboutMeLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]74,[System.Int32]363))
$AboutMeLabel.Name = [System.String]'AboutMeLabel'
$AboutMeLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]215,[System.Int32]14))
$AboutMeLabel.TabIndex = [System.Int32]9
$AboutMeLabel.Text = [System.String]'Developed by Cpjet64 and Void_Sentient/Hunhow'
$AboutMeLabel.TextAlign = [System.Drawing.ContentAlignment]::TopCenter
$AboutMeLabel.UseCompatibleTextRendering = $true
#
#VersionLabel
#
$VersionLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]321,[System.Int32]361))
$VersionLabel.Name = [System.String]'VersionLabel'
$VersionLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]26,[System.Int32]14))
$VersionLabel.TabIndex = [System.Int32]10
$VersionLabel.Text = [System.String]'v1.4'
$VersionLabel.UseCompatibleTextRendering = $true
#
#CloseButton
#
$CloseButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]156,[System.Int32]337))
$CloseButton.Name = [System.String]'CloseButton'
$CloseButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]48,[System.Int32]23))
$CloseButton.TabIndex = [System.Int32]11
$CloseButton.Text = [System.String]'Close'
$CloseButton.UseCompatibleTextRendering = $true
$CloseButton.UseVisualStyleBackColor = $true
$CloseButton.add_Click($CloseButton_Click)
#
#SafetyLabel
#
$SafetyLabel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]6.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$SafetyLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]73))
$SafetyLabel.Name = [System.String]'SafetyLabel'
$SafetyLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]335,[System.Int32]28))
$SafetyLabel.TabIndex = [System.Int32]15
$SafetyLabel.Text = [System.String]'If you downloaded this file from anywhere except the link below IMMEDIATELY delete the files, run a virus scan, and contact the Developer at the link below.'
$SafetyLabel.TextAlign = [System.Drawing.ContentAlignment]::TopCenter
$SafetyLabel.UseCompatibleTextRendering = $true
#
#GithubLabel
#
$GithubLabel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$GithubLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]110))
$GithubLabel.Name = [System.String]'GithubLabel'
$GithubLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]335,[System.Int32]17))
$GithubLabel.TabIndex = [System.Int32]16
$GithubLabel.Text = [System.String]'https://github.com/cpjet64/ScavengersUE4SupportTool'
$GithubLabel.TextAlign = [System.Drawing.ContentAlignment]::TopCenter
$GithubLabel.UseCompatibleTextRendering = $true
#
#PrivacyWarningLabel
#
$PrivacyWarningLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]127))
$PrivacyWarningLabel.Name = [System.String]'PrivacyWarningLabel'
$PrivacyWarningLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]335,[System.Int32]132))
$PrivacyWarningLabel.TabIndex = [System.Int32]17
$PrivacyWarningLabel.Text = [System.String]$resources.'PrivacyWarningLabel.Text'
$PrivacyWarningLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$PrivacyWarningLabel.UseCompatibleTextRendering = $true
#
#ResetAppDataButton
#
$ResetAppDataButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]136,[System.Int32]308))
$ResetAppDataButton.Name = [System.String]'ResetAppDataButton'
$ResetAppDataButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]88,[System.Int32]23))
$ResetAppDataButton.TabIndex = [System.Int32]18
$ResetAppDataButton.Text = [System.String]'Reset Graphics'
$ResetAppDataButton.UseCompatibleTextRendering = $true
$ResetAppDataButton.UseVisualStyleBackColor = $true
$ResetAppDataButton.add_Click($ResetAppDataButton_Click)
#
#LauncherWindow
#
$LauncherWindow.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]359,[System.Int32]386))
$LauncherWindow.ControlBox = $false
$LauncherWindow.Controls.Add($ResetAppDataButton)
$LauncherWindow.Controls.Add($PrivacyWarningLabel)
$LauncherWindow.Controls.Add($GithubLabel)
$LauncherWindow.Controls.Add($SafetyLabel)
$LauncherWindow.Controls.Add($CloseButton)
$LauncherWindow.Controls.Add($VersionLabel)
$LauncherWindow.Controls.Add($AboutMeLabel)
$LauncherWindow.Controls.Add($ClickCheckboxLabel)
$LauncherWindow.Controls.Add($UnofficialToolLabel)
$LauncherWindow.Controls.Add($AcceptCheckBox)
$LauncherWindow.Controls.Add($RepairToolButton)
$LauncherWindow.Controls.Add($DataCollectorButton)
$LauncherWindow.MaximizeBox = $false
$LauncherWindow.MaximumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]375,[System.Int32]425))
$LauncherWindow.MinimizeBox = $false
$LauncherWindow.MinimumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]375,[System.Int32]425))
$LauncherWindow.SizeGripStyle = [System.Windows.Forms.SizeGripStyle]::Hide
$LauncherWindow.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$LauncherWindow.Text = [System.String]'Scavengers Community Support Tool'
$LauncherWindow.add_FormClosed($CloseButton_Click)
$LauncherWindow.add_Load($LauncherWindow_Load)
$LauncherWindow.ResumeLayout($false)
Add-Member -InputObject $LauncherWindow -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name DataCollectorButton -Value $DataCollectorButton -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name RepairToolButton -Value $RepairToolButton -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name AcceptCheckBox -Value $AcceptCheckBox -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name UnofficialToolLabel -Value $UnofficialToolLabel -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name ClickCheckboxLabel -Value $ClickCheckboxLabel -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name AboutMeLabel -Value $AboutMeLabel -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name VersionLabel -Value $VersionLabel -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name CloseButton -Value $CloseButton -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name SafetyLabel -Value $SafetyLabel -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name GithubLabel -Value $GithubLabel -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name PrivacyWarningLabel -Value $PrivacyWarningLabel -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name ResetAppDataButton -Value $ResetAppDataButton -MemberType NoteProperty
}
. InitializeComponent
