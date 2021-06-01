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
[System.Windows.Forms.Label]$PrivacyWarningLabel = $null
[System.Windows.Forms.Button]$ResetAppDataButton = $null
[System.Windows.Forms.Label]$BeforeUseLabel = $null
[System.Windows.Forms.Button]$ResetNetButton = $null
[System.Windows.Forms.LinkLabel]$GithubLinkLabel = $null
[System.Windows.Forms.Button]$MSUpdateButton = $null
[System.Windows.Forms.Label]$LineSeparatorLabel = $null
[System.Windows.Forms.Button]$ResetWinFWButton = $null
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
$PrivacyWarningLabel = (New-Object -TypeName System.Windows.Forms.Label)
$ResetAppDataButton = (New-Object -TypeName System.Windows.Forms.Button)
$BeforeUseLabel = (New-Object -TypeName System.Windows.Forms.Label)
$ResetNetButton = (New-Object -TypeName System.Windows.Forms.Button)
$GithubLinkLabel = (New-Object -TypeName System.Windows.Forms.LinkLabel)
$MSUpdateButton = (New-Object -TypeName System.Windows.Forms.Button)
$LineSeparatorLabel = (New-Object -TypeName System.Windows.Forms.Label)
$ResetWinFWButton = (New-Object -TypeName System.Windows.Forms.Button)
$LauncherWindow.SuspendLayout()
#
#DataCollectorButton
#
$DataCollectorButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]354))
$DataCollectorButton.Name = [System.String]'DataCollectorButton'
$DataCollectorButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]90,[System.Int32]25))
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
$RepairToolButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]307,[System.Int32]354))
$RepairToolButton.Name = [System.String]'RepairToolButton'
$RepairToolButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]90,[System.Int32]25))
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
$AcceptCheckBox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]135,[System.Int32]334))
$AcceptCheckBox.Name = [System.String]'AcceptCheckBox'
$AcceptCheckBox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]151,[System.Int32]14))
$AcceptCheckBox.TabIndex = [System.Int32]4
$AcceptCheckBox.Tag = [System.String]''
$AcceptCheckBox.Text = [System.String]'I Accept All of the Above'
$AcceptCheckBox.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$AcceptCheckBox.UseCompatibleTextRendering = $true
$AcceptCheckBox.UseVisualStyleBackColor = $true
$AcceptCheckBox.add_CheckedChanged($AcceptCheckbox_CheckedChanged)
#
#UnofficialToolLabel
#
$UnofficialToolLabel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]9.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$UnofficialToolLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]9))
$UnofficialToolLabel.Name = [System.String]'UnofficialToolLabel'
$UnofficialToolLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]385,[System.Int32]38))
$UnofficialToolLabel.TabIndex = [System.Int32]7
$UnofficialToolLabel.Text = [System.String]'This is a UNOFFICIAL tool created by the community. 
This tool is NOT supported by the games developer.'
$UnofficialToolLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$UnofficialToolLabel.UseCompatibleTextRendering = $true
#
#ClickCheckboxLabel
#
$ClickCheckboxLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]310))
$ClickCheckboxLabel.Name = [System.String]'ClickCheckboxLabel'
$ClickCheckboxLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]385,[System.Int32]16))
$ClickCheckboxLabel.TabIndex = [System.Int32]8
$ClickCheckboxLabel.Text = [System.String]'Check the box below to proceed with Repair Tool or Data Collector'
$ClickCheckboxLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$ClickCheckboxLabel.UseCompatibleTextRendering = $true
#
#AboutMeLabel
#
$AboutMeLabel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]6.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$AboutMeLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]100,[System.Int32]388))
$AboutMeLabel.Name = [System.String]'AboutMeLabel'
$AboutMeLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]212,[System.Int32]16))
$AboutMeLabel.TabIndex = [System.Int32]9
$AboutMeLabel.Text = [System.String]'Developed by Cpjet64 and Void_Sentient/Hunhow'
$AboutMeLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$AboutMeLabel.UseCompatibleTextRendering = $true
#
#VersionLabel
#
$VersionLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]337,[System.Int32]388))
$VersionLabel.Name = [System.String]'VersionLabel'
$VersionLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]60,[System.Int32]14))
$VersionLabel.TabIndex = [System.Int32]10
$VersionLabel.UseCompatibleTextRendering = $true
#
#CloseButton
#
$CloseButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]155,[System.Int32]354))
$CloseButton.Name = [System.String]'CloseButton'
$CloseButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]105,[System.Int32]25))
$CloseButton.TabIndex = [System.Int32]11
$CloseButton.Text = [System.String]'Close'
$CloseButton.UseCompatibleTextRendering = $true
$CloseButton.UseVisualStyleBackColor = $true
$CloseButton.add_Click($CloseButton_Click)
#
#SafetyLabel
#
$SafetyLabel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]6.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$SafetyLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]47))
$SafetyLabel.Name = [System.String]'SafetyLabel'
$SafetyLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]385,[System.Int32]28))
$SafetyLabel.TabIndex = [System.Int32]15
$SafetyLabel.Text = [System.String]'If you downloaded this file from anywhere except the link below IMMEDIATELY delete the files, run a virus scan, and contact the Developer at the link below.'
$SafetyLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$SafetyLabel.UseCompatibleTextRendering = $true
#
#PrivacyWarningLabel
#
$PrivacyWarningLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]232))
$PrivacyWarningLabel.Name = [System.String]'PrivacyWarningLabel'
$PrivacyWarningLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]385,[System.Int32]78))
$PrivacyWarningLabel.TabIndex = [System.Int32]17
$PrivacyWarningLabel.Text = [System.String]$resources.'PrivacyWarningLabel.Text'
$PrivacyWarningLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$PrivacyWarningLabel.UseCompatibleTextRendering = $true
#
#ResetAppDataButton
#
$ResetAppDataButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]224,[System.Int32]146))
$ResetAppDataButton.Name = [System.String]'ResetAppDataButton'
$ResetAppDataButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]105,[System.Int32]25))
$ResetAppDataButton.TabIndex = [System.Int32]18
$ResetAppDataButton.Text = [System.String]'Reset AppData'
$ResetAppDataButton.UseCompatibleTextRendering = $true
$ResetAppDataButton.UseVisualStyleBackColor = $true
$ResetAppDataButton.add_Click($ResetAppDataButton_Click)
#
#BeforeUseLabel
#
$BeforeUseLabel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]9.75,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$BeforeUseLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]104))
$BeforeUseLabel.Name = [System.String]'BeforeUseLabel'
$BeforeUseLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]385,[System.Int32]39))
$BeforeUseLabel.TabIndex = [System.Int32]19
$BeforeUseLabel.Text = [System.String]'Before using this tool read the directions at the Github linked above!
'
$BeforeUseLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$BeforeUseLabel.UseCompatibleTextRendering = $true
#
#ResetNetButton
#
$ResetNetButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]224,[System.Int32]192))
$ResetNetButton.Name = [System.String]'ResetNetButton'
$ResetNetButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]140,[System.Int32]25))
$ResetNetButton.TabIndex = [System.Int32]20
$ResetNetButton.Text = [System.String]'Reset Network'
$ResetNetButton.UseCompatibleTextRendering = $true
$ResetNetButton.UseVisualStyleBackColor = $true
$ResetNetButton.add_Click($ResetNetButton_Click)
#
#GithubLinkLabel
#
$GithubLinkLabel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]8.25,([System.Drawing.FontStyle][System.Drawing.FontStyle]::Bold -bor [System.Drawing.FontStyle]::Italic),[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$GithubLinkLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]75))
$GithubLinkLabel.Name = [System.String]'GithubLinkLabel'
$GithubLinkLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]385,[System.Int32]17))
$GithubLinkLabel.TabIndex = [System.Int32]21
$GithubLinkLabel.TabStop = $true
$GithubLinkLabel.Text = [System.String]'https://github.com/cpjet64/ScavengersCommunitySupportTool'
$GithubLinkLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$GithubLinkLabel.UseCompatibleTextRendering = $true
#
#MSUpdateButton
#
$MSUpdateButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]70,[System.Int32]146))
$MSUpdateButton.Name = [System.String]'MSUpdateButton'
$MSUpdateButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]105,[System.Int32]25))
$MSUpdateButton.TabIndex = [System.Int32]22
$MSUpdateButton.Text = [System.String]'Microsoft Updates'
$MSUpdateButton.UseCompatibleTextRendering = $true
$MSUpdateButton.UseVisualStyleBackColor = $true
$MSUpdateButton.add_Click($MSUpdateButton_Click)
#
#LineSeparatorLabel
#
$LineSeparatorLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]5,[System.Int32]221))
$LineSeparatorLabel.Name = [System.String]'LineSeparatorLabel'
$LineSeparatorLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]399,[System.Int32]11))
$LineSeparatorLabel.TabIndex = [System.Int32]23
$LineSeparatorLabel.Text = [System.String]'------------------------------------------------------------------------------------------------'
$LineSeparatorLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$LineSeparatorLabel.UseCompatibleTextRendering = $true
#
#ResetWinFWButton
#
$ResetWinFWButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]35,[System.Int32]192))
$ResetWinFWButton.Name = [System.String]'ResetWinFWButton'
$ResetWinFWButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]140,[System.Int32]25))
$ResetWinFWButton.TabIndex = [System.Int32]24
$ResetWinFWButton.Text = [System.String]'Reset Windows Firewall'
$ResetWinFWButton.UseCompatibleTextRendering = $true
$ResetWinFWButton.UseVisualStyleBackColor = $true
$ResetWinFWButton.add_Click($ResetWinFWButton_Click)
#
#LauncherWindow
#
$LauncherWindow.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]409,[System.Int32]411))
$LauncherWindow.ControlBox = $false
$LauncherWindow.Controls.Add($ResetWinFWButton)
$LauncherWindow.Controls.Add($LineSeparatorLabel)
$LauncherWindow.Controls.Add($MSUpdateButton)
$LauncherWindow.Controls.Add($GithubLinkLabel)
$LauncherWindow.Controls.Add($ResetNetButton)
$LauncherWindow.Controls.Add($BeforeUseLabel)
$LauncherWindow.Controls.Add($ResetAppDataButton)
$LauncherWindow.Controls.Add($PrivacyWarningLabel)
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
$LauncherWindow.MaximumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]425,[System.Int32]450))
$LauncherWindow.MinimizeBox = $false
$LauncherWindow.MinimumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]425,[System.Int32]450))
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
Add-Member -InputObject $LauncherWindow -Name PrivacyWarningLabel -Value $PrivacyWarningLabel -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name ResetAppDataButton -Value $ResetAppDataButton -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name BeforeUseLabel -Value $BeforeUseLabel -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name ResetNetButton -Value $ResetNetButton -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name GithubLinkLabel -Value $GithubLinkLabel -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name MSUpdateButton -Value $MSUpdateButton -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name LineSeparatorLabel -Value $LineSeparatorLabel -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name ResetWinFWButton -Value $ResetWinFWButton -MemberType NoteProperty
}
. InitializeComponent
