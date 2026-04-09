$basePath = "C:\diakok"
$shareName = "diakok"

# =========================
# 1. SZAKASZ – MEGOSZTÁS
# =========================
Write-Host "=== 1. SZAKASZ: MEGOSZTÁSI JOGOSULTSÁGOK ===" -ForegroundColor Cyan

Get-SmbShareAccess -Name $shareName | ForEach-Object {
    [PSCustomObject]@{
        Felhasználó = $_.AccountName
        Jogosultság = $_.AccessRight
    }
} | Format-Table -AutoSize


# =========================
# 2. SZAKASZ – NTFS (GUI-szerű)
# =========================
Write-Host "`n=== 2. SZAKASZ: ALMAPPÁK JOGOSULTSÁGAI ===" -ForegroundColor Cyan

Get-ChildItem $basePath -Directory | ForEach-Object {

    Write-Host "`nMappa: $($_.Name)" -ForegroundColor Yellow

    (Get-Acl $_.FullName).Access |
    Where-Object { $_.IsInherited -eq $false } |
    Group-Object IdentityReference | ForEach-Object {

        $rights = $_.Group.FileSystemRights

        if ($rights -contains "FullControl") {
            $level = "FullControl"
        }
        elseif ($rights -match "Modify") {
            $level = "Modify"
        }
        else {
            $level = ($rights | Select-Object -Unique) -join ", "
        }

        [PSCustomObject]@{
            Felhasználó = $_.Name
            Jogosultság = $level
        }
    } | Format-Table -AutoSize
}
