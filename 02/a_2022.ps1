<#
Rock 1
Paper 2
Scis 3

0 lose
3 draw
6 win
#>

$strarray = Get-Content ina.txt
#$answer = 0

#$inputLen = $strarray.Length
#$inputArray = New-Object int[] $inputLen

#This isn't really used because X/Y/Z are defined and don't need to be found as originally assumed
$Acount = @{"X"=0;"Y"=0;"Z"=0}
$Bcount = @{"X"=0;"Y"=0;"Z"=0}
$Ccount = @{"X"=0;"Y"=0;"Z"=0}

$score = 0

foreach ($line in $strarray) {

    $oppSign = $line[0]
    $mySign = $line[2]

    if ($oppSign -eq "A") {
        $currTable = $Acount
    } elseif ($oppSign -eq "B") {
        $currTable = $Bcount
    } elseif ($oppSign -eq "C") {
        $currTable = $Ccount
    }

    if ($mySign -eq "X") {
        $currTable.X++
        $score += 1
    } elseif ($mySign -eq "Y") {
        $currTable.Y++
        $score += 2
    } elseif ($mySign -eq "Z") {
        $currTable.Z++
        $score += 3
    }

    if ($oppSign -eq "A") {
        if ($mySign -eq "X") {
            $score += 3
        } elseif ($mySign -eq "Y") {
            $score += 6
        }
    } elseif ($oppSign -eq "B") {
        if ($mySign -eq "Y") {
            $score += 3
        } elseif ($mySign -eq "Z") {
            $score += 6
        }
    } elseif ($oppSign -eq "C") {
        if ($mySign -eq "Z") {
            $score += 3
        } elseif ($mySign -eq "X") {
            $score += 6
        }
    }
}

Write-Host $score
