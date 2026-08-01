$extensions = @('*.png', '*.jpg', '*.jpeg', '*.jpe', '*.jfif', '*.tif', '*.tiff', '*.bmp', '*.pgm', '*.ppm', '*.pnm', '*.pam')

Get-ChildItem -Path . -Recurse -File -Include $extensions | ForEach-Object {
    $in  = $_.FullName
    $out = [System.IO.Path]::ChangeExtension($in, '.webp')
    & cwebp "$in" -lossless -quiet -o "$out"
    if ($LASTEXITCODE -eq 0 -and (Test-Path -LiteralPath $out)) {
        Remove-Item -LiteralPath $in -Force
        Write-Host "Converted: $in"
    } else {
        Remove-Item -LiteralPath $out -ErrorAction SilentlyContinue
        Write-Warning "Failed, kept: $in"
    }
}

Write-Host "Done."
