<#

#>

$strarray = Get-Content ina.txt
$answer = 0

$inputArray = @()

$currElf = 0

foreach ($line in $strarray) {
    if ($line -eq "") {
        $inputArray += $currElf
        $currElf = 0
    } else {
        $currElf += [int] $line
    }
}

$inputArray = $inputArray | Sort-Object

$answer = $inputArray[-1] + $inputArray[-2] + $inputArray[-3]

Write-Host $answer
