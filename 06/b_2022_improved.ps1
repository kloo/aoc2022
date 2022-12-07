<#

#>

$strarray = Get-Content ina.txt
<#$answer = 0

$inputLen = $strarray.Length
$inputArray = New-Object int[] $inputLen#>

$line = $strarray

for ($i = 14;$i -le $line.Length;$i++) {
    $checkArray = $line[($i - 14)..($i - 1)] | Sort-Object
    $uniques = $checkArray | Get-Unique
        
    if ($uniques.Length -lt $checkArray.Length) {
        break
    }
}

Write-Host $i
