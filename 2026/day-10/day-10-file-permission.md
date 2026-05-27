# Day 10 – File Permissions & File Operations Challenge

## Objective
Learn Linux file operations and understand how file permissions work using symbolic and numeric modes.

---

# Task 1 – Creating Files

## Created Files

### Create Empty File
```bash
touch server.log
```

### Create File with Content
```bash
echo "Linux permissions are important for security." > config.txt
```

### Create Shell Script
```bash
vim deploy.sh
```

Content inside file:

```bash
#!/bin/bash
echo "Deployment Started"
```

---

## Verify Files

```bash
ls -l
```

Example Output:

```bash
-rw-rw-r-- 1 ubuntu ubuntu    0 May 27 10:10 server.log
-rw-rw-r-- 1 ubuntu ubuntu   45 May 27 10:11 config.txt
-rw-rw-r-- 1 ubuntu ubuntu   39 May 27 10:12 deploy.sh
```

---

# Task 2 – Reading Files

## Read File Content

```bash
cat config.txt
```

## Open Script in Read-Only Mode

```bash
vim -R deploy.sh
```

## Display First 5 Lines

```bash
head -n 5 /etc/passwd
```

## Display Last 5 Lines

```bash
tail -n 5 /etc/passwd
```

---

# Task 3 – Understanding Permissions

## Check Permissions

```bash
ls -l server.log config.txt deploy.sh
```

Example:

```bash
-rw-rw-r-- server.log
-rw-rw-r-- config.txt
-rw-rw-r-- deploy.sh
```

## Permission Breakdown

| Symbol | Meaning |
|---|---|
| r | Read |
| w | Write |
| x | Execute |

### Example: `-rw-rw-r--`

- Owner → Read + Write
- Group → Read + Write
- Others → Read Only

---

# Task 4 – Modify Permissions

## Make Script Executable

```bash
chmod +x deploy.sh
```

Verify:

```bash
ls -l deploy.sh
```

Output:

```bash
-rwxrwxr-x deploy.sh
```

Run Script:

```bash
./deploy.sh
```

Output:

```bash
Deployment Started
```

---
## Numeric Permission Values

| Number | Permission | Symbol | Meaning |
|---|---|---|---|
| 4 | Read | r | View file contents |
| 2 | Write | w | Modify or edit file |
| 1 | Execute | x | Run file as program/script |

---

## Common Permission Combinations

| Number | Symbol | Access |
|---|---|---|
| 7 | rwx | Read + Write + Execute |
| 6 | rw- | Read + Write |
| 5 | r-x | Read + Execute |
| 4 | r-- | Read Only |
| 0 | --- | No Permission |

---

## Example Permission Calculation

### Permission: `755`

| User Type | Value | Permission |
|---|---|---|
| Owner | 7 | rwx |
| Group | 5 | r-x |
| Others | 5 | r-x |

Meaning:
- Owner can read, write, and execute
- Group can read and execute
- Others can read and execute

---

### Permission: `640`

| User Type | Value | Permission |
|---|---|---|
| Owner | 6 | rw- |
| Group | 4 | r-- |
| Others | 0 | --- |

Meaning:
- Owner can read and write
- Group can only read
- Others have no access
---

## Make File Read-Only

```bash
chmod a-w server.log
```

Verify:

```bash
ls -l server.log
```

Output:

```bash
-r--r--r-- server.log
```

---

## Set Numeric Permissions

```bash
chmod 640 config.txt
```

Verify:

```bash
ls -l config.txt
```

Output:

```bash
-rw-r----- config.txt
```

Meaning:
- Owner → Read + Write
- Group → Read
- Others → No Access

---

## Create Directory with 755 Permission

```bash
mkdir automation
chmod 755 automation
```

Verify:

```bash
ls -ld automation
```

Output:

```bash
drwxr-xr-x automation
```

---

# Task 5 – Permission Testing

## Try Writing to Read-Only File

```bash
echo "test" >> server.log
```

Result:

```bash
Permission denied
```

---

## Try Executing File Without Execute Permission

Remove Execute Permission:

```bash
chmod -x deploy.sh
```

Run File:

```bash
./deploy.sh
```

Result:

```bash
Permission denied
```

---

# Commands Practiced

```bash
touch
echo
cat
vim
head
tail
chmod
ls -l
mkdir
```

---

# Key Learnings

- Linux permissions control file security and accessibility.
- Execute permission is required to run shell scripts.
- Numeric permissions like `755` and `640` simplify permission management.
- `ls -l` helps quickly identify file access levels.
- Incorrect permissions can cause application and deployment failures.

---