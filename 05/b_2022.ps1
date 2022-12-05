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
    $fromStackNum = [int] $command[3]
    $toStackNum = [int] $command[5]

    $fromStack = $stackTable[$fromStackNum]
    $toStack = $stackTable[$toStackNum]

    $addStack = $fromStack[($fromStack.Length - $amount)..($fromStack.Length - 1)]

    for ($i = 0;$i -lt $amount;$i++) {
        $toStack += $addStack[$i]
        $fromStack = $fromStack[0..($fromStack.Length - 2)]
    }

    $stackTable[$fromStackNum] = $fromStack
    $stackTable[$toStackNum] = $toStack
}

for ($i = 1;$i -le $stackTable.Count;$i++) {
    $endChar = $stackTable[$i]
    $endChar = $endChar[$endChar.Count - 1]

    Write-Host -NoNewline $endChar
}
