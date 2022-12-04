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

    <#if (($firstPair[0] -eq $secondPair[0]) -and ($firstPair[1] -eq $secondPair[1])) {
        $answer--
    }#>
    if (($firstPair[0] -le $secondPair[0]) -and ($firstPair[1] -ge $secondPair[1])) {
        $answer++
    } elseif (($firstPair[0] -ge $secondPair[0]) -and ($firstPair[1] -le $secondPair[1])) {
        $answer++
    }
}

Write-Host $answer
