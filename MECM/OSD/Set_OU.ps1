####################################################################
$text = @"

_______        _______ _______  ______ _______ ______       _______ ______  _______ _____ __   _
|_____| |         |    |______ |_____/ |______ |     \      |_____| |     \ |  |  |   |   | \  |
|     | |_____    |    |______ |    \_ |______ |_____/      |     | |_____/ |  |  | __|__ |  \_|
                                                                                                

Title: Set OU During OSD
Description: The script sets the Active Directory OU for a computer in a domain using its computer name's first letter.
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
    Title: 
    OS Support: 
    Required modules: NONE

.DESCRIPTION
The code above is a PowerShell script that sets the Active Directory Organizational Unit (OU) for a computer in a domain environment. 
The script creates an instance of the "Microsoft.SMS.TSEnvironment" object, which provides access to the environment variables in the 
System Management Server (SMS) environment. The script then retrieves the "OSDComputerName" variable and converts the first character of the computer 
name to uppercase.

Based on the uppercase first character of the computer name, the script sets the $sBuiltOU variable to the corresponding LDAP path of the desired OU. 
This is done using a switch statement, which matches the first character of the computer name with one of the 
specified characters (N, S, E, W, B, C, F, L, D, or I) and sets $sBuiltOU to the corresponding LDAP path of the desired OU.

Finally, the script sets the "OSDDomainOUName" variable to the value of $sBuiltOU, effectively specifying the desired OU for the computer in the domain.

.EXAMPLE
    

.NOTES
    Author:         Altered Admin & ChatGPT
    Email:          
    Date:           Jan 13 2023
#>

Write-Host $text

####################################################################

$env = New-Object -ComObject Microsoft.SMS.TSEnvironment
$sComputerName = $env.GetVariables()['OSDComputerName']
$oneChars = $sComputerName.Substring(0,1).ToUpper()
$sBuiltOU = ""
switch ($oneChars) {
    "N" {$sBuiltOU = "LDAP://OU=North,OU=Computers,DC=Staff,DC=Company,DC=org"}
    "S" {$sBuiltOU = "LDAP://OU=South,OU=Computers,DC=Staff,DC=Company,DC=org"}
    "E" {$sBuiltOU = "LDAP://OU=East,OU=Computers,DC=Staff,DC=Company,DC=org"}
    "W" {$sBuiltOU = "LDAP://OU=West,OU=Computers,DC=Staff,DC=Company,DC=org"}
    "B" {$sBuiltOU = "LDAP://OU=B1,OU=Computers,DC=Staff,DC=Company,DC=org"}
    "C" {$sBuiltOU = "LDAP://OU=C2,OU=Computers,DC=Staff,DC=Company,DC=org"}
    "F" {$sBuiltOU = "LDAP://OU=F,OU=Computers,DC=Staff,DC=Company,DC=org"}
    "L" {$sBuiltOU = "LDAP://OU=LA,OU=Computers,DC=Staff,DC=Company,DC=org"}
    "D" {$sBuiltOU = "LDAP://OU=Downtown,OU=Computers,DC=Staff,DC=Company,DC=org"}
    "I" {$sBuiltOU = "LDAP://OU=I,OU=Computers,DC=Staff,DC=Company,DC=org"}
}
$env.SetVariables("OSDDomainOUName", $sBuiltOU)
