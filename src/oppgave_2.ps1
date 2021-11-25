[CmdletBinding()]
param (
    [Parameter(HelpMessage = "Et navn", Mandatory = $true)]
    [string]
    $Navn
)

Write-Host "Hei $Navn!"
