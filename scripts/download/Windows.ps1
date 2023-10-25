$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
Set-StrictMode -Version Latest
Write-Host ::group::Downloading age $env:version for Windows
Invoke-WebRequest $env:GITHUB_SERVER_URL/FiloSottile/age/releases/download/$env:version/age-$env:version-windows-amd64.zip -OutFile age-$env:version-windows-amd64.zip
Expand-Archive age-$env:version-windows-amd64.zip age
Move-Item age\age\* age
Remove-Item age-$env:version-windows-amd64.zip, age\age
Write-Host ::endgroup::