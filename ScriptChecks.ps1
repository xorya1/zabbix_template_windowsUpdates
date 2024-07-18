$availableUpdates = Get-WindowsUpdate 

if ($availableUpdates) {
    Write-Host "Available updates:"
    $availableUpdates | Format-Table -AutoSize
} else {
    Write-Host "No updates are currently available."
}
