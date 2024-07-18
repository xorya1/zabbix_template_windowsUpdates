# Retrieve the latest installed update
$lastUpdate = Get-HotFix | Sort-Object -Property InstalledOn -Descending | Select-Object -First 1

# Display the installation date of the latest update
if ($lastUpdate) {
    Write-Host "Last update time: $($lastUpdate.InstalledOn.ToString('yyyy-MM-dd HH:mm:ss'))"
} else {
    Write-Host "No updates found."
}
