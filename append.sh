#!/bin/bash

# Prompt the user for a directory
read -p "Enter the directory path: " DIR

# Check if the directory exists
if [ ! -d "$DIR" ]; then
  echo "Directory '$DIR' does not exist."
  exit 1
fi

# Get current date and time
DATETIME=$(date)

# Iterate over files (not directories) in the directory
for FILE in "$DIR"/*; do
  if [ -f "$FILE" ]; then
    echo "$DATETIME" >> "$FILE"
    echo "Appended date/time to $FILE"
  fi
done
