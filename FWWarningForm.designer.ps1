$FWWarningForm = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.PictureBox]$PictureBox1 = $null
[System.Windows.Forms.PictureBox]$PictureBox2 = $null
[System.Windows.Forms.Label]$FWWarningLabel1 = $null
[System.Windows.Forms.Label]$FWWarningLabel2 = $null
[System.Windows.Forms.CheckBox]$FWWarningCheckBox1 = $null
[System.Windows.Forms.Button]$FWWarningContinueButton = $null
[System.Windows.Forms.Button]$FWWarningCancelButton = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'fwwarningform.resources.ps1')
$PictureBox1 = (New-Object -TypeName System.Windows.Forms.PictureBox)
$PictureBox2 = (New-Object -TypeName System.Windows.Forms.PictureBox)
$FWWarningLabel1 = (New-Object -TypeName System.Windows.Forms.Label)
$FWWarningLabel2 = (New-Object -TypeName System.Windows.Forms.Label)
$FWWarningCheckBox1 = (New-Object -TypeName System.Windows.Forms.CheckBox)
$FWWarningContinueButton = (New-Object -TypeName System.Windows.Forms.Button)
$FWWarningCancelButton = (New-Object -TypeName System.Windows.Forms.Button)
([System.ComponentModel.ISupportInitialize]$PictureBox1).BeginInit()
([System.ComponentModel.ISupportInitialize]$PictureBox2).BeginInit()
$FWWarningForm.SuspendLayout()
#
#PictureBox1
#
$PictureBox1.Image = ([System.Drawing.Image]$resources.'PictureBox1.Image')
$PictureBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]12))
$PictureBox1.Name = [System.String]'PictureBox1'
$PictureBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]32,[System.Int32]31))
$PictureBox1.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$PictureBox1.TabIndex = [System.Int32]0
$PictureBox1.TabStop = $false
#
#PictureBox2
#
$PictureBox2.Image = ([System.Drawing.Image]$resources.'PictureBox2.Image')
$PictureBox2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]151,[System.Int32]12))
$PictureBox2.Name = [System.String]'PictureBox2'
$PictureBox2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]32,[System.Int32]31))
$PictureBox2.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$PictureBox2.TabIndex = [System.Int32]1
$PictureBox2.TabStop = $false
#
#FWWarningLabel1
#
$FWWarningLabel1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$FWWarningLabel1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]50,[System.Int32]12))
$FWWarningLabel1.Name = [System.String]'FWWarningLabel1'
$FWWarningLabel1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]95,[System.Int32]31))
$FWWarningLabel1.TabIndex = [System.Int32]2
$FWWarningLabel1.Text = [System.String]'Warning'
$FWWarningLabel1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$FWWarningLabel1.UseCompatibleTextRendering = $true
#
#FWWarningLabel2
#
$FWWarningLabel2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]46))
$FWWarningLabel2.Name = [System.String]'FWWarningLabel2'
$FWWarningLabel2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]171,[System.Int32]88))
$FWWarningLabel2.TabIndex = [System.Int32]3
$FWWarningLabel2.Text = [System.String]'This process is IRREVERSIBLE. Any custom firewall rules you have created and any programs you have previously allowed or blocked will be removed from the Windows Firewall.'
$FWWarningLabel2.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$FWWarningLabel2.UseCompatibleTextRendering = $true
#
#FWWarningCheckBox1
#
$FWWarningCheckBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]40,[System.Int32]137))
$FWWarningCheckBox1.Name = [System.String]'FWWarningCheckBox1'
$FWWarningCheckBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]121,[System.Int32]24))
$FWWarningCheckBox1.TabIndex = [System.Int32]4
$FWWarningCheckBox1.Text = [System.String]'Check to Continue'
$FWWarningCheckBox1.UseCompatibleTextRendering = $true
$FWWarningCheckBox1.UseVisualStyleBackColor = $true
$FWWarningCheckBox1.add_CheckedChanged($FWWarningCheckBox1_CheckedChanged)
#
#FWWarningContinueButton
#
$FWWarningContinueButton.Enabled = $false
$FWWarningContinueButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]167))
$FWWarningContinueButton.Name = [System.String]'FWWarningContinueButton'
$FWWarningContinueButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$FWWarningContinueButton.TabIndex = [System.Int32]5
$FWWarningContinueButton.Text = [System.String]'Continue'
$FWWarningContinueButton.UseCompatibleTextRendering = $true
$FWWarningContinueButton.UseVisualStyleBackColor = $true
$FWWarningContinueButton.add_Click($FWWarningContinueButton_Click)
#
#FWWarningCancelButton
#
$FWWarningCancelButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]108,[System.Int32]167))
$FWWarningCancelButton.Name = [System.String]'FWWarningCancelButton'
$FWWarningCancelButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$FWWarningCancelButton.TabIndex = [System.Int32]6
$FWWarningCancelButton.Text = [System.String]'Cancel'
$FWWarningCancelButton.UseCompatibleTextRendering = $true
$FWWarningCancelButton.UseVisualStyleBackColor = $true
$FWWarningCancelButton.add_Click($FWWarningCancelButton_Click)
#
#FWWarningForm
#
$FWWarningForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]197,[System.Int32]203))
$FWWarningForm.ControlBox = $false
$FWWarningForm.Controls.Add($FWWarningCancelButton)
$FWWarningForm.Controls.Add($FWWarningContinueButton)
$FWWarningForm.Controls.Add($FWWarningCheckBox1)
$FWWarningForm.Controls.Add($FWWarningLabel2)
$FWWarningForm.Controls.Add($FWWarningLabel1)
$FWWarningForm.Controls.Add($PictureBox2)
$FWWarningForm.Controls.Add($PictureBox1)
$FWWarningForm.MaximizeBox = $false
$FWWarningForm.MinimizeBox = $false
$FWWarningForm.ShowIcon = $false
$FWWarningForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterParent
$FWWarningForm.SizeGripStyle = [System.Windows.Forms.SizeGripStyle]::Hide
$FWWarningForm.Text = [System.String]'SCST'
$FWWarningForm.TopMost = $true
([System.ComponentModel.ISupportInitialize]$PictureBox1).EndInit()
([System.ComponentModel.ISupportInitialize]$PictureBox2).EndInit()
$FWWarningForm.ResumeLayout($false)
$FWWarningForm.PerformLayout()
Add-Member -InputObject $FWWarningForm -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $FWWarningForm -Name PictureBox1 -Value $PictureBox1 -MemberType NoteProperty
Add-Member -InputObject $FWWarningForm -Name PictureBox2 -Value $PictureBox2 -MemberType NoteProperty
Add-Member -InputObject $FWWarningForm -Name FWWarningLabel1 -Value $FWWarningLabel1 -MemberType NoteProperty
Add-Member -InputObject $FWWarningForm -Name FWWarningLabel2 -Value $FWWarningLabel2 -MemberType NoteProperty
Add-Member -InputObject $FWWarningForm -Name FWWarningCheckBox1 -Value $FWWarningCheckBox1 -MemberType NoteProperty
Add-Member -InputObject $FWWarningForm -Name FWWarningContinueButton -Value $FWWarningContinueButton -MemberType NoteProperty
Add-Member -InputObject $FWWarningForm -Name FWWarningCancelButton -Value $FWWarningCancelButton -MemberType NoteProperty
}
. InitializeComponent
