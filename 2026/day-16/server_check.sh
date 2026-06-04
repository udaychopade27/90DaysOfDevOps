#!/bin/bash
#This script check server health such as free memeoru disk usage and also top 5 processes which consuming cpu
echo "Checking server health..."
echo "Free Memory:"
free -h
echo "Disk Usage:"
df -h
echo "Top 5 CPU consuming processes:"
ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 6
echo "Server health check completed."   