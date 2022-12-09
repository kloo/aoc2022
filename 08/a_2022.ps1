<#

#>

$strarray = Get-Content ina.txt
$answer = 0

$inputLen = $strarray.Length
$inputArray = New-Object int[] $inputLen

$lineLength = $strarray[0].Length


#outside is always visible
$answer = ($lineLength * 2) + ($inputLen * 2) - 4

$inputLen--
$lineLength--

for ($i = 1;$i -lt ($inputLen); $i++) {
    for ($j = 1;$j -lt ($lineLength);$j++) {
        $seen = $false

        $currTree = [int] $strarray[$i][$j]

        #check up
        for ($k = $i - 1;$k -ge 0;$k--) {
            $checkTree = [int] $strarray[$k][$j]

            if ($checkTree -lt $currTree) { #Tree not blocking los
                if ($k -eq 0) { #If got to edge
                    $answer++
                    $seen = $true
                    break
                }
            } else { #Tree blocks los
                break
            }

        }

        #check down
        if (!$seen) {
            for ($k = $i + 1;$k -le $inputLen;$k++) {
                $checkTree = [int] $strarray[$k][$j]

                if ($checkTree -lt $currTree) { #Tree not blocking los
                    if ($k -eq $inputLen) { #If got to edge
                        $answer++
                        $seen = $true
                        break
                    }
                } else { #Tree blocks los
                    break
                }
            }
        }
        
        #check right
        if (!$seen) {
            for ($k = $j + 1;$k -le $lineLength;$k++) {
                $checkTree = [int] $strarray[$i][$k]

                if ($checkTree -lt $currTree) { #Tree not blocking los
                    if ($k -eq $lineLength) { #If got to edge
                        $answer++
                        $seen = $true
                        break
                    }
                } else { #Tree blocks los
                    break
                }
            }
        }
        
        #check left
        if (!$seen) {
            for ($k = $j - 1;$k -ge 0;$k--) {
                $checkTree = [int] $strarray[$i][$k]

                if ($checkTree -lt $currTree) { #Tree not blocking los
                                    if ($k -eq 0) { #If got to edge
                    $answer++
                    $seen = $true
                    break
                }
                } else { #Tree blocks los
                    break
                }
            }
        }
    }
}

Write-Host $answer
