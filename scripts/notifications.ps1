param(
    [string]$WebhookUrl,
    [string]$TriggeredBy,
    [string]$Version,
    [string]$Environment
)

$message = @{
    "@type"      = "MessageCard"
    "@context"   = "http://schema.org/extensions"
    "summary"    = "Deployment Notification"
    "themeColor" = "0076D7"
    "title"      = "Deployment Completed"
    "sections"   = @(
        @{
            "facts" = @(
                @{ "name" = "Triggered By"; "value" = $TriggeredBy },
                @{ "name" = "Version"; "value" = $Version },
                @{ "name" = "Environment"; "value" = $Environment }
            )
        }
    )
}

$body = $message | ConvertTo-Json -Depth 5

Invoke-RestMethod -Method Post -Uri $WebhookUrl -Body $body -ContentType 'application/json'