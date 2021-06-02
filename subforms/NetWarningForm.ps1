$NetWarningFormCancelButton_Click = {
    $NetWarningForm.Close()
}
$NetWarningFormCheckBox1_CheckedChanged = {
    if ($NetWarningFormCheckBox1.Checked) {$NetWarningFormContinueButton.Enabled = $true}
    else {$NetWarningFormContinueButton.Enabled = $false}
}
$NetWarningFormContinueButton_Click = {
    ResetWinFW
    $NetWarningForm.Close()
}