#! /usr/bin/env bash
elastic_url=$1 # http://192.168.200.190:9200

# Check if the elastic_url is provided
if [ -z "$elastic_url" ]; then
  echo "Usage: $0 ELASTIC_URL"
  exit 1
fi

directories=("Collection" "Explorer" "Memory" "MemoryRelation")
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
    ./"$script" $elastic_url
    echo "Finished executing: $script"
  done
  cd ..
done