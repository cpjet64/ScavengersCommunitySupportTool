$MSUWaitWarningCancelButton_Click = {
    $MSUWaitWarningForm.Close()
}
$MSUWaitWarningContinueButton_Click = {
    $MSUWaitWarningCancelButton.Enabled = $false
    $MSUWaitWarningContinueButton.Enabled = $false
    if (Test-PendingReboot($value) -eq $true) {RestartComputer $MSUWaitWarningForm.Close()}
    else {MSUpdate}
    if (Test-PendingReboot($value) -eq $true) {RestartComputer}
    $MSUWaitWarningForm.Close()
}
$MSUWaitWarningCheckBox1_CheckedChanged = {
if ($MSUWaitWarningCheckBox1.Checked) {$MSUWaitWarningContinueButton.Enabled = $true}
else {$MSUWaitWarningContinueButton.Enabled = $false}
}