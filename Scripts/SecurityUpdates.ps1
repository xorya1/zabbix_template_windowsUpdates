Get-HotFix | Where-Object { $_.Description -like "*Security Update*" } | Select-Object -Property Description, HotFixID, InstalledOn
