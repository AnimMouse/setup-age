$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest
Write-Host ::group::Downloading age $env:version for Windows
Invoke-WebRequest $env:GITHUB_SERVER_URL/FiloSottile/age/releases/download/$env:version/age-$env:version-windows-amd64.zip -OutFile age-$env:version-windows-amd64.zip
7z e age-$env:version-windows-amd64.zip age.exe age-keygen.exe -oage -r
Remove-Item age-$env:version-windows-amd64.zip
Write-Host ::endgroup::