#!/bin/bash
#This script check sattus and helth of sevices 
echo "Checking service health..."
# Check if the service is running
read -p "Enter the service name to check: " service_name
if systemctl is-active --quiet $service_name; then
    echo "Service '$service_name' is running."
else
    echo "Service '$service_name' is not running."
fi