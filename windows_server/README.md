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
## Csoportok és felgasználók
```
Get-ADObject -Filter * -SearchBase "OU=ROXFORT,DC=vizsga,DC=local"
```
# Szkript a megosztés ellenőrzéséhez
> home_check.ps1
