
#!/bin/bash

# Usage: ./log_rotate.sh /var/log/nginx

log_dir="$1"

# Check if directory exists
if [ ! -d "$log_dir" ]; then
    echo "Error: Directory $log_dir does not exist."
    exit 1
fi

zip_count=0
delete_count=0

# Compress .log files older than 7 days
for file in $(find "$log_dir" -type f -name "*.log" -mtime +7); do
    gzip "$file"
    ((zip_count++))
done

# Delete .gz files older than 30 days
for file in $(find "$log_dir" -type f -name "*.gz" -mtime +30); do
    rm -f "$file"
    ((delete_count++))
done

echo "Compressed $zip_count .log files older than 7 days."
echo "Deleted $delete_count .gz files older than 30 days."
