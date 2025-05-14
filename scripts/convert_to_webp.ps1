# Supported image extensions
$imageExtensions = @('*.jpg', '*.jpeg', '*.png', '*.gif', '*.bmp', '*.tiff', '*.tif')

# Recursively get all image files
Get-ChildItem -Path . -Recurse -Include $imageExtensions | ForEach-Object {
    $inputFile = $_.FullName
    $outputFile = Join-Path $_.DirectoryName "$($_.BaseName).webp"
    
    # Convert using cwebp with lossless compression
    & cwebp "$inputFile" -lossless -o "$outputFile"
    
    # Check conversion success
    if ($LASTEXITCODE -eq 0) {
        # Remove original file
        Remove-Item -Path $inputFile
        Write-Host "Successfully converted and replaced: $inputFile"
    } else {
        Write-Warning "Conversion failed, keeping original: $inputFile"
    }
}

Write-Host "Done."
