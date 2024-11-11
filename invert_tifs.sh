#!/bin/bash

# envvars
source $(dirname "$0")/.env

# argparsing
if [ -z "$1" ]; then
    echo "Usage: $0 <directory_path>"
    exit 1
fi

# Directory of negatives
DIRECTORY="$NEGATIVEDIR/$1"
if [ ! -d "$DIRECTORY" ]; then
    echo "$DIRECTORY is not a valid dir path"
    exit 1
fi

# Convert negatives
for file in "$DIRECTORY"/i_*.tif; do
    if [ -f "$file" ]; then
        output_file="${file/$DIRECTORY\/i_/}"
        echo "Processing $(basename "$file") to $(basename "$output_file")"
        magick -quiet "$file" -channel RGB -negate "$DIRECTORY/$output_file"
        if [ -f "$DIRECTORY/$output_file" ]; then
            rm -f $file
        else
            echo "Error deleting negative $file"
    else
        echo "No .tif files found in $DIRECTORY."
    fi
done

echo "Processing complete."
