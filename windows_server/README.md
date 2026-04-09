# Powershell az ellenőrzéshez

## IP beállítáésok
```
Get-NetIPAddress -AddressFamily IPv4 | Select InterfaceAlias, IPAddress
```
