# Self test

Install-Module PSScriptAnalyzer

Import-Module PSScriptAnalyzer

$testResult = Invoke-ScriptAnalyzer -Path $MyInvocation.MyCommand.Definition

if ($testResult.Count -ne 0) {
    Write-Output $testResult
    exit
}

Write-Output "Test Passed"

# Paths
$pathDirectory = "C:\temp\IAC"
$pathLog = $pathDirectory + "\test_of_cleanup_scripts.log"

# Create directory if it does not exist
if (-not (Test-Path -Path $pathDirectory -PathType Container)) {
    New-Item -Path $pathDirectory -ItemType Directory
}

# Create log fileCheck if it does not exist
if (-not (Test-Path -Path $pathLog -PathType Leaf)) {
    New-Item -ItemType File -Path $pathLog
}

# Number of files before
$fileCountBefore = (Get-ChildItem -Path $pathDirectory -File).count
if ($null -eq $fileCountBefore) {
    $fileCountBefore = 0
}

# Write log
"$(Get-Date -Format o) -------------- Starting Create-Files.ps1 -------------- " | Out-File -Append -FilePath $pathLog -Encoding UTF8
"$(Get-Date -Format o) - $fileCountBefore file(s) in $pathDirectory\" | Out-File -Append -FilePath $pathLog -Encoding UTF8

# Generate list of numbers from 1-50, formattede to 3 digits
$numbersArray = 1..50 | ForEach-Object {'{0:D3}' -f $_}
# Iterate array and create files
$numbersArray | ForEach-Object {
    # Clearing variables
    $item = $null
    $path = $null
    # Generate path variable
    $path = $pathDirectory + "\AndFile$_.log"
    # Create file
    New-Item -ItemType File -Path $path
    # Change LastWriteDate to current time minus 60 days
    $item = Get-Item -Path $path
    $item.LastWriteTime = (Get-Date).AddDays(-60)
    # Setting last item in array to have current date
    if ($_ -eq ('{0:D3}' -f ($numbersArray.Count))) {
        $item.LastWriteTime = Get-Date
    }
}

# Number of files after
$fileCountAfter = (Get-ChildItem -Path $pathDirectory -File).count

# Write log
"$(Get-Date -Format o) - Running Create-Files.ps1 ..." | Out-File -Append -FilePath $pathLog -Encoding UTF8
"$(Get-Date -Format o) - $fileCountAfter file(s) in $pathDirectory\" | Out-File -Append -FilePath $pathLog -Encoding UTF8

function flottelotte-hej {

    Write-Host "Det må jeg ikke"

}

$lols = "jeawdfdwa"