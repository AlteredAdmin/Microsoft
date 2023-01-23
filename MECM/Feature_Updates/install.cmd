rem Title: Feature Update Windows 10 Using SCCM Application Model
rem Description: script used to installa DCU and update Drivers and bios
rem More info: https://alteredadmin.github.io/posts/feature-update-windows-10-using-sccm-application-model/
rem =====================================================
rem Name: Altered Admin
rem Website: https://alteredadmin.github.io
rem If you found this helpful Please consider:
rem Buymeacoffee: http://buymeacoffee.com/alteredadmin
rem BTC: bc1qhkw7kv9dtdk8xwvetreya2evjqtxn06cghyxt7
rem LTC: ltc1q2mrh9s8sgmh8h5jtra3gqxuhvy04vuagpm3dk9
rem ETH: 0xef053b0d936746Df00C9CCe0454b7b8afb1497ac

start /w WindowsUpdateBox /Update /PreDownload /quiet
start /w WindowsUpdateBox /Update /Install /quiet
start /w WindowsUpdateBox /Update /Finalize /quiet