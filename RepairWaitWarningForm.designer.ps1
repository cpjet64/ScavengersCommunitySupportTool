$RepairWaitWarningForm = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.PictureBox]$RepairWaitWarningFormPictureBox1 = $null
[System.Windows.Forms.Label]$RepairWaitWarningFormLabel1 = $null
[System.Windows.Forms.Button]$RepairWaitWarningFormContinueButton = $null
[System.Windows.Forms.Button]$RepairWaitWarningFormCancelButton = $null
[System.Windows.Forms.CheckBox]$RepairWaitWarningFormCheckBox1 = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'RepairWaitWarningForm.resources.ps1')
$RepairWaitWarningFormPictureBox1 = (New-Object -TypeName System.Windows.Forms.PictureBox)
$RepairWaitWarningFormLabel1 = (New-Object -TypeName System.Windows.Forms.Label)
$RepairWaitWarningFormContinueButton = (New-Object -TypeName System.Windows.Forms.Button)
$RepairWaitWarningFormCancelButton = (New-Object -TypeName System.Windows.Forms.Button)
$RepairWaitWarningFormCheckBox1 = (New-Object -TypeName System.Windows.Forms.CheckBox)
([System.ComponentModel.ISupportInitialize]$RepairWaitWarningFormPictureBox1).BeginInit()
$RepairWaitWarningForm.SuspendLayout()
#
#RepairWaitWarningFormPictureBox1
#
$RepairWaitWarningFormPictureBox1.Image = ([System.Drawing.Image]$resources.'RepairWaitWarningFormPictureBox1.Image')
$RepairWaitWarningFormPictureBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]73,[System.Int32]12))
$RepairWaitWarningFormPictureBox1.Name = [System.String]'RepairWaitWarningFormPictureBox1'
$RepairWaitWarningFormPictureBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]99,[System.Int32]96))
$RepairWaitWarningFormPictureBox1.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::StretchImage
$RepairWaitWarningFormPictureBox1.TabIndex = [System.Int32]0
$RepairWaitWarningFormPictureBox1.TabStop = $false
#
#RepairWaitWarningFormLabel1
#
$RepairWaitWarningFormLabel1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]11,[System.Int32]121))
$RepairWaitWarningFormLabel1.Name = [System.String]'RepairWaitWarningFormLabel1'
$RepairWaitWarningFormLabel1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]228,[System.Int32]78))
$RepairWaitWarningFormLabel1.TabIndex = [System.Int32]1
$RepairWaitWarningFormLabel1.Text = [System.String]$resources.'RepairWaitWarningFormLabel1.Text'
$RepairWaitWarningFormLabel1.TextAlign = [System.Drawing.ContentAlignment]::TopCenter
$RepairWaitWarningFormLabel1.UseCompatibleTextRendering = $true
#
#RepairWaitWarningFormContinueButton
#
$RepairWaitWarningFormContinueButton.Enabled = $false
$RepairWaitWarningFormContinueButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]33,[System.Int32]229))
$RepairWaitWarningFormContinueButton.Name = [System.String]'RepairWaitWarningFormContinueButton'
$RepairWaitWarningFormContinueButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$RepairWaitWarningFormContinueButton.TabIndex = [System.Int32]2
$RepairWaitWarningFormContinueButton.Text = [System.String]'Continue'
$RepairWaitWarningFormContinueButton.UseCompatibleTextRendering = $true
$RepairWaitWarningFormContinueButton.UseVisualStyleBackColor = $true
$RepairWaitWarningFormContinueButton.add_Click($RepairWaitWarningFormContinueButton_Click)
#
#RepairWaitWarningFormCancelButton
#
$RepairWaitWarningFormCancelButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]138,[System.Int32]229))
$RepairWaitWarningFormCancelButton.Name = [System.String]'RepairWaitWarningFormCancelButton'
$RepairWaitWarningFormCancelButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$RepairWaitWarningFormCancelButton.TabIndex = [System.Int32]3
$RepairWaitWarningFormCancelButton.Text = [System.String]'Cancel'
$RepairWaitWarningFormCancelButton.UseCompatibleTextRendering = $true
$RepairWaitWarningFormCancelButton.UseVisualStyleBackColor = $true
$RepairWaitWarningFormCancelButton.add_Click($RepairWaitWarningFormCancelButton_Click)
#
#RepairWaitWarningFormCheckBox1
#
$RepairWaitWarningFormCheckBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]73,[System.Int32]203))
$RepairWaitWarningFormCheckBox1.Name = [System.String]'RepairWaitWarningFormCheckBox1'
$RepairWaitWarningFormCheckBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]113,[System.Int32]22))
$RepairWaitWarningFormCheckBox1.TabIndex = [System.Int32]4
$RepairWaitWarningFormCheckBox1.Text = [System.String]'I''m Ready to Wait'
$RepairWaitWarningFormCheckBox1.UseCompatibleTextRendering = $true
$RepairWaitWarningFormCheckBox1.UseVisualStyleBackColor = $true
$RepairWaitWarningFormCheckBox1.add_CheckedChanged($RepairWaitWarningFormCheckBox1_CheckedChanged)
#
#RepairWaitWarningForm
#
$RepairWaitWarningForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]251,[System.Int32]264))
$RepairWaitWarningForm.ControlBox = $false
$RepairWaitWarningForm.Controls.Add($RepairWaitWarningFormCheckBox1)
$RepairWaitWarningForm.Controls.Add($RepairWaitWarningFormCancelButton)
$RepairWaitWarningForm.Controls.Add($RepairWaitWarningFormContinueButton)
$RepairWaitWarningForm.Controls.Add($RepairWaitWarningFormLabel1)
$RepairWaitWarningForm.Controls.Add($RepairWaitWarningFormPictureBox1)
$RepairWaitWarningForm.MaximizeBox = $false
$RepairWaitWarningForm.MinimizeBox = $false
$RepairWaitWarningForm.ShowIcon = $false
$RepairWaitWarningForm.SizeGripStyle = [System.Windows.Forms.SizeGripStyle]::Hide
$RepairWaitWarningForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$RepairWaitWarningForm.Text = [System.String]'SCST'
$RepairWaitWarningForm.TopMost = $true
([System.ComponentModel.ISupportInitialize]$RepairWaitWarningFormPictureBox1).EndInit()
$RepairWaitWarningForm.ResumeLayout($false)
Add-Member -InputObject $RepairWaitWarningForm -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $RepairWaitWarningForm -Name RepairWaitWarningFormPictureBox1 -Value $RepairWaitWarningFormPictureBox1 -MemberType NoteProperty
Add-Member -InputObject $RepairWaitWarningForm -Name RepairWaitWarningFormLabel1 -Value $RepairWaitWarningFormLabel1 -MemberType NoteProperty
Add-Member -InputObject $RepairWaitWarningForm -Name RepairWaitWarningFormContinueButton -Value $RepairWaitWarningFormContinueButton -MemberType NoteProperty
Add-Member -InputObject $RepairWaitWarningForm -Name RepairWaitWarningFormCancelButton -Value $RepairWaitWarningFormCancelButton -MemberType NoteProperty
Add-Member -InputObject $RepairWaitWarningForm -Name RepairWaitWarningFormCheckBox1 -Value $RepairWaitWarningFormCheckBox1 -MemberType NoteProperty
}
. InitializeComponent
