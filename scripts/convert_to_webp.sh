#!/bin/bash

set -e

cd "$( cd "$( dirname "$0" )" && pwd )/.."

if ! command -v cwebp >/dev/null 2>&1; then
    echo "Error: cwebp is not installed or not in PATH." >&2
    exit 127
fi

find . -type f \( \
    -iname "*.jpg" -o \
    -iname "*.jpeg" -o \
    -iname "*.png" -o \
    -iname "*.bmp" -o \
    -iname "*.tiff" -o \
    -iname "*.tif" \
\) -print0 | while IFS= read -r -d '' input_file; do
    output_file="${input_file%.*}.webp"

    if cwebp "$input_file" -lossless -o "$output_file"; then
        rm "$input_file"
        echo "Successfully converted and replaced: $input_file"
    else
        echo "Conversion failed, keeping original: $input_file" >&2
    fi
done

echo "Done."