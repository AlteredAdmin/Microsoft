'Title: SCCM OSD Set OU Name via .VBS
'Description: Used to set OUs for OSD Based off starting characters for the computer name
'More info: https://alteredadmin.github.io/posts/sccm-osd-set-ou-name-via-vbs/
'=====================================================
'Name: Altered Admin
'Website: https://alteredadmin.github.io/
'If you found this helpful Please consider:
'Buymeacoffee: http://buymeacoffee.com/alteredadmin
'BTC: bc1qhkw7kv9dtdk8xwvetreya2evjqtxn06cghyxt7
'LTC: ltc1q2mrh9s8sgmh8h5jtra3gqxuhvy04vuagpm3dk9
'ETH: 0xef053b0d936746Df00C9CCe0454b7b8afb1497ac


set env = CreateObject("Microsoft.SMS.TSEnvironment")
sComputerName = env("OSDComputerName")
oneChars = UCase(Left(sComputerName,1))
sBuiltOU = ""
     If oneChars = "N" Then
        sBuiltOU = "LDAP://OU=North,OU=Computers,DC=Staff,DC=Company,DC=org"
	End If
     If oneChars = "S" Then
        sBuiltOU = "LDAP://OU=South,OU=Computers,DC=Staff,DC=Company,DC=org"
	End If
     If oneChars = "E" Then
        sBuiltOU = "LDAP://OU=East,OU=Computers,DC=Staff,DC=Company,DC=org"
	End If
     If oneChars = "W" Then
        sBuiltOU = "LDAP://OU=West,OU=Computers,DC=Staff,DC=Company,DC=org"
	End If
     If oneChars = "B" Then
        sBuiltOU = "LDAP://OU=B1,OU=Computers,DC=Staff,DC=Company,DC=org"
	End If
     If oneChars = "C" Then
        sBuiltOU = "LDAP://OU=C2,OU=Computers,DC=Staff,DC=Company,DC=org"
	End If
     If oneChars = "F" Then
        sBuiltOU = "LDAP://OU=F,OU=Computers,DC=Staff,DC=Company,DC=org"
	End If
     If oneChars = "L" Then
        sBuiltOU = "LDAP://OU=LA,OU=Computers,DC=Staff,DC=Company,DC=org"
	End If
     If oneChars = "D" Then
        sBuiltOU = "LDAP://OU=Downtown,OU=Computers,DC=Staff,DC=Company,DC=org"
	End If
     If oneChars = "I" Then
        sBuiltOU = "LDAP://OU=I,OU=Computers,DC=Staff,DC=Company,DC=org"
	End If
env("OSDDomainOUName") = sBuiltOU
Wscript.quit
