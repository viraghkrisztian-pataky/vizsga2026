# Powershell az ellenőrzéshez

## IP beállítáésok
```
Get-NetIPAddress -AddressFamily IPv4 | Select InterfaceAlias, IPAddress
```
## Idő és időzóna ellenőrzése
```
Get-Date; Get-TimeZone
```
## Szervezeti egységek listáázása
```
Get-ADOrganizationalUnit -Filter * | Select Name, DistinguishedName
```
