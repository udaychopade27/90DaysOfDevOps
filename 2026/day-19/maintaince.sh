
#!/bin/bash

# Define paths
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
log_file="/home/ubuntu/maintenance.log"

# Run log rotation (pass DIRECTORY)
bash "$SCRIPT_DIR/log_rotate.sh" /var/log/nginx >> "$log_file" 2>&1

# Run backup
bash "$SCRIPT_DIR/backup.sh" /home/ubuntu/dockermind /home/ubuntu >> "$log_file" 2>&1

# Timestamp
echo "Maintenance completed at $(date)" >> "$log_file"
