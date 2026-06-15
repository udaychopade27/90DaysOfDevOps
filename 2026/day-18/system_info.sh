
#!/bin/bash
set -euo pipefail
printSystemInfo() {
    echo "=== Hostname and OS Info ==="
    echo "Hostname: $(hostname)"
    echo "OS: $(uname -s) $(uname -r)"
}
printUptime() {
    echo "=== Uptime ==="
    uptime -p
}
printDiskUsage() {
    echo "=== Disk Usage (Top 5 by Size) ==="
    df -h --output=size,used,avail,pcent,target | sort -hr | head -n 6
}
printMemoryUsage() {
    echo "=== Memory Usage ==="
    free -h | awk 'NR==2 {print "Total: "$2", Used: "$3", Free: "$4}'

}
printTopCPUProcesses() {
    echo "=== Top 5 CPU-Consuming Processes ==="
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6
}   
main() {
echo ===============================================================================
    printSystemInfo
echo ===============================================================================
    printUptime
echo ===============================================================================
    printDiskUsage
echo ===============================================================================
    printMemoryUsage
echo ===============================================================================
    printTopCPUProcesses
}
main
