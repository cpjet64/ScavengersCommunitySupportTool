$FWWarningCancelButton_Click = {
    $FWWarningForm.Close()
}
$FWWarningCheckBox1_CheckedChanged = {
    if ($FWWarningCheckBox1.Checked) {$FWWarningContinueButton.Enabled = $true}
    else {$FWWarningContinueButton.Enabled = $false}
}
$FWWarningContinueButton_Click = {
    ResetWinFW
    $FWWarningForm.Close()
}