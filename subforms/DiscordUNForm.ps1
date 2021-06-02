$DiscordUNCancelButton_Click = {
    $DiscordUNEntryForm.Close()
}
$DiscordUNContinueButton_Click = {
    $global:discordusername = $DiscordUsernameEntryBox.Text
}
$DiscordUsernameEntryBox_TextChanged = {
    $DiscordUNContinueButton.Enabled = $true
}