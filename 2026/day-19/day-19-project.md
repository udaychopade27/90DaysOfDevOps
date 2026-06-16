# Day 19 – Shell Scripting Project: Log Rotation, Backup & Crontab

## Objective

Apply shell scripting concepts by building practical automation workflows for Linux server maintenance.

This project includes:

* Log rotation automation
* Server backup automation
* Scheduled execution using crontab
* Combined maintenance workflow

---

# Task 1 – Log Rotation Script

### File: `log_rotate.sh`

### Purpose

Automate log management by:

* Compressing old log files
* Removing outdated compressed logs
* Reducing storage usage

### Script Features

✅ Accepts log directory as input
✅ Compresses `.log` files older than 7 days
✅ Deletes `.gz` files older than 30 days
✅ Counts processed files
✅ Handles invalid directories

### Sample Execution

```bash
chmod +x log_rotate.sh

./log_rotate.sh /var/log/nginx
```

### Sample Output

```text
Compressed 5 .log files older than 7 days.
Deleted 2 .gz files older than 30 days.
```

---

# Task 2 – Server Backup Script

### File: `backup.sh`

### Purpose

Automate backup creation and retention.

### Script Features

✅ Accepts source and destination paths
✅ Creates timestamped archive
✅ Verifies backup success
✅ Displays archive size
✅ Deletes backups older than 14 days
✅ Error handling included

### Sample Execution

```bash
chmod +x backup.sh

./backup.sh /home/ubuntu/dockermind /home/ubuntu
```

### Sample Output

```text
Backup created: backup-2026-06-16.tar.gz
Size: 48M
Old backups older than 14 days have been deleted.
```

---

# Task 3 – Crontab Scheduling

## Check Existing Cron Jobs

```bash
crontab -l
```

## Cron Syntax

```text
* * * * * command
│ │ │ │ │
│ │ │ │ └── Day of week
│ │ │ └──── Month
│ │ └────── Day
│ └──────── Hour
└────────── Minute
```

## Cron Entries

### Run log rotation daily at 2 AM

```bash
0 2 * * * /home/ubuntu/scripts/log_rotate.sh /var/log/nginx
```

### Run backup every Sunday at 3 AM

```bash
0 3 * * 0 /home/ubuntu/scripts/backup.sh /home/ubuntu/dockermind /home/ubuntu
```

### Run health check every 5 minutes

```bash
*/5 * * * * /home/ubuntu/scripts/health_check.sh
```

---

# Task 4 – Scheduled Maintenance Script

### File: `maintenance.sh`

### Purpose

Execute maintenance operations together.

### Includes

* Log rotation
* Backup execution
* Timestamp logging

### Sample Execution

```bash
chmod +x maintenance.sh

./maintenance.sh
```

### Sample Output

```text
Compressed 3 .log files older than 7 days.
Backup created: backup-2026-06-16.tar.gz
Maintenance completed at Tue Jun 16
```

### Cron Entry

Run daily at 1 AM:

```bash
0 1 * * * /home/ubuntu/scripts/maintenance.sh
```

---

# Project Structure

```text
2026/
└── day-19/
    ├── backup.sh
    ├── log_rotate.sh
    ├── maintenance.sh
    └── day-19-project.md
```

---

# Key Learnings

### 1. Shell scripts can automate repetitive Linux administration tasks.

### 2. Cron enables reliable scheduled execution for operational workflows.

### 3. Combining scripts creates maintainable server automation pipelines.

---

# Commands Used

```bash
find
gzip
tar
du
date
cron
chmod
```

---
