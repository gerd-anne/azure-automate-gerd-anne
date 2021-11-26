
[CmdletBinding()]
param (
    [Parameter(HelpMessage = "URL til kortstokk", Mandatory = $false)]
    [string]
    $UrlKortstokk = 'http://nav-deckofcards.herokuapp.com/shuffle'
)

$webRequest = Invoke-WebRequest -Uri $UrlKortstokk

$kortstokkJson = $webRequest.Content

$kortstokk = ConvertFrom-Json -InputObject $kortstokkJson

function kortstokkTilStreng {
    [OutputType([string])]
    param (
        [object[]]
        $kortstokk
    )
    $streng = $kortstokk
    foreach ($kort in $kortstokk) {
        $streng = $streng + "$($kort.suit[0])$($kort.value)"
    }
    return $streng
}

Write-Output "Kortstokk: $(kortStokkTilStreng -kortstokk $kortstokk)"



