# Day 02 – Linux Fundamentals

## What is Linux?

Linux is an operating system.

Linux is **open source** and free, with many distributions (distros):

- Ubuntu  
- Fedora  
- CentOS  
- Kali Linux  
- RHEL  

---

## Why Linux?

- Master operating systems
- Linux is used in around **90% of servers**
- Available in different flavors
- High security
- Multi-user support

---

# Linux Architecture

```text
+-------------------+
|   Application     |
+-------------------+
          ↓
+-------------------+
|       Shell       |
+-------------------+
          ↓
+-------------------+
|      Kernel       |
+-------------------+
```

### Components

**Application**
- User applications run here

**Shell**
- Interacts with the Kernel (with programming)
- Terminal connects with shell to execute commands

Examples:

- bash
- sh
- zsh

**Kernel**
- Heart of Linux
- Kernel interacts with hardware to perform functions
- Kernel language: C

---

# Linux Boot Process

```text
Power ON
    ↓
Motherboard
(BIOS - Basic Input Output System)
    ↓
Bootloader
(Linux code starts loading)
    ↓
Kernel starts process
    ↓
systemd
(PID = 1)
    ↓
Starts all other processes
```

Firmware is BIOS.

Everything in Linux is a process. It starts with **PID 1**

```text
systemd
   ↓
starts other processes
```

PID = Process ID

---

# Linux File System Hierarchy

Everything in Linux starts from:

```text
/
```

Root directory:

```text
/
```

Everything in Linux is either:

- File
- Directory
- Process

Example hierarchy:

```text
                    /
                  (root)

      ┌────────┬────────┬────────┬────────┬────────┐
      ↓        ↓        ↓        ↓        ↓

    /bin     /home     /etc     /var     /tmp

(binary     user      config   variable  temporary
programs)   files      files    logs      files)
```

### Directory Information

**/bin**
- Binary programs

**/home**
- User personal files

**/etc**
- Configuration files

**/var**
- Variable files and logs

**/tmp**
- Temporary files

---

# Shell Commands Practice

1. `pwd`
   - Print current working directory

2. `cd`
   - Change directory

3. `ls`
   - List files and directories

4. `cat`
   - Print output

5. `echo`
   - Print output

---

# Important Linux Commands

1. `pwd`
   → Print current working directory

2. `ls -a`
   → List all files

3. `cd`
   → Change directory or folder

4. `chmod`
   → Modify permissions on file for users

5. `useradd`
   → Create a new user

6. `sudo apt update`
   → Refresh local list of available software from repositories

---

# Notes

Everything in Linux is a process.

Linux starts from root (`/`)

Systemd has PID = 1 and starts all other processes. it is a first process which start when we power on system and then systemd inititlize all other processes 

---

# Process States in Linux

Everything in Linux runs as a process. A process moves through different states during its lifecycle.

```text
        New
         ↓
      Running
      ↙     ↘
Waiting     Ready
      ↓
   Terminated

(Zombie state can appear after process completion)
```

### Common Linux Process States

**R – Running**
- Process is currently executing or ready to run on CPU

Example:
```bash
top
```

---

**S – Sleeping**
- Process is waiting for an event or resource

Example:
- Waiting for user input
- Waiting for file operations

---

**T – Stopped**
- Process execution is paused or suspended

Example:

```bash
kill -STOP PID
```

---

**Z – Zombie**
- Process has completed execution but still exists in the process table
- Parent process has not collected its exit status

Zombie process:
- Uses Process ID
- Consumes very little memory
- Indicates improper process cleanup

---

**Terminated**
- Process execution is fully completed and removed

---

# View Process States

Check process states using:

```bash
ps aux
```

or

```bash
ps -ef
```

Example output:

```text
USER      PID   STAT   COMMAND
root      101     R    nginx
user      220     S    chrome
user      330     Z    zombie_process
```

STAT values:
- R → Running  
- S → Sleeping  
- T → Stopped  
- Z → Zombie
