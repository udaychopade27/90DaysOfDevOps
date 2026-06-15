# Day 18 – Shell Scripting: Functions & Intermediate Concepts

## Objective

Learn how to write cleaner and safer shell scripts using:

* Functions
* Local variables
* Strict mode (`set -euo pipefail`)
* Script organization using `main()`

---

# Task 1 – Basic Functions

## Goal

Create reusable functions and pass arguments.

### Concepts Covered

* Function creation
* Function calls
* Passing arguments (`$1`, `$2`)
* Reusable scripting

### Script

```bash
#!/bin/bash

myFunction() {
    echo "Hello, Uday!"
}

myFunction

sum() {
    local num1=$1
    local num2=$2
    echo "The sum of $num1 and $num2 is: $((num1 + num2))"
}

sum 5 10
```

### Output

```text
Hello, Uday!
The sum of 5 and 10 is: 15
```

### Learning

Functions help reduce duplicate code and improve readability.

---

# Task 2 – Functions with Return Values

## Goal

Check disk and memory usage using functions.

### Script

```bash
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
```

### Output

```text
Disk usage is at XX%.
Memory usage is at XX.
```

### Learning

Functions make monitoring tasks modular and reusable.

---

# Task 3 – Strict Mode (`set -euo pipefail`)

## Goal

Understand safer Bash execution.

### Script

```bash
set -euo pipefail
```

### What Each Flag Does

### `set -e`

Exit immediately if any command fails.

Example:

```bash
false
```

Result:

```text
Script stops immediately.
```

---

### `set -u`

Stop execution if an undefined variable is used.

Example:

```bash
echo "$UNDEFINED_VAR"
```

Result:

```text
unbound variable
```

---

### `set -o pipefail`

Fail an entire pipeline if one command fails.

Example:

```bash
cat missing_file.txt | grep hello
```

Result:

```text
pipeline exits with error
```

### Learning

Strict mode prevents silent failures.

---

# Task 4 – Local Variables

## Goal

Understand variable scope.

### Script

```bash
localFunction() {
    local localVar="I am a local variable"
    globalVar="I am a global variable"

    echo "$localVar"
    echo "$globalVar"
}
```

### Observation

Inside function:

```text
localVar → Accessible
globalVar → Accessible
```

Outside function:

```text
localVar → undefined
globalVar → Accessible
```

### Learning

Use `local` to avoid variable leakage.

---

# Task 5 – System Info Reporter

## Goal

Build a modular monitoring script.

### Features

* Hostname
* OS details
* Uptime
* Disk usage
* Memory usage
* CPU processes

### Commands Used

```text
hostname
uname
uptime
df
free
ps
awk
sort
head
```

### Script Flow

```text
main()
├── printSystemInfo()
├── printUptime()
├── printDiskUsage()
├── printMemoryUsage()
└── printTopCPUProcesses()
```

### Sample Output

```text
================================
Hostname
OS
Uptime
Disk Usage
Memory Usage
CPU Processes
================================
```

---

# Key Takeaways

✅ Functions improve script reusability

✅ `local` variables prevent unwanted side effects

✅ `set -euo pipefail` makes scripts safer for production automation

---

## Folder Structure

```text
2026/
└── day-18/
    ├── functions.sh
    ├── disk_check.sh
    ├── local_demo.sh
    ├── strict_demo.sh
    ├── system_info.sh
    └── day-18-scripting.md
```
