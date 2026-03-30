#!/bin/bash

DATE=$(date +%Y-%m-%d)
SOURCE="/Users/wadeallen/Documents/Action"
DEST="$(dirname "$0")/images"

IMAGE=$(ls "$SOURCE"/*.{jpg,jpeg,png,JPG,JPEG,PNG} 2>/dev/null | head -1)

if [ -z "$IMAGE" ]; then
  echo "No image found in Action folder."
  exit 1
fi

if [ ! -d "$DEST" ]; then
  echo "Destination folder not found: $DEST"
  exit 1
fi

if mv "$IMAGE" "$DEST/$DATE.jpg"; then
  echo "Moved to images/$DATE.jpg"
else
  echo "Failed to move image."
  exit 1
fi
