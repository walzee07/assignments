#!/bin/bash

# Check if directory is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 <directory>"
  exit 1
fi

TARGET_DIR="$1"

# Check if the provided argument is a directory
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: '$TARGET_DIR' is not a directory."
  exit 1
fi

# Get the current date and time
CURRENT_DATETIME=$(date "+%Y-%m-%d %H:%M:%S")

# Iterate over files in the specified directory
for FILE in "$TARGET_DIR"/*; do
  if [ -f "$FILE" ]; then
    echo "Appending date to: $FILE"
    echo "$CURRENT_DATETIME" >> "$FILE"
  fi
done

echo "Done."