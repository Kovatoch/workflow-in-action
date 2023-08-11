# Self test

Install-Module PSScriptAnalyzer

Import-Module PSScriptAnalyzer

$testResult = Invoke-ScriptAnalyzer -Path $MyInvocation.MyCommand.Definition

if ($testResult.Count -ne 0) {
    Write-Output $testResult
    exit
}

Write-Output "Test Passed"

# Paths / Variables
$pathDirectory = "C:\temp\IAC"
$pathLog = $pathDirectory + "\test_of_cleanup_scripts.log"
$age = 30

# Get a list of files in the directory
$fileList = Get-ChildItem -Path $pathDirectory -File


# Write log
"$(Get-Date -Format o) -------------- Starting Cleanup-Files.ps1 --------------" | Out-File -Append -FilePath $pathLog -Encoding UTF8
"$(Get-Date -Format o) - $($fileList.Count) file(s) in $pathDirectory\" | Out-File -Append -FilePath $pathLog -Encoding UTF8

# Check if date is older than $age[days]
$fileList | ForEach-Object {
    if ($_.LastWriteTime -lt ((Get-Date).AddDays(-$age))) {
        Remove-Item -Path $_.FullName -Force
    }
}

# Number of files after
$fileCountAfter = (Get-ChildItem -Path $pathDirectory -File).count

# Write log
"$(Get-Date -Format o) - Running Cleanup-Files.ps1 ..." | Out-File -Append -FilePath $pathLog -Encoding UTF8
"$(Get-Date -Format o) - $fileCountAfter file(s) in $pathDirectory\" | Out-File -Append -FilePath $pathLog -Encoding UTF8