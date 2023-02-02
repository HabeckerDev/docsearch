#!/bin/bash

# Get the directory and the word to search for from the parameters
dir=$1
word=$2

# Check if the directory exists
if [ ! -d "$dir" ]; then
  echo "Error: $dir is not a directory"
  exit 1
fi

# Search for files in the directory and print the name of the file if the word is found
found=$(find "$dir" -type f -exec grep -l "$word" {} +)
if [ -n "$found" ]; then
  echo "The word '$word' was found in the following files:"
  echo "$found"
else
  echo "The word '$word' was not found in any files in the directory $dir."
fi
