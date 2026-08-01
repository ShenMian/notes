#!/bin/bash

set -e

cd "$( cd "$( dirname "$0" )" && pwd )/.."

if ! command -v cwebp >/dev/null 2>&1; then
    echo "Error: cwebp is not installed or not in PATH." >&2
    exit 127
fi

find . -type f \( \
    -iname "*.png" -o \
    -iname "*.jpg" -o \
    -iname "*.jpeg" -o \
    -iname "*.jpe" -o \
    -iname "*.jfif" -o \
    -iname "*.tif" -o \
    -iname "*.tiff" -o \
    -iname "*.bmp" -o \
    -iname "*.pgm" -o \
    -iname "*.ppm" -o \
    -iname "*.pnm" -o \
    -iname "*.pam" \
\) -print0 | while IFS= read -r -d '' input_file; do
    output_file="${input_file%.*}.webp"

    if cwebp "$input_file" -lossless -quiet -o "$output_file" && [ -f "$output_file" ]; then
        rm "$input_file"
        echo "Converted: $input_file"
    else
        rm -f "$output_file"
        echo "Failed, kept: $input_file"
    fi
done

echo "Done."
