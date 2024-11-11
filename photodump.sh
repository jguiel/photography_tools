#!/bin/bash

# Source env
source $(dirname "$0")/.env

# Check if an argument is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <destination_folder>"
  exit 1
fi

# Destination dir
DESTINATION="$PHTGDIR/$1"
mkdir -p "$DESTINATION"

# Search for drives w/images
IMAGE_FOLDERS=$(
    find "$MEMCARDMNT" -type d \( -name '.?' -o -name '.*' \) -prune -o \
        -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.cr2" \) -print0 | \
    xargs -0 dirname | \
    sort -u
)

# Handle no images found
if [ -z "$IMAGE_FOLDERS" ]; then
  echo "No image folders found on external drive."
  exit 1
fi

echo
echo "Imges found in:"
echo "$IMAGE_FOLDERS"
echo
echo "Moving images to:"
echo "$DESTINATION"
echo

# Confirm
while true; do
    read -p "Does this look good to you? (y/n): " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit 1;;
        * ) echo "y or n plz";;
    esac
done

# Move images to destination
for FOLDER in $IMAGE_FOLDERS; do
  echo
  echo "Moving images from $FOLDER to $DESTINATION"
  mv "$FOLDER"/* "$DESTINATION"
done

echo
echo "Images were moved to $DESTINATION"
echo
echo ":)"
