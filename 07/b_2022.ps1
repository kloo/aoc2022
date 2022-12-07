<#

#>

$strarray = Get-Content ina.txt
$answer = 0

$inputLen = $strarray.Length
$inputArray = New-Object int[] $inputLen

$fileTable = @{}

$currDirs = @()

foreach ($line in $strarray) {
    
    $lineArray = $line.Split(" ")

    if ( $lineArray[0] -eq "$") {
        if ($lineArray[1] -eq "cd") {
            if ($lineArray[2] -eq "..") {
                $currDirs = $currDirs[0..($currDirs.Length - 2)]
            } else {
                $currDirs += $lineArray[2]
            }
        }
    } elseif ($lineArray[0][0] -Match "[0-9]") {
        $size = [int] $lineArray[0]

        if (!$fileTable.Contains("$currDirs")) {
            
            $fileTable.Add("$currDirs",$size)

            Write-Host "$currDirs --- $size $($lineArray[1]) --- $($fileTable[`"$currDirs`"])"

            for ($i = $currDirs.Length - 2;$i -ge 0;$i--) {
                if (!$fileTable.Contains("$($currDirs[0..$i])")) {
                    $fileTable.Add("$($currDirs[0..$i])",$size)
                } else {
                    $fileTable["$($currDirs[0..$i])"] += $size
                }
            }
        } else {
            
            $fileTable["$currDirs"] += $size

            #Write-Host "$currDirs --- $size $($lineArray[1]) --- $($fileTable[`"$currDirs`"])"

            for ($i = $currDirs.Length - 2;$i -ge 0;$i--) {
                if (!$fileTable.Contains("$($currDirs[0..$i])")) {
                    $fileTable.Add("$($currDirs[0..$i])",$size)
                } else {
                    $fileTable["$($currDirs[0..$i])"] += $size
                }
            }
        }
    }
}

$Values = $fileTable.Values | Sort-Object

$maxSize = $values[$values.Count - 1]
$freeSpace = 70000000 - $maxSize
$needSpace = 30000000 - $freeSpace

$answer = ($Values | Where-Object {$_ -ge $needSpace})[0]

Write-Host $answer
