
# Zabbix Template for Windows Updates

This repository contains a Zabbix template designed to monitor various components of Windows updates using remote PowerShell on different versions of Windows Servers.

## Overview

I have created this template and the accompanying PowerShell scripts to provide detailed information on Windows updates. These scripts can be directly linked to a host in Zabbix to gather various data points related to Windows updates.

## Requirements

1. Ensure the PowerShell scripts are placed on your Windows servers in the specified path: `C:\zabbix-agent-scripts`.
2. The template and scripts are compatible with the following versions of Windows Servers:
    - Windows Server 2008
    - Windows Server 2012
    - Windows Server 2016

## PowerShell Scripts

Below are the PowerShell scripts included in this repository. These scripts should be copied to your Windows servers:

- `CheckIfOKp4.ps1`
- `PendingOrYetToBeInstalledUpdates.ps1`
- `TimeSinceLastUpdate.ps1`
- `ScriptChecks.ps1`
- `SecurityUpdates.ps1`
- `GetWindowsCurrentVersion.ps1`
- `CheckIfOk.ps1`
- `DaysSinceLastWindowsUpdate.ps1`
- `CheckForUpdates.ps1`
- `CheckForPendingReboots.ps1`

## Installation

1. Clone this repository to your local machine.
2. Copy the PowerShell scripts to `C:\zabbix-agent-scripts` on your Windows servers.
3. Import the Zabbix template into your Zabbix server.
4. Link the template to the appropriate hosts.
5. Configure your Zabbix agents to allow remote PowerShell execution if not already enabled.

## Troubleshooting

If the template does not work as expected, ensure you have the Windows Update module installed. Additionally, you may need to update the TLS version by running the following command:

```powershell
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
```

## Usage

Once the scripts are in place and the template is linked to your hosts, Zabbix will start collecting data based on the provided PowerShell scripts. The data collected will include:

- Status of pending updates
- Time since the last update
- Current version of Windows
- Security updates status
- Pending reboots, and more

## Contribution

Feel free to fork this repository and contribute by submitting pull requests. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the MIT License. You are free to use, modify, and distribute this software as you see fit.
