param(
    [string]$url
)

Write-Host "Checking application health at $url"

$response = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 30

if ($response.StatusCode -eq 200) {
    Write-Host "Application is healthy."
}
else {
    Write-Error "Health check failed."
    exit 1
}