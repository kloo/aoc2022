<#

#>

$strarray = Get-Content ina.txt
$answer = 0

$inputLen = $strarray.Length
$inputArray = New-Object int[] $inputLen



foreach ($line in $strarray) {
    $lineLength = $line.Length
    $firstHalf = $line[0..(($lineLength/2)-1)]
    $secondHalf = $line[($lineLength/2)..($lineLength-1)]

    $matchChar = ''

    foreach ($char in $firstHalf) {
        if ($secondHalf.Contains($char)) {
            $matchChar = $char
            break
        }
    }

    

    $asciiValue = [int]$matchChar
    if ($asciiValue -gt 96) {
        $asciiValue -= 96
    } else {
        $asciiValue -= 38
    }

    #echo "$matchChar , $asciiValue"

    $answer += $asciiValue
    
}

Write-Host $answer
