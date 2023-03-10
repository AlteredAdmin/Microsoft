####################################################################
<#

_______        _______ _______  ______ _______ ______       _______ ______  _______ _____ __   _
|_____| |         |    |______ |_____/ |______ |     \      |_____| |     \ |  |  |   |   | \  |
|     | |_____    |    |______ |    \_ |______ |_____/      |     | |_____/ |  |  | __|__ |  \_|
                                                                                                

Title: 
Description: 
More info: https://alteredadmin.github.io/
=====================================================
Name: Altered Admin
Website: https://alteredadmin.github.io
Twitter: https://twitter.com/Alt3r3dAdm1n
If you found this helpful Please consider:
Buymeacoffee: http://buymeacoffee.com/alteredadmin
BTC: bc1qhkw7kv9dtdk8xwvetreya2evjqtxn06cghyxt7
LTC: ltc1q2mrh9s8sgmh8h5jtra3gqxuhvy04vuagpm3dk9
ETH: 0xef053b0d936746Df00C9CCe0454b7b8afb1497ac

"@

####################################################################

<#
.SYNOPSIS
    Title: Service Monitor
    OS Support: 
    Required modules: NONE

.DESCRIPTION
    The "ServiceMonitor.ps1" PowerShell script monitors a specified Windows service and automatically starts it if it goes down. 
    The script uses an infinite loop to continuously check the status of the service at a specified interval, and logs any actions taken to a file with the current date in the filename. 
    This script can be useful for ensuring critical services are always running and can be easily scheduled to run automatically using Windows Task Scheduler.




.EXAMPLE
    

.NOTES
    Author:         Altered Admin & ChatGPT
    Email:          
    Date:           FEB 23 2023
#>


####################################################################
#>

# Variables
$ServiceName = "NameOfServiceToMonitor"
$LogLocation = "C:\Logs"
$IntervalInSeconds = 60

# Get current date in format yyyy-MM-dd
$CurrentDate = Get-Date -Format "yyyy-MM-dd"

# Create log file with current date if it doesn't exist
$LogFile = "$LogLocation\ServiceMonitor_$CurrentDate.log"
if (-not (Test-Path $LogFile)) {
    New-Item $LogFile -ItemType File | Out-Null
}

# Loop indefinitely
while ($true) {
    # Check service status
    $ServiceStatus = Get-Service $ServiceName | Select-Object -ExpandProperty Status

    # If service is stopped, start it and log the action
    if ($ServiceStatus -ne "Running") {
        Start-Service $ServiceName
        Add-Content $LogFile "$(Get-Date) - Service $ServiceName was stopped and has been started."
    }

    # Wait for specified interval before checking again
    Start-Sleep -Seconds $IntervalInSeconds
}
