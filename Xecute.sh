#! /usr/bin/env bash

directories=("NewElastic")
# Loop through the directories
for dir in "${directories[@]}"; do
  # Check if the specified directory exists
  if [ ! -d "$dir" ]; then
    echo "Directory not found: $dir"
    exit 1
  fi
  cd "$dir" || exit 1

  files=$(find . -type f -executable)
  if [ -z "$files" ]; then
    echo "No executable scripts found in $dir"
    exit 1
  fi

  # Execute each script one by one
  for script in $files; do
    echo "Executing: $script"
    ./"$script" test
    echo "Finished executing: $script"
  done
  cd ..
done