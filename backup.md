This script provides a basic framework for automating backups

Explanation of the Script:

1. Variables:
SOURCE_DIR: The directory you want to back up.
BACKUP_DIR: The directory where the backup will be stored.
DATE: A timestamp used to uniquely identify the backup file.

2. Functions:
echo_msg: Prints informational messages.
handle_error: Prints error messages and exits the script.

3. Directory Checks:
The script checks if the source directory exists. If the backup directory does not exist, it creates it.

4. Backup Creation:
The tar command is used to create a compressed archive of the source directory.

5. Verification:
The script checks if the backup file was successfully created.

6. Cleanup:
An optional step to remove old backups, keeping only the last 2 backups.
