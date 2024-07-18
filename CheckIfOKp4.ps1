# Convert WUA history ResultCode to a human-readable name
function Convert-WuaResultCodeToName {
    param (
        [Parameter(Mandatory=$true)]
        [int] $ResultCode
    )
    switch ($ResultCode) {
        2 { "Succeeded" }
        3 { "Succeeded With Errors" }
        4 { "Failed" }
    }
}

# Get Windows Update history
function Get-WuaHistory {
    $session = New-Object -ComObject 'Microsoft.Update.Session'
    $history = $session.QueryHistory("", 0, 50) | ForEach-Object {
        $Result = Convert-WuaResultCodeToName -ResultCode $_.ResultCode
        $_ | Add-Member -MemberType NoteProperty -Value $Result -Name Result
        $_ | Add-Member -MemberType NoteProperty -Value $_.UpdateIdentity.UpdateId -Name UpdateId
        $_ | Add-Member -MemberType NoteProperty -Value $_.UpdateIdentity.RevisionNumber -Name RevisionNumber
        Write-Output $_
    }
    $history | Select-Object Date, KB, @{l='Category';e={[string]$_.Categories[0].Name}}, Title, Result
}

# Get the last 50 Windows Update events
Get-WuaHistory
