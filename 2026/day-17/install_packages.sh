
#!/bin/bash
# Define the list of packages
packages=("nginx" "curl" "wget")
# Loop through the list of packages
if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi
for package in "${packages[@]}"
do
    # Check if the package is installed
    if dpkg -s "$package" &> /dev/null; then
        echo "$package is already installed."
    else
        echo "$package is not installed. Installing..."
        apt-get update && apt-get install -y "$package"
    fi
done    
# Modify your `install_packages.sh` to check if the script is being run as root — exit with a message if not
