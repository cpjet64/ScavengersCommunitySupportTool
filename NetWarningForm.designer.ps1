$NetWarningForm = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.PictureBox]$NetWarningFormPictureBox1 = $null
[System.Windows.Forms.PictureBox]$NetWarningFormPictureBox2 = $null
[System.Windows.Forms.Label]$NetWarningFormLabel1 = $null
[System.Windows.Forms.Label]$NetWarningFormLabel2 = $null
[System.Windows.Forms.CheckBox]$NetWarningFormCheckBox1 = $null
[System.Windows.Forms.Button]$NetWarningFormContinueButton = $null
[System.Windows.Forms.Button]$NetWarningFormCancelButton = $null
function InitializeComponent
{
$resources = . (Join-Path $PSScriptRoot 'NetWarningForm.resources.ps1')
$NetWarningFormPictureBox1 = (New-Object -TypeName System.Windows.Forms.PictureBox)
$NetWarningFormPictureBox2 = (New-Object -TypeName System.Windows.Forms.PictureBox)
$NetWarningFormLabel1 = (New-Object -TypeName System.Windows.Forms.Label)
$NetWarningFormLabel2 = (New-Object -TypeName System.Windows.Forms.Label)
$NetWarningFormCheckBox1 = (New-Object -TypeName System.Windows.Forms.CheckBox)
$NetWarningFormContinueButton = (New-Object -TypeName System.Windows.Forms.Button)
$NetWarningFormCancelButton = (New-Object -TypeName System.Windows.Forms.Button)
([System.ComponentModel.ISupportInitialize]$NetWarningFormPictureBox1).BeginInit()
([System.ComponentModel.ISupportInitialize]$NetWarningFormPictureBox2).BeginInit()
$NetWarningForm.SuspendLayout()
#
#NetWarningFormPictureBox1
#
$NetWarningFormPictureBox1.Image = ([System.Drawing.Image]$resources.'NetWarningFormPictureBox1.Image')
$NetWarningFormPictureBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]12))
$NetWarningFormPictureBox1.Name = [System.String]'NetWarningFormPictureBox1'
$NetWarningFormPictureBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]32,[System.Int32]31))
$NetWarningFormPictureBox1.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$NetWarningFormPictureBox1.TabIndex = [System.Int32]0
$NetWarningFormPictureBox1.TabStop = $false
#
#NetWarningFormPictureBox2
#
$NetWarningFormPictureBox2.Image = ([System.Drawing.Image]$resources.'NetWarningFormPictureBox2.Image')
$NetWarningFormPictureBox2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]151,[System.Int32]12))
$NetWarningFormPictureBox2.Name = [System.String]'NetWarningFormPictureBox2'
$NetWarningFormPictureBox2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]32,[System.Int32]31))
$NetWarningFormPictureBox2.SizeMode = [System.Windows.Forms.PictureBoxSizeMode]::AutoSize
$NetWarningFormPictureBox2.TabIndex = [System.Int32]1
$NetWarningFormPictureBox2.TabStop = $false
#
#NetWarningFormLabel1
#
$NetWarningFormLabel1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]14.25,[System.Drawing.FontStyle]::Bold,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$NetWarningFormLabel1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]50,[System.Int32]12))
$NetWarningFormLabel1.Name = [System.String]'NetWarningFormLabel1'
$NetWarningFormLabel1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]95,[System.Int32]31))
$NetWarningFormLabel1.TabIndex = [System.Int32]2
$NetWarningFormLabel1.Text = [System.String]'Warning'
$NetWarningFormLabel1.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$NetWarningFormLabel1.UseCompatibleTextRendering = $true
#
#NetWarningFormLabel2
#
$NetWarningFormLabel2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]46))
$NetWarningFormLabel2.Name = [System.String]'NetWarningFormLabel2'
$NetWarningFormLabel2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]171,[System.Int32]88))
$NetWarningFormLabel2.TabIndex = [System.Int32]3
$NetWarningFormLabel2.Text = [System.String]'This process is DANGEROUS AND IRREVERSIBLE. Custom network settings such as but not excluding Static IP addresses, Proxies, VPNs, Network Bridges, etc... will cease to function until properly reconfigured. If you are using a Static IP, Proxy, VPN, etc... make sure to copy down your settings before running this function!!'
$NetWarningFormLabel2.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$NetWarningFormLabel2.UseCompatibleTextRendering = $true
#
#NetWarningFormCheckBox1
#
$NetWarningFormCheckBox1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]40,[System.Int32]137))
$NetWarningFormCheckBox1.Name = [System.String]'NetWarningFormCheckBox1'
$NetWarningFormCheckBox1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]121,[System.Int32]24))
$NetWarningFormCheckBox1.TabIndex = [System.Int32]4
$NetWarningFormCheckBox1.Text = [System.String]'Check to Continue'
$NetWarningFormCheckBox1.UseCompatibleTextRendering = $true
$NetWarningFormCheckBox1.UseVisualStyleBackColor = $true
$NetWarningFormCheckBox1.add_CheckedChanged($NetWarningFormCheckBox1_CheckedChanged)
#
#NetWarningFormContinueButton
#
$NetWarningFormContinueButton.Enabled = $false
$NetWarningFormContinueButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]167))
$NetWarningFormContinueButton.Name = [System.String]'NetWarningFormContinueButton'
$NetWarningFormContinueButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$NetWarningFormContinueButton.TabIndex = [System.Int32]5
$NetWarningFormContinueButton.Text = [System.String]'Continue'
$NetWarningFormContinueButton.UseCompatibleTextRendering = $true
$NetWarningFormContinueButton.UseVisualStyleBackColor = $true
$NetWarningFormContinueButton.add_Click($NetWarningFormContinueButton_Click)
#
#NetWarningFormCancelButton
#
$NetWarningFormCancelButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]108,[System.Int32]167))
$NetWarningFormCancelButton.Name = [System.String]'NetWarningFormCancelButton'
$NetWarningFormCancelButton.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]75,[System.Int32]23))
$NetWarningFormCancelButton.TabIndex = [System.Int32]6
$NetWarningFormCancelButton.Text = [System.String]'Cancel'
$NetWarningFormCancelButton.UseCompatibleTextRendering = $true
$NetWarningFormCancelButton.UseVisualStyleBackColor = $true
$NetWarningFormCancelButton.add_Click($NetWarningFormCancelButton_Click)
#
#NetWarningForm
#
$NetWarningForm.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]197,[System.Int32]203))
$NetWarningForm.ControlBox = $false
$NetWarningForm.Controls.Add($NetWarningFormCancelButton)
$NetWarningForm.Controls.Add($NetWarningFormContinueButton)
$NetWarningForm.Controls.Add($NetWarningFormCheckBox1)
$NetWarningForm.Controls.Add($NetWarningFormLabel2)
$NetWarningForm.Controls.Add($NetWarningFormLabel1)
$NetWarningForm.Controls.Add($NetWarningFormPictureBox2)
$NetWarningForm.Controls.Add($NetWarningFormPictureBox1)
$NetWarningForm.MaximizeBox = $false
$NetWarningForm.MinimizeBox = $false
$NetWarningForm.ShowIcon = $false
$NetWarningForm.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterParent
$NetWarningForm.SizeGripStyle = [System.Windows.Forms.SizeGripStyle]::Hide
$NetWarningForm.Text = [System.String]'SCST'
$NetWarningForm.TopMost = $true
([System.ComponentModel.ISupportInitialize]$NetWarningFormPictureBox1).EndInit()
([System.ComponentModel.ISupportInitialize]$NetWarningFormPictureBox2).EndInit()
$NetWarningForm.ResumeLayout($false)
$NetWarningForm.PerformLayout()
Add-Member -InputObject $NetWarningForm -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $NetWarningForm -Name NetWarningFormPictureBox1 -Value $NetWarningFormPictureBox1 -MemberType NoteProperty
Add-Member -InputObject $NetWarningForm -Name NetWarningFormPictureBox2 -Value $NetWarningFormPictureBox2 -MemberType NoteProperty
Add-Member -InputObject $NetWarningForm -Name NetWarningFormLabel1 -Value $NetWarningFormLabel1 -MemberType NoteProperty
Add-Member -InputObject $NetWarningForm -Name NetWarningFormLabel2 -Value $NetWarningFormLabel2 -MemberType NoteProperty
Add-Member -InputObject $NetWarningForm -Name NetWarningFormCheckBox1 -Value $NetWarningFormCheckBox1 -MemberType NoteProperty
Add-Member -InputObject $NetWarningForm -Name NetWarningFormContinueButton -Value $NetWarningFormContinueButton -MemberType NoteProperty
Add-Member -InputObject $NetWarningForm -Name NetWarningFormCancelButton -Value $NetWarningFormCancelButton -MemberType NoteProperty
}
. InitializeComponent
