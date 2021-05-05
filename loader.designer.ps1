$LauncherWindow = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Button]$DataCollectorButton = $null
[System.Windows.Forms.Button]$RepairToolButton = $null
[System.Windows.Forms.CheckBox]$AcceptCheckBox = $null
[System.Windows.Forms.Label]$UnofficialToolLabel = $null
[System.Windows.Forms.Label]$ClickCheckboxLabel = $null
[System.Windows.Forms.Label]$AboutMeLabel = $null
[System.Windows.Forms.Label]$VersionLabel = $null
[System.Windows.Forms.Button]$CloseButton = $null
[System.Windows.Forms.Label]$PleaseWaitLabel = $null
function InitializeComponent
{
$DataCollectorButton = (New-Object -TypeName System.Windows.Forms.Button)
$RepairToolButton = (New-Object -TypeName System.Windows.Forms.Button)
$AcceptCheckBox = (New-Object -TypeName System.Windows.Forms.CheckBox)
$UnofficialToolLabel = (New-Object -TypeName System.Windows.Forms.Label)
$ClickCheckboxLabel = (New-Object -TypeName System.Windows.Forms.Label)
$AboutMeLabel = (New-Object -TypeName System.Windows.Forms.Label)
$VersionLabel = (New-Object -TypeName System.Windows.Forms.Label)
$CloseButton = (New-Object -TypeName System.Windows.Forms.Button)
$PleaseWaitLabel = (New-Object -TypeName System.Windows.Forms.Label)
$LauncherWindow.SuspendLayout()
#
#DataCollectorButton
#
$DataCollectorButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]39,[System.Int32]160))
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
$RepairToolButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]221,[System.Int32]160))
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
$AcceptCheckBox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]144,[System.Int32]117))
$AcceptCheckBox.Name = [System.String]'AcceptCheckBox'
$AcceptCheckBox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]65,[System.Int32]24))
$AcceptCheckBox.TabIndex = [System.Int32]4
$AcceptCheckBox.Tag = [System.String]''
$AcceptCheckBox.Text = [System.String]'I Accept'
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
$UnofficialToolLabel.Text = [System.String]'This is a UNOFFICIAL tool created by the community for the community. This tool is NOT supported by the game''s developer.'
$UnofficialToolLabel.TextAlign = [System.Drawing.ContentAlignment]::TopCenter
$UnofficialToolLabel.UseCompatibleTextRendering = $true
$UnofficialToolLabel.add_Click($Label1_Click)
#
#ClickCheckboxLabel
#
$ClickCheckboxLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]81))
$ClickCheckboxLabel.Name = [System.String]'ClickCheckboxLabel'
$ClickCheckboxLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]335,[System.Int32]29))
$ClickCheckboxLabel.TabIndex = [System.Int32]8
$ClickCheckboxLabel.Text = [System.String]'Please check the box below to proceed.'
$ClickCheckboxLabel.TextAlign = [System.Drawing.ContentAlignment]::TopCenter
$ClickCheckboxLabel.UseCompatibleTextRendering = $true
$ClickCheckboxLabel.add_Click($Label2_Click)
#
#AboutMeLabel
#
$AboutMeLabel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]6.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$AboutMeLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]72,[System.Int32]213))
$AboutMeLabel.Name = [System.String]'AboutMeLabel'
$AboutMeLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]215,[System.Int32]14))
$AboutMeLabel.TabIndex = [System.Int32]9
$AboutMeLabel.Text = [System.String]'Developed by Cpjet64 and Void_Sentient/Hunhow'
$AboutMeLabel.TextAlign = [System.Drawing.ContentAlignment]::TopCenter
$AboutMeLabel.UseCompatibleTextRendering = $true
$AboutMeLabel.add_Click($AboutMeLabel_Click)
#
#VersionLabel
#
$VersionLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]321,[System.Int32]211))
$VersionLabel.Name = [System.String]'VersionLabel'
$VersionLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]26,[System.Int32]14))
$VersionLabel.TabIndex = [System.Int32]10
$VersionLabel.Text = [System.String]'v1.3'
$VersionLabel.UseCompatibleTextRendering = $true
$VersionLabel.add_Click($VersionLabel_Click)
#
#CloseButton
#
$CloseButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]154,[System.Int32]187))
$CloseButton.Name = [System.String]'CloseButton'
$CloseButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]48,[System.Int32]23))
$CloseButton.TabIndex = [System.Int32]11
$CloseButton.Text = [System.String]'Close'
$CloseButton.UseCompatibleTextRendering = $true
$CloseButton.UseVisualStyleBackColor = $true
$CloseButton.add_Click($CloseButton_Click)
#
#PleaseWaitLabel
#
$PleaseWaitLabel.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]14.25,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$PleaseWaitLabel.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]9))
$PleaseWaitLabel.Name = [System.String]'PleaseWaitLabel'
$PleaseWaitLabel.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]335,[System.Int32]148))
$PleaseWaitLabel.TabIndex = [System.Int32]12
$PleaseWaitLabel.Text = [System.String]'Please wait while the tool is running. Please do not click on anything or press any keys on your keyboard either.'
$PleaseWaitLabel.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$PleaseWaitLabel.UseCompatibleTextRendering = $true
$PleaseWaitLabel.Visible = $false
$PleaseWaitLabel.add_Click($PleaseWaitLabel_Click)
#
#LauncherWindow
#
$LauncherWindow.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]359,[System.Int32]236))
$LauncherWindow.ControlBox = $false
$LauncherWindow.Controls.Add($PleaseWaitLabel)
$LauncherWindow.Controls.Add($CloseButton)
$LauncherWindow.Controls.Add($VersionLabel)
$LauncherWindow.Controls.Add($AboutMeLabel)
$LauncherWindow.Controls.Add($ClickCheckboxLabel)
$LauncherWindow.Controls.Add($UnofficialToolLabel)
$LauncherWindow.Controls.Add($AcceptCheckBox)
$LauncherWindow.Controls.Add($RepairToolButton)
$LauncherWindow.Controls.Add($DataCollectorButton)
$LauncherWindow.MaximizeBox = $false
$LauncherWindow.MaximumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]375,[System.Int32]275))
$LauncherWindow.MinimizeBox = $false
$LauncherWindow.MinimumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]375,[System.Int32]275))
$LauncherWindow.ShowIcon = $false
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
Add-Member -InputObject $LauncherWindow -Name PleaseWaitLabel -Value $PleaseWaitLabel -MemberType NoteProperty
}
. InitializeComponent
