<#

#>

$strarray = Get-Content ina.txt
$answer = 0

$inputLen = $strarray.Length
$inputArray = New-Object int[] $inputLen

foreach ($line in $strarray) {
    $pairs = $line.Split(",")
    $firstPair = [int[]] $pairs[0].Split("-")
    $secondPair = [int[]] $pairs[1].Split("-")

    if (($firstPair[1] -ge $secondPair[0]) -and ($firstPair[0] -le $secondPair[0])) {
        $answer++
    } elseif (($firstPair[0] -le $secondPair[1]) -and ($firstPair[0] -ge $secondPair[0])) {
        $answer++
    }
}

Write-Host $answer
