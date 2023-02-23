####################################################################
$text = @"

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
    Title: Webpage Service Watcher
    OS Support: 
    Required modules: NONE

.DESCRIPTION
    This PowerShell script monitors a website for the presence of specific text, and if the text is not found, it restarts a specified Windows service. 
    The script uses a while loop to continuously check the website at a specified interval, and writes log messages to a daily log file that includes the current date in the name.

    To use the script, you can modify the variables at the top of the script to specify the URL of the website to monitor, the text to search for, 
    the name of the service to restart, the interval between checks, and the directory where log files should be stored.

    The script then uses a while loop to continuously check the website, and if the specified text is not found, it writes a log message and restarts 
    the specified service. If the text is found, the script simply writes a log message indicating that the text was found.

    The script also includes code to create a new log file each day and include the current date in the name of the file. This makes it easy to keep track of what happened on each day, 
    and to troubleshoot any issues that may arise.

    By using this script, you can automate the monitoring of a website and the restart of a service if necessary, 
    and keep a detailed log of everything that happens for troubleshooting purposes.



.EXAMPLE
    

.NOTES
    Author:         Altered Admin & ChatGPT
    Email:          
    Date:           FEB 23 2023
#>

Write-Host $text

####################################################################




$websiteUrl = "https://www.example.com" # Change this to the URL of the website you want to monitor
$textToFind = "Welcome" # Change this to the text you want to search for on the website
$serviceName = "MyService" # Change this to the name of the service you want to restart
$checkIntervalInSeconds = 60 # Change this to the number of seconds you want to wait between each check
$logDirectory = "C:\Temp\Logs" # Change this to the location where you want to store the log files

while ($true) {
    $webContent = Invoke-WebRequest $websiteUrl
    if ($webContent.Content.Contains($textToFind)) {
        Write-Host "Found text on website."
        Add-Content $logFile "$(Get-Date) - Found text on website."
    }
    else {
        Write-Host "Text not found on website. Restarting service..."
        Add-Content $logFile "$(Get-Date) - Text not found on website. Restarting service."
        Restart-Service $serviceName
    }

    # Get today's date and format it as YYYY-MM-DD
    $dateString = Get-Date -Format "yyyy-MM-dd"

    # Build the full path to the log file for today's date
    $logFileName = "MonitorLog_$dateString.txt"
    $logFile = Join-Path -Path $logDirectory -ChildPath $logFileName

    Start-Sleep -Seconds $checkIntervalInSeconds
}
