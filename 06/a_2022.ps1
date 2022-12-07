<#

#>

$strarray = Get-Content ina.txt
<#$answer = 0

$inputLen = $strarray.Length
$inputArray = New-Object int[] $inputLen#>

$line = $strarray

for ($i = 4;$i -le $line.Length;$i++) {
    $checkArray = $line[($i - 4)..($i - 1)]

    $correctPos = $true
    for ($j = 0;$j -lt $checkArray.Length;$j++) {
        for ($k = $j + 1;$k -lt $checkArray.Length;$k++) {
            if ($checkArray[$j] -eq $checkArray[$k]) {
                $correctPos = $false
            }
        }
    }
        
    if ($correctPos) {
        break
    }
}

Write-Host $i
