<#

#>

$strarray = Get-Content ina2.txt
#$answer = 0

$inputLen = $strarray.Length
$inputArray = New-Object int[] $inputLen
$lineSize = $strarray[0].Length

$numStacks = $strArray[$inputLen - 1].Split(" ")
$numStacks = [int] $numStacks[$numStacks.Length - 2]

$stackTable = @{}
<#
function moveItem() {
    [params
}#>

for($i = 1; $i -le $numStacks;$i++) {
    $stackTable.Add($i,@())
}

for ($i = $inputLen - 2; $i -ge 0; $i--) {
    $currStack = 1
    for ($j = 1;$j -le $lineSize;$j += 4) {
        
        if ($strarray[$i][$j] -ne " ") {
            $stackTable[$currStack] += [char] $strarray[$i][$j]
        }

        $currStack++
    }
}

$strarray = Get-Content ina.txt

foreach ($line in $strarray) {
    $command = $line.Split(" ")

    $amount = [int] $command[1]
    $fromStack = [int] $command[3]
    $toStack = [int] $command[5]

    for ($i = 0;$i -lt $amount;$i++) {
        
        $addChar = $stackTable[$fromStack]
        $newStack = $addChar[0..($addChar.Count - 2)]

        $addChar = $addChar[$addChar.Count - 1]

        $stackTable[$toStack] += $addChar

        $stackTable[$fromStack] = $newStack
    }
}

for ($i = 1;$i -le $stackTable.Count;$i++) {
    $endChar = $stackTable[$i]
    $endChar = $endChar[$endChar.Count - 1]

    Write-Host -NoNewline $endChar
}
