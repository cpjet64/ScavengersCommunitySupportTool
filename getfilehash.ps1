$DATETIME = Get-Date -Format FileDateTimeUniversal
$FILENAME = ".\FileHashes.txt"

New-Item .\FileHashes.txt -Force

Add-Content -Path "$FILENAME" -Value "`r`nThis Hash file was generated on $DATETIME by Cpjet64" -Encoding UTF8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm MD5 | Format-Table -AutoSize -Property Algorithm,Hash | Out-File $FILENAME -Append -Encoding utf8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm SHA1 | Format-Table -AutoSize -Property Algorithm,Hash | Out-File $FILENAME -Append -Encoding utf8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm SHA256 | Format-Table -AutoSize -Property Algorithm,Hash | Out-File $FILENAME -Append -Encoding utf8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm SHA512 | Format-Table -AutoSize -Property Algorithm,Hash | Out-File $FILENAME -Append -Encoding utf8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm MACTripleDES | Format-Table -AutoSize -Property Algorithm,Hash | Out-File $FILENAME -Append -Encoding utf8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm RIPEMD160 | Format-Table -AutoSize -Property Algorithm,Hash | Out-File $FILENAME -Append -Encoding utf8

Rename-Item -Path .\"FileHashes.txt" -NewName .\"FileHashes$DATETIME.txt"
