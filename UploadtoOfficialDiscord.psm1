function UploadtoOfficialDiscord
{
$discordusernameentrysend = Get-Content -Path "$env:TEMP\SCSTDiscord.txt"
$Uri = 'https://discordapp.com/api/webhooks/839604797006938144/P0w_nD7lmD2tMh-Q8htVy3BqDNf4qnBsAohF1c7c_idOAvvfYwpSyumyUTHVSV9ht7mh'
$content = @"

$discordusernameentrysend Submitted this log file.

"@
$payload = [PSCustomObject]@{
    content = $content
}
Invoke-RestMethod -Uri $Uri -Method Post -Body ($payload | ConvertTo-Json) -ContentType 'Application/Json'
function Submit-TextFile($filePath,$Uri){
    $filename = (Get-ChildItem $filePath).Name
    $filecontents = Get-Content $filePath -raw
    $boundary = [guid]::NewGuid().ToString()
    $contentinfo = "Content-Disposition: form-data; name=`"file`"; filename=`"$filename`"`nContent-Type: text/html; charset=utf-8`n"
    $body = "--$boundary`n$contentinfo`n$filecontents`n--$boundary--`n"
    $params = @{
        Uri         = $Uri
        Body        = $body
        Method      = 'Post'
        ContentType = "multipart/form-data; boundary=$boundary"
    }
    Invoke-RestMethod @params
}
$filePath = (Get-Item $logfiletoupload).FullName
Submit-TextFile $filePath $Uri
}