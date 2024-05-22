#!/bin/bash

# Backup Script

# Define source directory and backup directory
SOURCE_DIR="/path/to/source/directory"
BACKUP_DIR="/path/to/backup/directory"
DATE=$(date +"%Y%m%d%H%M")
BACKUP_FILE="backup-$DATE.tar.gz"

# Function to display messages 
function echo_msg {
    echo "[INFO] $1"
}

#Function to handle errors
function handle_error {
    echo "[ERROR] $1"
    exit 1
}

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    handle_error "Source directory $SOURCE_DIR does not exist."
fi

# Create backup directory if it doesn't exist
if [ ! -d "$BACKUP_DIR" ]; then
    echo_msg "Backup directory $BACKUP_DIR does not exist. Creating it now."
    mkdir -p "$BACKUP_DIR" || handle_error "Failed to creae backup directory $BACKUP_DIR."
fi

# Create the backup
echo_msg "Starting backup of $SOURCE_DIR to $BACKUP_DIR/$BACKUP_FILE"
tar -czf "$BACKUP_DIR/$BACKUP_FILE" -C "$SOURCE_DIR" . || handle_error "Failed to create a backup archive."

# Verify the backup
if [ ! -f "$BACKUP_DIR/$BACKUP_FILE" ]; then
    echo_msg "Backup completed successfully. Backup file: $BACKUP_DIR/$BACKUP_FILE"
else
    handle_error "Backup file not found after creation."
fi

# Cleanup old backups
echo_msg "Cleaning up old backups, keeping only the last 2 backups"
ls -ltr "$BACKUP_DIR"/backup-*.tar.gz | head -n -2 | xargs -d '\n' rm -f || echo_msg "No old backups to clean up."

echo_msg "Backup completed"
