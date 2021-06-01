.(Join-Path $PSScriptRoot 'ScavengersCST.ps1')
$DATETIME = Get-Date -Format FileDateTimeUniversal
$FILENAME = ".\FileHashes.txt"

New-Item .\FileHashes.txt -Force

Add-Content -Path "$FILENAME" -Value "`r`nThis Hash file was generated on $DATETIME by Cpjet64 for the file named ScavengersCST.exe $version" -Encoding UTF8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm MD5 | Format-Table -AutoSize -Property Algorithm,Hash | Out-File $FILENAME -Append -Encoding utf8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm SHA1 | Format-Table -AutoSize -Property Algorithm,Hash | Out-File $FILENAME -Append -Encoding utf8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm SHA256 | Format-Table -AutoSize -Property Algorithm,Hash | Out-File $FILENAME -Append -Encoding utf8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm SHA512 | Format-Table -AutoSize -Property Algorithm,Hash | Out-File $FILENAME -Append -Encoding utf8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm MACTripleDES | Format-Table -AutoSize -Property Algorithm,Hash | Out-File $FILENAME -Append -Encoding utf8

Get-FileHash .\compiled\ScavengersCST.exe -Algorithm RIPEMD160 | Format-Table -AutoSize -Property Algorithm,Hash | Out-File $FILENAME -Append -Encoding utf8

Rename-Item -Path .\"FileHashes.txt" -NewName .\"FileHashes$version.txt"

if (Test-Path -Path .\release\"LICENSE.md") {Remove-Item -Path .\release\"LICENSE.md"}
if (Test-Path -Path .\release\"README.md") {Remove-Item -Path .\release\"README.md"}
if (Test-Path -Path .\release\"ScavengersCST.exe") {Remove-Item -Path .\release\"ScavengersCST.exe"}
Copy-Item .\"LICENSE.md" -Destination .\release\"LICENSE.md"
Copy-Item .\"README.md" -Destination .\release\"README.md"
Copy-Item .\compiled\"ScavengersCST.exe" -Destination .\release\"ScavengersCST.exe"
Remove-Item .\release\FileHashes*.txt

Move-Item -Path .\"FileHashes$version.txt" -Destination .\release\"FileHashes$version.txt"