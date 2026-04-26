Import-Module GroupPolicy
Import-Module ActiveDirectory

$reportPath = "C:\Detailed_Client_GPO_Report.html"
$tempFolder = "C:\TempGPOXML"

# Temp mappa létrehozása
if (!(Test-Path $tempFolder)) {
    New-Item -ItemType Directory -Path $tempFolder | Out-Null
}

$html = @"
<html>
<head>
<title>Detailed GPO Report</title>
<style>
body {
    font-family: Arial;
    margin: 20px;
}
h1 {
    color: #2c3e50;
}
h2 {
    color: #34495e;
}
table {
    border-collapse: collapse;
    width: 100%;
    margin-bottom: 20px;
}
th, td {
    border: 1px solid #ccc;
    padding: 8px;
}
th {
    background-color: #3498db;
    color: white;
}
.enabled {
    color: green;
    font-weight: bold;
}
.disabled {
    color: red;
    font-weight: bold;
}
</style>
<meta charset="UTF-8">
</head>
<body>
<h1>Aktív kliens GPO beállítások</h1>
"@

$ous = Get-ADOrganizationalUnit -Filter *

foreach ($ou in $ous) {
    $inheritance = Get-GPInheritance -Target $ou.DistinguishedName

    foreach ($gpoLink in $inheritance.GpoLinks) {
        $gpo = Get-GPO -Name $gpoLink.DisplayName

        $xmlPath = "$tempFolder\$($gpo.DisplayName).xml"
        Get-GPOReport -Guid $gpo.Id -ReportType Xml -Path $xmlPath

        [xml]$xml = Get-Content $xmlPath

        $html += "<h2>OU: $($ou.Name) → GPO: $($gpo.DisplayName)</h2>"
        $html += "<table>"
        $html += "<tr><th>Beállítás</th><th>Állapot</th></tr>"

        $settings = $xml.GPO.Computer.ExtensionData.Extension.Policy
        $settings += $xml.GPO.User.ExtensionData.Extension.Policy

        foreach ($setting in $settings) {
            $name = $setting.Name
            $state = $setting.State

            if ($state -eq "Enabled") {
                $html += "<tr><td>$name</td><td class='enabled'>Enabled</td></tr>"
            }
            elseif ($state -eq "Disabled") {
                $html += "<tr><td>$name</td><td class='disabled'>Disabled</td></tr>"
            }
        }

        $html += "</table>"
    }
}

$html += "</body></html>"

$html | Set-Content -Encoding Unicode $reportPath

Start-Process $reportPath

Write-Host "Részletes riport elkészült: $reportPath"
