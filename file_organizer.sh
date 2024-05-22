#!/bin/bash

# Specify the directory to organize
target_dir="/path/to/target_directory"

# Check if target directory exists
if [ ! -d "$target_dir" ]; then
    echo "Target directory does not exist."
    exit 1
fi

# Create directories for different file types if the don't exist
mkdir -p "$target_dir/images"
mkdir -p "$target_dir/documents"
mkdir -p "$target_dir/videos"
mkdir -p "$target_dir/others"

# Loop through each file in the target directory
for file in "$target_dir"/*; do
    if [ -f "$file" ]; then
        # Get the file extension
        extension="${file##*.}"

	# Move the file to the corresponding directory based on file type
        case "$extension" in 
            jpg|jpeg|png|gif)
            	mv "$file" "$target_dir/images/"
		;;
	    doc|docx|pdf|txt)
            	mv "$file" "$target_dir/documents/"
		;;
      	    mp4|avi|mov|mkv)
		mv "$file" "$target_dir/videos/"
		;;
	    *)
		mv "$file" "$target_dir/others/"
	esac
    fi
done

echo "Organizing files complete."
