# Day 16 – Shell Scripting Basics

## Objective

Learn the fundamentals of shell scripting including:

* Shebang (`#!/bin/bash`)
* Variables
* User input with `read`
* Conditional statements (`if-else`)
* Basic Linux automation

---

# Scripts Created

## 1. hello.sh

### Purpose

Created the first executable shell script and printed output using `echo`.

### Concepts Used

* Shebang
* echo
* Execute permission

### Commands

```bash
chmod +x hello.sh
./hello.sh
```

### Learning

The shebang line tells Linux which interpreter should execute the script.

---

## 2. variables.sh

### Purpose

Worked with variables and dynamic output.

### Concepts Used

* Variable declaration
* Variable interpolation
* Command substitution

### Examples Practiced

* Store greeting text
* Store name
* Capture current date
* Get current directory
* Perform arithmetic

### Output Example

* Greeting message
* Current date
* Directory path
* Calculated values

---

## 3. check_number.sh

### Purpose

Built conditional logic using user input.

### Implemented

* Even/Odd detection
* Positive/Negative/Zero check
* Prime number validation

### Concepts Used

* read
* if / elif / else
* loops
* arithmetic operations

---

## 4. file_check.sh

### Purpose

Validate file existence.

### Implemented

* Check if path exists
* Identify regular file
* Identify directory

### Commands Practiced

```bash
-f
-d
-e
```

---

## 5. server_health.sh

### Purpose

Collect basic Linux server information.

### Implemented

* Memory usage
* Disk utilization
* Top CPU-consuming processes

### Commands Used

```bash
free -h
df -h
ps
```

---

## 6. service_health.sh

### Purpose

Check service availability.

### Implemented

* Accept service name
* Validate running state

### Commands Used

```bash
systemctl is-active
```

---

# Key Learnings

### 1.

Shell scripts convert repetitive Linux commands into reusable automation.

### 2.

Variables and user input make scripts dynamic.

### 3.

Conditional logic helps automate operational decisions.

---

## Repository Structure

```text
2026/day-16/
├── hello.sh
├── variables.sh
├── check_number.sh
├── file_check.sh
├── server_health.sh
├── service_health.sh
└── day-16-shell-scripting.md
```

## Final Outcome

Completed Day 16 by writing multiple shell scripts and extending the exercises into practical Linux operations and health checks.
