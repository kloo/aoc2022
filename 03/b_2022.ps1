<#

#>

$strarray = Get-Content ina.txt
$answer = 0

$inputLen = $strarray.Length
$inputArray = New-Object int[] $inputLen

$currLine = 0
$firstLine = ""
$secondLine = ""
$thirdLine = ""

foreach ($line in $strarray) {
    if ($currLine -eq 0) {
        $firstLine = $line
        $currLine = 1
    } elseif ($currLine -eq 1) {
        $secondLine = $line
        $currLine = 2
    } elseif ($currLine -eq 2) {
        $thirdLine = $line

        foreach ($char in ([char[]]$thirdLine)) {
            if ($firstLine.Contains($char) -and $secondLine.Contains($char)) {
                $matchChar = $char
                break
            }
        }

        $asciiValue = [int][char]$matchChar
        if ($asciiValue -gt 96) {
            $asciiValue -= 96
        } else {
            $asciiValue -= 38
        }

        $answer += $asciiValue
        $currLine = 0
    }


    
}

Write-Host $answer
