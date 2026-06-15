#!/bin/bash

diskCheck() {
    local disk_usage=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
    echo "Disk usage is at $disk_usage%."
}

checkMemory() {
    local memory_usage=$(free -h | awk 'NR==2 {print $3}')
    echo "Memory usage is at $memory_usage MB."
}

diskCheck
checkMemory