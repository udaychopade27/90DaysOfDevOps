#!/bin/bash
log_file_path="$1"
if [ "$#" -ne 1 ]; then
    echo "Error: log file path not provided."
    echo "Usage: $0 <log_file_path>"
    echo "Example: $0 /path/to/logfile.log"
    echo "This script analyzes the log file and provides a summary of log levels and error messages."
    exit 1
fi
# check if the log file exists
if [ ! -f "$log_file_path" ]; then
    echo "Error: Log file  does not exist at $log_file_path."
    exit 1
fi  

# find no of error log count
error_count=$(grep -c "ERROR" "$log_file_path")
# find no of warning log count
failed_count=$(grep -c "FAILED" "$log_file_path")
total_error_count=$((error_count + failed_count))
echo "Total ERROR and FAILED log count: $total_error_count"

# Print those lines along with their line number
echo "Lines with CRITICAL logs:"

critical_count=$(grep -c "CRITICAL" "$log_file_path")
echo "Total CRITICAL log count: $critical_count"
echo "------ Critical Events ------"
grep -n "CRITICAL" "$log_file_path"



grep "ERROR" "$log_file_path" | awk '{print $3, $4, $5, $6, $7}' | sort | uniq -c | sort -nr | head -n 5

# Generate a summary report to a text file named `log_report_<date>.txt` (e.g., `log_report_2026-02-11.txt`). The report should include:
# 1. Date of analysis
# 2. Log file name
# 3. Total lines processed
# 4. Total error count
# 5. Top 5 error messages with their occurrence count
# 6. List of critical events with line numbers

todays_date=$(date '+%Y-%m-%d')
report_file="log_report_${todays_date}.txt"
total_lines=$(wc -l < "$log_file_path")

{
    echo "Log Analysis Report - $todays_date"
    echo "Log File: $log_file_path"
    echo "Total Lines Processed: $total_lines"
    echo "Total ERROR and FAILED Log Count: $total_error_count"
    echo ""
    echo "Top 5 Error Messages:"
    grep "ERROR" "$log_file_path" | awk '{print $3, $4, $5, $6, $7}' | sort | uniq -c | sort -nr | head -n 5
    echo ""
    echo "Critical Events:"
    grep -n "CRITICAL" "$log_file_path"
} > "$report_file"  



