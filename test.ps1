$hookurl = "https://discord.com/api/webhooks/838597970369708123/f95KX4IkB4qbt10eMdiW9SMyBEf_5uMPsr2vwXtoxNmE6OG4B0fFGM_KUesDb8wOTEJQ"

$content = @"
$DISCORDUSERNAME = GETINPUTFROMUSERGUITEXTBOX
"@

$sstlogdiscordembeds = 


$payload = [PSCustomObject]@{

    username = "SCSToolUploader"
    content = "$content"
    file = "$sstlog"

}
Invoke-RestMethod -Uri $hookUrl -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'multipart/form-data'



$readlog = Get-Content -Path "$env:TEMP\SCST.log"

$Uri = 'https://discord.com/api/webhooks/838597970369708123/f95KX4IkB4qbt10eMdiW9SMyBEf_5uMPsr2vwXtoxNmE6OG4B0fFGM_KUesDb8wOTEJQ';
$FileContent = [IO.File]::ReadAllText('C:\test.log');
$Fields = @{'appInfo'='{"name": "test"}';'filecontent'=$FileContent};

Invoke-RestMethod -Uri $Uri -Method Post -Body $Fields -ContentType 'multipart/form-data';



$readlog = Get-Content -Path "C:\test.log"
$readlog = Get-Content -Path "$env:TEMP\SCST.log"

$hookurl = "https://discord.com/api/webhooks/838597970369708123/f95KX4IkB4qbt10eMdiW9SMyBEf_5uMPsr2vwXtoxNmE6OG4B0fFGM_KUesDb8wOTEJQ"

$content = @"
$DISCORDUSERNAME GETINPUTFROMUSERGUITEXTBOX
$readlog
"@

$sstlogdiscordembeds = 
$payload = [PSCustomObject]@{

    username = "SCSToolUploader"
    content = "$content"

}
Invoke-RestMethod -Uri $hookUrl -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'Application/Json'

