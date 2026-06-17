# Day 20 – Bash Scripting Challenge: Log Analyzer and Report Generator

## Objective

Build a Bash-based log analyzer that processes system logs, extracts important events, and generates a summary report automatically.

---

## Files Created

```bash
2026/day-20/
├── log_analyzer.sh
├── sample_log.log
├── log_report_2026-06-17.txt
└── day-20-solution.md
```

---

## Approach

Implemented a Bash script to:

1. Accept a log file path using command-line arguments
2. Validate user input and file existence
3. Count ERROR and Failed log entries
4. Extract CRITICAL events with line numbers
5. Identify top 5 repeated error messages
6. Generate a timestamped summary report
7. (Optional) Archive processed logs

---

## Commands and Tools Used

### grep

Used for searching specific patterns.

```bash
grep -c
grep -n
```

### awk

Used to extract error message content.

```bash
awk
```

### sort + uniq

Used to aggregate repeated logs.

```bash
sort
uniq -c
```

### wc

Used to count total lines.

```bash
wc -l
```

### date

Used to generate report filenames.

```bash
date +%Y-%m-%d
```

---

## Sample Execution

```bash
chmod +x log_analyzer.sh

./log_analyzer.sh access.log
```

---

## Sample Output

```text
Log Analysis Report - 2026-06-17

Log File: access.log
Total Lines Processed: 100
Total ERROR and FAILED Log Count: 23

Top 5 Error Messages:
6 Failed to connect
5 Out of memory
1 Segmentation fault

Critical Events:
1: CRITICAL event
6: CRITICAL event
```

---

## Key Learnings

✅ Automating repetitive log analysis using Bash

✅ Using grep + awk + sort to process real log data

✅ Generating structured reports for operational visibility

---
