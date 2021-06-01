$MSUWaitWarningForm = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.PictureBox]$MSUWaitWarningPictureBox1 = $null
[System.Windows.Forms.Label]$MSUWaitWarningLabel1 = $null
[System.Windows.Forms.Button]$MSUWaitWarningContinueButton = $null
[System.Windows.Forms.Button]$MSUWaitWarningCancelButton = $null
[System.Windows.Forms.CheckBox]$MSUWaitWarningCheckBox1 = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'MSUWaitWarningform.resources.ps1')
$MSUWaitWarningPictureBox1 = (New-Object -TypeName System.Windows.Forms.PictureBox)
$MSUWaitWarningLabel1 = (New-Object -TypeName System.Windows.Forms.Label)
$MSUWaitWarningContinueButton = (New-Object -TypeName System.Windows.Forms.Button)
$MSUWaitWarningCancelButton = (New-Object -TypeName System.Windows.Forms.Button)
$MSUWaitWarningCheckBox1 = (New-Object -TypeName System.Windows.Forms.CheckBox)
([System.ComponentModel.ISupportInitialize]$MSUWaitWarningPictureBox1).BeginInit()
$MSUWaitWarningForm.SuspendLayout()
#
#MSUWaitWarningPictureBox1
#
$MSUWaitWarningPictureBox1.Image = ([System.Drawing.Image]$resources.'MSUWaitWarningPictureBox1.Image')
$MSUWaitWarningPictureBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]73,[System.Int32]12))
$MSUWaitWarningPictureBox1.Name = [System.String]'MSUWaitWarningPictureBox1'
$MSUWaitWarningPictureBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]99,[System.Int32]96))
$MSUWaitWarningPictureBox1.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::StretchImage
$MSUWaitWarningPictureBox1.TabIndex = [System.Int32]0
$MSUWaitWarningPictureBox1.TabStop = $false
#
#MSUWaitWarningLabel1
#
$MSUWaitWarningLabel1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]11,[System.Int32]121))
$MSUWaitWarningLabel1.Name = [System.String]'MSUWaitWarningLabel1'
$MSUWaitWarningLabel1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]228,[System.Int32]78))
$MSUWaitWarningLabel1.TabIndex = [System.Int32]1
$MSUWaitWarningLabel1.Text = [System.String]$resources.'MSUWaitWarningLabel1.Text'
$MSUWaitWarningLabel1.TextAlign = [System.Drawing.ContentAlignment]::TopCenter
$MSUWaitWarningLabel1.UseCompatibleTextRendering = $true
#
#MSUWaitWarningContinueButton
#
$MSUWaitWarningContinueButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]33,[System.Int32]229))
$MSUWaitWarningContinueButton.Name = [System.String]'MSUWaitWarningContinueButton'
$MSUWaitWarningContinueButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$MSUWaitWarningContinueButton.TabIndex = [System.Int32]2
$MSUWaitWarningContinueButton.Text = [System.String]'Continue'
$MSUWaitWarningContinueButton.UseCompatibleTextRendering = $true
$MSUWaitWarningContinueButton.UseVisualStyleBackColor = $true
$MSUWaitWarningContinueButton.Enabled = $false
$MSUWaitWarningContinueButton.add_Click($MSUWaitWarningContinueButton_Click)
#
#MSUWaitWarningCancelButton
#
$MSUWaitWarningCancelButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]138,[System.Int32]229))
$MSUWaitWarningCancelButton.Name = [System.String]'MSUWaitWarningCancelButton'
$MSUWaitWarningCancelButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$MSUWaitWarningCancelButton.TabIndex = [System.Int32]3
$MSUWaitWarningCancelButton.Text = [System.String]'Cancel'
$MSUWaitWarningCancelButton.UseCompatibleTextRendering = $true
$MSUWaitWarningCancelButton.UseVisualStyleBackColor = $true
$MSUWaitWarningCancelButton.add_Click($MSUWaitWarningCancelButton_Click)
#
#MSUWaitWarningCheckBox1
#
$MSUWaitWarningCheckBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]73,[System.Int32]203))
$MSUWaitWarningCheckBox1.Name = [System.String]'MSUWaitWarningCheckBox1'
$MSUWaitWarningCheckBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]113,[System.Int32]22))
$MSUWaitWarningCheckBox1.TabIndex = [System.Int32]4
$MSUWaitWarningCheckBox1.Text = [System.String]"I'm Ready to Wait"
$MSUWaitWarningCheckBox1.UseCompatibleTextRendering = $true
$MSUWaitWarningCheckBox1.UseVisualStyleBackColor = $true
$MSUWaitWarningCheckBox1.add_CheckedChanged($MSUWaitWarningCheckBox1_CheckedChanged)
#
#MSUWaitWarningForm
#
$MSUWaitWarningForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]251,[System.Int32]264))
$MSUWaitWarningForm.ControlBox = $false
$MSUWaitWarningForm.Controls.Add($MSUWaitWarningCheckBox1)
$MSUWaitWarningForm.Controls.Add($MSUWaitWarningCancelButton)
$MSUWaitWarningForm.Controls.Add($MSUWaitWarningContinueButton)
$MSUWaitWarningForm.Controls.Add($MSUWaitWarningLabel1)
$MSUWaitWarningForm.Controls.Add($MSUWaitWarningPictureBox1)
$MSUWaitWarningForm.MaximizeBox = $false
$MSUWaitWarningForm.MinimizeBox = $false
$MSUWaitWarningForm.ShowIcon = $false
$MSUWaitWarningForm.SizeGripStyle = [System.Windows.Forms.SizeGripStyle]::Hide
$MSUWaitWarningForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$MSUWaitWarningForm.Text = [System.String]'SCST'
$MSUWaitWarningForm.TopMost = $true
([System.ComponentModel.ISupportInitialize]$MSUWaitWarningPictureBox1).EndInit()
$MSUWaitWarningForm.ResumeLayout($false)
Add-Member -InputObject $MSUWaitWarningForm -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $MSUWaitWarningForm -Name MSUWaitWarningPictureBox1 -Value $MSUWaitWarningPictureBox1 -MemberType NoteProperty
Add-Member -InputObject $MSUWaitWarningForm -Name MSUWaitWarningLabel1 -Value $MSUWaitWarningLabel1 -MemberType NoteProperty
Add-Member -InputObject $MSUWaitWarningForm -Name MSUWaitWarningContinueButton -Value $MSUWaitWarningContinueButton -MemberType NoteProperty
Add-Member -InputObject $MSUWaitWarningForm -Name MSUWaitWarningCancelButton -Value $MSUWaitWarningCancelButton -MemberType NoteProperty
Add-Member -InputObject $MSUWaitWarningForm -Name MSUWaitWarningCheckBox1 -Value $MSUWaitWarningCheckBox1 -MemberType NoteProperty
}
. InitializeComponent
