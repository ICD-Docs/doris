# Define the source folder
cd  "C:\code\gitrepos\Docs\doris"
# Define source path
# Define source path
$sourceFolder = "en\docs\files"

# Define the root folder that contains language folders
$rootFolder = "." # Split-Path (Split-Path $sourceFolder -Parent) -Parent

# Get all sibling folders with two-character names, excluding "en"
$languageFolders = Get-ChildItem -Path $rootFolder -Directory | Where-Object {
    $_.Name.Length -eq 2 -and $_.Name -ne "en"
}

# Copy files to each language folder under their docs/files subfolder
foreach ($langFolder in $languageFolders) {
    $targetFolder = Join-Path $langFolder.FullName "docs\files"

    # Create the target folder if it doesn't exist
    if (-not (Test-Path $targetFolder)) {
        New-Item -ItemType Directory -Path $targetFolder -Force | Out-Null
    }

    # Copy the files
    Copy-Item -Path "$sourceFolder\*" -Destination $targetFolder -Recurse -Force
    Write-Host "Copied files to: $targetFolder"
}
