@echo off
powershell.exe -ExecutionPolicy Bypass -Command "& {
    Stop-Process -Name 'OneDrive' -Force
    Stop-Process -Name 'explorer' -Force

    Write-Host 'Copy all OneDrive to Root UserProfile'
    Start-Process -FilePath robocopy -ArgumentList "`"$env:USERPROFILE\OneDrive`" `"$env:USERPROFILE`" /e /xj" -NoNewWindow -Wait

    Write-Host 'Remove OneDrive'
    Start-Process -FilePath winget -ArgumentList 'uninstall -e --purge --force --silent Microsoft.OneDrive' -NoNewWindow -Wait
}"
