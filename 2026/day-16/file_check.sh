#!/bin/bash
#this script check if file present or not
echo "Enter the file name to check:"
read file_name  
if [ -e "$file_name" ]; then
    echo "File '$file_name' exists."
else
    echo "File '$file_name' does not exist."
fi

# Check if it's a regular file or a directory
if [ -f "$file_name" ]; then
    echo "'$file_name' is a regular file."
elif [ -d "$file_name" ]; then
    echo "'$file_name' is a directory."
else
    echo "'$file_name' is neither a regular file nor a directory."
fi  
    