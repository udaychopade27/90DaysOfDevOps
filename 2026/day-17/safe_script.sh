
#!/bin/bash
set -e

#  Define the directory and file names
DIR_NAME="my_safe_directory"
FILE_NAME="my_safe_file.txt"    
# Create the directory
if ! mkdir -p "$DIR_NAME"; then 
    echo "Error: Failed to create directory '$DIR_NAME'."
    exit 1
fi
# Navigate into the directory
if ! cd "$DIR_NAME"; then   
    echo "Error: Failed to navigate into directory '$DIR_NAME'."
    exit 1
fi
# Create the file
if ! touch "$FILE_NAME"; then
    echo "Error: Failed to create file '$FILE_NAME'."
    exit 1
fi
echo "Directory '$DIR_NAME' and file '$FILE_NAME' created successfully."    

