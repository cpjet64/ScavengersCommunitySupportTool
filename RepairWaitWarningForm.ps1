$RepairWaitWarningFormCancelButton_Click = {
    $RepairWaitWarningForm.Close()
}
$RepairWaitWarningFormContinueButton_Click = {
    $RepairWaitWarningFormCancelButton.Enabled = $false
    $RepairWaitWarningFormContinueButton.Enabled = $false
    if (Test-PendingReboot($value) -eq $true) {RestartComputer}
    else {Repair}
    $RepairWaitWarningForm.Close()
}
$RepairWaitWarningFormCheckBox1_CheckedChanged = {
if ($RepairWaitWarningFormCheckBox1.Checked) {$RepairWaitWarningFormContinueButton.Enabled = $true}
else {$RepairWaitWarningFormContinueButton.Enabled = $false}
}