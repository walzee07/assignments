#!/bin/bash

# If no filename argument is given, prompt the user to enter one
if [ -z "$1" ]; then
  read -p "Enter the filename: " FILE
else
  FILE="$1"
fi

# Check if file exists
if [ ! -e "$FILE" ]; then
  echo "File '$FILE' does not exist."
  exit 1
fi

# Check readability
if [ -r "$FILE" ]; then
  echo "File '$FILE' is readable."
else
  echo "File '$FILE' is not readable."
fi

# Check writability
if [ -w "$FILE" ]; then
  echo "File '$FILE' is writable."
else
  echo "File '$FILE' is not writable."
fi

# Check executability
if [ -x "$FILE" ]; then
  echo "File '$FILE' is executable."
else
  echo "File '$FILE' is not executable."
fi