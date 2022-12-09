<#

#>

$strarray = Get-Content ina.txt
$answer = 0

$inputLen = $strarray.Length
$inputArray = New-Object int[] $inputLen

$seenTable = @{"0,0"=$true}

$headX = 0
$headY = 0
$tailX = 0
$tailY = 0

foreach ($line in $strarray) {
    $movement = $line.Split(" ")
    $count = [int] $movement[1]
    $mode = $line[0]

    #Write-Host $count

    for ($i = 0;$i -lt $count;$i++) {
        if ($mode -eq "U") {
            $headY++
        } elseif ($mode -eq "D") {
            $headY--
        } elseif ($mode -eq "L") {
            $headX--
        } elseif ($mode -eq "R") {
            $headX++
        }

        $diffX = $headX - $tailX
        $diffY = $headY - $tailY

        if (($diffX -gt 1) -or ($diffX -lt -1)) {
            if ($diffY -ne 0) { #move diagonal
                if ($diffX -gt 0) {
                    $tailX++
                } else {
                    $tailX--
                }

                if ($diffY -gt 0) {
                    $tailY++
                } else {
                    $tailY--
                }
            } else {
                if ($diffX -gt 0) {
                    $tailX++
                } else {
                    $tailX--
                }
            }
        } elseif (($diffY -gt 1) -or ($diffY -lt -1)) {
            if ($diffX -ne 0) { #move diagonal
                if ($diffX -gt 0) {
                    $tailX++
                } else {
                    $tailX--
                }

                if ($diffY -gt 0) {
                    $tailY++
                } else {
                    $tailY--
                }
            } else {
                if ($diffY -gt 0) {
                    $tailY++
                } else {
                    $tailY--
                }
            }
        }

        $tailPos = "$tailX,$tailY"
        if (!$seenTable.ContainsKey($tailPos)) {
            $seenTable.Add("$tailPos",$true)
        }
    }
}

Write-Host $seenTable.Keys.Count
