$DiscordUNEntryForm = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.TextBox]$DiscordUsernameEntryBox = $null
[System.Windows.Forms.Label]$Label1 = $null
[System.Windows.Forms.PictureBox]$PictureBox1 = $null
[System.Windows.Forms.Button]$DiscordUNContinueButton = $null
[System.Windows.Forms.Button]$DiscordUNCancelButton = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'discordunform.resources.ps1')
$DiscordUsernameEntryBox = (New-Object -TypeName System.Windows.Forms.TextBox)
$Label1 = (New-Object -TypeName System.Windows.Forms.Label)
$PictureBox1 = (New-Object -TypeName System.Windows.Forms.PictureBox)
$DiscordUNContinueButton = (New-Object -TypeName System.Windows.Forms.Button)
$DiscordUNCancelButton = (New-Object -TypeName System.Windows.Forms.Button)
([System.ComponentModel.ISupportInitialize]$PictureBox1).BeginInit()
$DiscordUNEntryForm.SuspendLayout()
#
#DiscordUsernameEntryBox
#
$DiscordUsernameEntryBox.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]50,[System.Int32]78))
$DiscordUsernameEntryBox.Name = [System.String]'DiscordUsernameEntryBox'
$DiscordUsernameEntryBox.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]239,[System.Int32]21))
$DiscordUsernameEntryBox.TabIndex = [System.Int32]0
$DiscordUsernameEntryBox.add_TextChanged($DiscordUsernameEntryBox_TextChanged)
#
#Label1
#
$Label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]9))
$Label1.Name = [System.String]'Label1'
$Label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]316,[System.Int32]66))
$Label1.TabIndex = [System.Int32]1
$Label1.Text = [System.String]'Please Enter your Discord Username to include the # and numbers. You can click your username in Discord as shown below to copy it and then paste it here.'
$Label1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$Label1.UseCompatibleTextRendering = $true
#
#PictureBox1
#
$PictureBox1.Image = ([System.Drawing.Image]$resources.'PictureBox1.Image')
$PictureBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]50,[System.Int32]105))
$PictureBox1.Name = [System.String]'PictureBox1'
$PictureBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]239,[System.Int32]85))
$PictureBox1.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$PictureBox1.TabIndex = [System.Int32]2
$PictureBox1.TabStop = $false
#
#DiscordUNContinueButton
#
$DiscordUNContinueButton.Enabled = $false
$DiscordUNContinueButton.DialogResult = [System.Windows.Forms.DialogResult]::Yes
$DiscordUNContinueButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]80,[System.Int32]215))
$DiscordUNContinueButton.Name = [System.String]'DiscordUNContinueButton'
$DiscordUNContinueButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$DiscordUNContinueButton.TabIndex = [System.Int32]3
$DiscordUNContinueButton.Text = [System.String]'Continue'
$DiscordUNContinueButton.UseCompatibleTextRendering = $true
$DiscordUNContinueButton.UseVisualStyleBackColor = $true
$DiscordUNContinueButton.add_Click($DiscordUNContinueButton_Click)
#
#DiscordUNCancelButton
#
$DiscordUNCancelButton.DialogResult = [System.Windows.Forms.DialogResult]::Cancel
$DiscordUNCancelButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]185,[System.Int32]215))
$DiscordUNCancelButton.Name = [System.String]'DiscordUNCancelButton'
$DiscordUNCancelButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$DiscordUNCancelButton.TabIndex = [System.Int32]4
$DiscordUNCancelButton.Text = [System.String]'Cancel'
$DiscordUNCancelButton.UseCompatibleTextRendering = $true
$DiscordUNCancelButton.UseVisualStyleBackColor = $true
$DiscordUNCancelButton.add_Click($DiscordUNCancelButton_Click)
#
#DiscordUNEntryForm
#
$DiscordUNEntryForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]340,[System.Int32]261))
$DiscordUNEntryForm.ControlBox = $false
$DiscordUNEntryForm.Controls.Add($DiscordUNCancelButton)
$DiscordUNEntryForm.Controls.Add($DiscordUNContinueButton)
$DiscordUNEntryForm.Controls.Add($PictureBox1)
$DiscordUNEntryForm.Controls.Add($Label1)
$DiscordUNEntryForm.Controls.Add($DiscordUsernameEntryBox)
$DiscordUNEntryForm.ShowIcon = $false
$DiscordUNEntryForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterParent
$DiscordUNEntryForm.Text = [System.String]'SCST'
$DiscordUNEntryForm.TopMost = $true
([System.ComponentModel.ISupportInitialize]$PictureBox1).EndInit()
$DiscordUNEntryForm.ResumeLayout($false)
$DiscordUNEntryForm.PerformLayout()
Add-Member -InputObject $DiscordUNEntryForm -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $DiscordUNEntryForm -Name DiscordUsernameEntryBox -Value $DiscordUsernameEntryBox -MemberType NoteProperty
Add-Member -InputObject $DiscordUNEntryForm -Name Label1 -Value $Label1 -MemberType NoteProperty
Add-Member -InputObject $DiscordUNEntryForm -Name PictureBox1 -Value $PictureBox1 -MemberType NoteProperty
Add-Member -InputObject $DiscordUNEntryForm -Name DiscordUNContinueButton -Value $DiscordUNContinueButton -MemberType NoteProperty
Add-Member -InputObject $DiscordUNEntryForm -Name DiscordUNCancelButton -Value $DiscordUNCancelButton -MemberType NoteProperty
}
. InitializeComponent
