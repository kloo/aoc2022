<#

#>

$strarray = Get-Content ina.txt
$answer = 0

$inputLen = $strarray.Length
$inputArray = New-Object int[] $inputLen

$lineLength = $strarray[0].Length

$inputLen--
$lineLength--

#outside is always score 0
for ($i = 1;$i -lt ($inputLen); $i++) {
    for ($j = 1;$j -lt ($lineLength);$j++) {
        $seen = $false

        $currTree = [int] $strarray[$i][$j]

        #check up
        $upScore = 1
        for ($k = $i - 1;$k -ge 0;$k--) {
            $checkTree = [int] $strarray[$k][$j]

            if ($checkTree -lt $currTree) { #Tree not blocking los
                $upScore++
                if ($k -eq 0) { #If got to edge
                    $upScore--
                    break
                }
            } else { #Tree blocks los
                break
            }

        }

        #check down
        $downScore = 1
        for ($k = $i + 1;$k -le $inputLen;$k++) {
            $checkTree = [int] $strarray[$k][$j]

            if ($checkTree -lt $currTree) { #Tree not blocking los
                $downScore++
                if ($k -eq $inputLen) { #If got to edge
                    $downScore--
                    break
                }
            } else { #Tree blocks los
                break
            }
        }
        
        #check right
        $rightScore = 1
        for ($k = $j + 1;$k -le $lineLength;$k++) {
            $checkTree = [int] $strarray[$i][$k]

            if ($checkTree -lt $currTree) { #Tree not blocking los
                $rightScore++
                if ($k -eq $lineLength) { #If got to edge
                    $rightScore--
                    break
                }
            } else { #Tree blocks los
                break
            }
        }
        
        #check left
        $leftScore = 1
        for ($k = $j - 1;$k -ge 0;$k--) {
            $checkTree = [int] $strarray[$i][$k]

            if ($checkTree -lt $currTree) { #Tree not blocking los
                $leftScore++
                if ($k -eq 0) { #If got to edge
                    $leftScore--
                    break
                }
            } else { #Tree blocks los
                break
            }
        }


        $viewScore = $upScore * $downScore * $leftScore * $rightScore
        if ($viewScore -gt $answer) {
            #Write-Host "$i $j $upScore $downScore $leftScore $rightScore"
            $answer = $viewScore
        }
    }
}

Write-Host $answer
