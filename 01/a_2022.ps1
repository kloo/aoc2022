<#

#>

$strarray = Get-Content ina.txt
$answer = 0

$bigElf = 0
$currElf = 0

foreach ($line in $strarray) {
    if ($line -eq "") {
        if ($currElf -gt $bigElf) {
            $bigElf = $currElf
            $currElf = 0
        } else { $currElf = 0 }
    } else {
        $currElf += [int] $line
    }
}

Write-Host $bigElf
