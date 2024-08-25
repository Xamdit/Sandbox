#!/bin/bash

# Initialize variables
SEM_LIMIT=30
files_copied=0
total_files=0

# Function to copy files
fast_directory_copy() {
  src_dir=$1
  dest_dir=$2
  copy_sub_dirs=$3

  # Create destination directory if it doesn't exist
  mkdir -p "$dest_dir"

  # Get the list of files and iterate over them
  find "$src_dir" -maxdepth 1 -type f | while read -r src_file; do
    file_name=$(basename "$src_file")
    dest_file="$dest_dir/$file_name"

    (
      # Acquire a lock (semaphore)
      flock -w 10 200

      # Copy if the file doesn't exist in the destination directory
      if [[ ! -f "$dest_file" ]]; then
        cp "$src_file" "$dest_file"

        # Update progress and display it
        files_copied=$((files_copied + 1))
        echo "Progress: $files_copied/$total_files files copied."
      else
        echo "Skipped: $dest_file already exists."
      fi

      # Release lock
      flock -u 200
    ) 200>/var/lock/mylockfile &

    # Limit number of concurrent tasks
    while (($(jobs | wc -l) >= SEM_LIMIT)); do
      sleep 1 # Wait before checking again
    done
  done

  # If copy_sub_dirs is true, recurse into subdirectories
  if [[ $copy_sub_dirs = true ]]; then
    for sub_dir in "$src_dir"/*; do
      if [[ -d "$sub_dir" ]]; then
        fast_directory_copy "$sub_dir" "$dest_dir/$(basename "$sub_dir")" true
      fi
    done
  fi
}

# Main function
main() {
  if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <sourceDir> <destDir>"
    exit 1
  fi

  source_directory=$1
  destination_directory=$2

  # Calculate total number of files to be copied
  total_files=$(find "$source_directory" -type f | wc -l)

  SECONDS=0

  # Start copying
  fast_directory_copy "$source_directory" "$destination_directory" true

  # Wait for all background tasks to finish
  wait

  echo "Elapsed Time: $SECONDS seconds"
}

# Entry point
main "$@"
