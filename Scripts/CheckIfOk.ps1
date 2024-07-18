# Set the console output encoding to UTF-8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Ensure the PSWindowsUpdate module is imported
Import-Module PSWindowsUpdate

# Define the event log query for successful updates
$query = @"
<QueryList>
  <Query Id="0" Path="System">
    <Select Path="System">
      *[System[Provider[@Name='Microsoft-Windows-WindowsUpdateClient'] and (EventID=19 or EventID=20 or EventID=21)]]
    </Select>
  </Query>
</QueryList>
"@

# Get the update events
$updateEvents = Get-WinEvent -FilterXml $query | Select-Object TimeCreated, Id, Message

# Convert the output to a single string with a wide width
$output = $updateEvents | Format-Table -AutoSize | Out-String -Width 4096

# Display the output
Write-Host $output
