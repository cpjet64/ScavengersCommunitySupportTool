$LauncherWindow = New-Object -TypeName System.Windows.Forms.Form
[System.Windows.Forms.Button]$DataCollectorButton = $null
[System.Windows.Forms.Button]$RepairToolButton = $null
[System.Windows.Forms.CheckBox]$AcceptCheckBox = $null
[System.Windows.Forms.Label]$Label1 = $null
[System.Windows.Forms.Label]$Label2 = $null
[System.Windows.Forms.Label]$Label3 = $null
[System.Windows.Forms.Label]$Label4 = $null
function InitializeComponent
{
$DataCollectorButton = (New-Object -TypeName System.Windows.Forms.Button)
$RepairToolButton = (New-Object -TypeName System.Windows.Forms.Button)
$AcceptCheckBox = (New-Object -TypeName System.Windows.Forms.CheckBox)
$Label1 = (New-Object -TypeName System.Windows.Forms.Label)
$Label2 = (New-Object -TypeName System.Windows.Forms.Label)
$Label3 = (New-Object -TypeName System.Windows.Forms.Label)
$Label4 = (New-Object -TypeName System.Windows.Forms.Label)
$LauncherWindow.SuspendLayout()
#
#DataCollectorButton
#
$DataCollectorButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]47,[System.Int32]147))
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
$RepairToolButton.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]206,[System.Int32]147))
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
#Label1
#
$Label1.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]12,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$Label1.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]9))
$Label1.Name = [System.String]'Label1'
$Label1.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]335,[System.Int32]92))
$Label1.TabIndex = [System.Int32]7
$Label1.Text = [System.String]'This is a UNOFFICIAL tool created by the community for the community. This tool is NOT supported by the game''s developer.'
$Label1.TextAlign = [System.Drawing.ContentAlignment]::TopCenter
$Label1.UseCompatibleTextRendering = $true
#
#Label2
#
$Label2.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]12,[System.Int32]81))
$Label2.Name = [System.String]'Label2'
$Label2.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]335,[System.Int32]29))
$Label2.TabIndex = [System.Int32]8
$Label2.Text = [System.String]'If you understand this and accept the risk check the box below to proceed.'
$Label2.TextAlign = [System.Drawing.ContentAlignment]::TopCenter
$Label2.UseCompatibleTextRendering = $true
#
#Label3
#
$Label3.Font = (New-Object -TypeName System.Drawing.Font -ArgumentList @([System.String]'Tahoma',[System.Single]6.75,[System.Drawing.FontStyle]::Regular,[System.Drawing.GraphicsUnit]::Point,([System.Byte][System.Byte]0)))
$Label3.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]72,[System.Int32]189))
$Label3.Name = [System.String]'Label3'
$Label3.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]215,[System.Int32]14))
$Label3.TabIndex = [System.Int32]9
$Label3.Text = [System.String]'Developed by Cpjet64 and Void_Sentient/Hunhow'
$Label3.TextAlign = [System.Drawing.ContentAlignment]::TopCenter
$Label3.UseCompatibleTextRendering = $true
#
#Label4
#
$Label4.Location = (New-Object -TypeName System.Drawing.Point -ArgumentList @([System.Int32]321,[System.Int32]189))
$Label4.Name = [System.String]'Label4'
$Label4.Size = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]26,[System.Int32]14))
$Label4.TabIndex = [System.Int32]10
$Label4.Text = [System.String]'v1.3'
$Label4.UseCompatibleTextRendering = $true
#
#LauncherWindow
#
$LauncherWindow.ClientSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]359,[System.Int32]212))
$LauncherWindow.Controls.Add($Label4)
$LauncherWindow.Controls.Add($Label3)
$LauncherWindow.Controls.Add($Label2)
$LauncherWindow.Controls.Add($Label1)
$LauncherWindow.Controls.Add($AcceptCheckBox)
$LauncherWindow.Controls.Add($RepairToolButton)
$LauncherWindow.Controls.Add($DataCollectorButton)
$LauncherWindow.MaximizeBox = $false
$LauncherWindow.MaximumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]375,[System.Int32]251))
$LauncherWindow.MinimizeBox = $false
$LauncherWindow.MinimumSize = (New-Object -TypeName System.Drawing.Size -ArgumentList @([System.Int32]375,[System.Int32]251))
$LauncherWindow.SizeGripStyle = [System.Windows.Forms.SizeGripStyle]::Hide
$LauncherWindow.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$LauncherWindow.Text = [System.String]'Scavengers Community Support Tool'
$LauncherWindow.TopMost = $true
$LauncherWindow.add_Load($LauncherWindow_Load)
$LauncherWindow.ResumeLayout($false)
Add-Member -InputObject $LauncherWindow -Name base -Value $base -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name DataCollectorButton -Value $DataCollectorButton -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name RepairToolButton -Value $RepairToolButton -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name AcceptCheckBox -Value $AcceptCheckBox -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name Label1 -Value $Label1 -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name Label2 -Value $Label2 -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name Label3 -Value $Label3 -MemberType NoteProperty
Add-Member -InputObject $LauncherWindow -Name Label4 -Value $Label4 -MemberType NoteProperty
}
. InitializeComponent
