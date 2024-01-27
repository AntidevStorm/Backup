#!/bin/bash

echo "Hey there! I'm your interactive backup buddy. 🚀"

# Ask the user for the source directory
read -p "Enter the source directory: " source_dir

# Check if the source directory exists
if [ ! -d "$source_dir" ]; then
  echo "Oops! The source directory doesn't exist. Please provide a valid path."
  exit 1
fi

# Ask the user for the backup directory
read -p "Enter the backup directory: " backup_dir

# Check if the backup directory exists, if not, create it
if [ ! -d "$backup_dir" ]; then
  echo "Creating backup directory..."
  mkdir -p "$backup_dir"
fi

# Create a timestamp for the backup
timestamp=$(date +"%Y%m%d%H%M%S")

# Create a backup archive
backup_file="backup_$timestamp.tar.gz"
tar -czf "$backup_dir/$backup_file" -C "$source_dir" .

# Check if the backup was successful
if [ $? -eq 0 ]; then
  echo "Backup completed successfully! 🎉"
else
  echo "Oops! Something went wrong with the backup. 😟"
fi

# Let's wrap it up!
echo "All done! Your files are safe and sound. 👍"
