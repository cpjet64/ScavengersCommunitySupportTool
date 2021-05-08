$DATETIME = Get-Date
$TIMEZONE = Get-TimeZone

New-Item ".\FILEHASH.txt" -Force

Add-Content -Path ".\FILEHASH.txt" -Value "`r`nThis Hash file was generated on $DATETIME $TIMEZONE by Cpjet64" -Encoding UTF8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm MD5 | Format-Table -AutoSize -Property Algorithm, Hash | Out-File FILEHASH.txt -Append -Encoding utf8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm SHA1 | Format-Table -AutoSize -Property Algorithm, Hash | Out-File FILEHASH.txt -Append -Encoding utf8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm SHA256 | Format-Table -AutoSize -Property Algorithm, Hash | Out-File FILEHASH.txt -Append -Encoding utf8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm SHA512 | Format-Table -AutoSize -Property Algorithm, Hash | Out-File FILEHASH.txt -Append -Encoding utf8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm MACTripleDES | Format-Table -AutoSize -Property Algorithm, Hash | Out-File FILEHASH.txt -Append -Encoding utf8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm RIPEMD160 | Format-Table -AutoSize -Property Algorithm, Hash | Out-File FILEHASH.txt -Append -Encoding utf8

