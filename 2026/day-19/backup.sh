#!/bin/bash
src_dir="$1"
backup_dest="$2"

# Check if source directory exists
if [ ! -d "$src_dir" ]; then
    echo "Error: Source directory $src_dir does not exist."
    exit 1
fi
# Create timestamped archive name
timestamp=$(date +%Y-%m-%d)
archive_name="backup-$timestamp.tar.gz"
# Create the backup archive
tar -czf "$backup_dest/$archive_name" -C "$src_dir" .
# Verify the archive was created successfully
if [ $? -ne 0 ]; then
    echo "Error: Failed to create backup archive."
    exit 1
fi
# Print archive name and size
archive_size=$(du -h "$backup_dest/$archive_name" | cut -f1)
echo "Backup created: $archive_name"
echo "Size: $archive_size"
# Delete backups older than 14 days from the destination
find "$backup_dest" -type f -name "backup-*.tar.gz" -mtime +14 -exec rm -f {} \;
echo "Old backups older than 14 days have been deleted."