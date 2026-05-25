# Day 07 – Linux File System Hierarchy 

---

## Part 1: Linux File System Hierarchy

### 1. `/` (Root Directory)

- This is the starting point of the Linux file system.
- Every file and directory exists under `/`.

**Command:**
```bash
ls -l /
```

**Example Items:**
- `home`
- `etc`

**I would use this when:**
I want to navigate the complete Linux file system structure.

---

### 2. `/home`

- Stores user home directories.
- Every normal user gets a personal directory here.

**Command:**
```bash
ls -l /home
```

**Example Items:**
- `ubuntu`
- `user`

**I would use this when:**
I need to access user files, scripts, or project folders.

---

### 3. `/root`

- Home directory of the root user.
- Accessible mainly by administrators.

**Command:**
```bash
ls -l /root
```

**Example Items:**
- `.bashrc`
- `scripts`

**I would use this when:**
I am performing administrative or root-level tasks.

---

### 4. `/etc`

- Stores system-wide configuration files.
- Important for managing services and applications.

**Command:**
```bash
ls -l /etc
```

**Example Items:**
- `hostname`
- `ssh`

**I would use this when:**
I need to modify server or application configuration.

---

### 5. `/var/log`

- Stores system and application logs.
- Critical for troubleshooting in DevOps.

**Command:**
```bash
ls -l /var/log
```

**Example Items:**
- `syslog`
- `error.log`
- `access.log`

**I would use this when:**
I need to investigate service failures or server issues.

---

### 6. `/tmp`

- Stores temporary files.
- Files may get deleted after reboot.

**Command:**
```bash
ls -l /tmp
```

**Example Items:**
- temp files
- cache files

**I would use this when:**
Applications need temporary storage during execution.

---

### 7. `/bin`

- Contains essential Linux commands.
- Commands required during boot and recovery.

**Command:**
```bash
ls -l /bin
```

**Example Items:**
- `ls`
- `cp`

**I would use this when:**
I need basic Linux commands for daily operations.

---

### 8. `/usr/bin`

- Stores user-level command binaries.
- Most installed software commands exist here.

**Command:**
```bash
ls -l /usr/bin
```

**Example Items:**
- `python3`
- `git`

**I would use this when:**
I need to run installed applications or developer tools.

---

### 9. `/opt`

- Used for optional or third-party applications.

**Command:**
```bash
ls -l /opt
```

**Example Items:**
- custom software
- vendor applications

**I would use this when:**
I install external tools manually.

---

### Hands-on Commands

**Find largest log files:**
```bash
du -sh /var/log/* 2>/dev/null | sort -h | tail -5
```

**Check hostname config:**
```bash
cat /etc/hostname
```

**Check home directory:**
```bash
ls -la ~
```

---

## Part 2: Scenario-Based Practice

### Scenario 1 – Service Not Starting

**Step 1:**
```bash
systemctl status myapp
```
**Why:** Checks whether the service is active, failed, or stopped.

**Step 2:**
```bash
journalctl -u myapp -n 50
```
**Why:** Displays the latest logs for troubleshooting.

**Step 3:**
```bash
systemctl is-enabled myapp
```
**Why:** Checks if the service starts automatically after reboot.

**Step 4:**
```bash
journalctl -xe
```
**Why:** Shows detailed system error logs.

> **What I Learned:** Always check service status first, then logs, then boot configuration.

---

### Scenario 2 – High CPU Usage

**Step 1:**
```bash
top
```
**Why:** Shows live CPU and memory usage.

**Step 2:**
```bash
ps aux --sort=-%cpu | head -10
```
**Why:** Lists top CPU-consuming processes.

**Step 3:**
```bash
htop
```
**Why:** Provides an easier interactive monitoring interface.

**Step 4:**
```bash
pidof <process_name>
```
**Why:** Finds the process ID of a running application.

> **What I Learned:** High CPU troubleshooting starts with identifying the top-consuming process.

---

### Scenario 3 – Finding Service Logs

**Step 1:**
```bash
systemctl status docker
```
**Why:** Checks whether Docker service is running properly.

**Step 2:**
```bash
journalctl -u docker -n 50
```
**Why:** Shows recent Docker logs.

**Step 3:**
```bash
journalctl -u docker -f
```
**Why:** Follows logs in real-time for live troubleshooting.

**Step 4:**
```bash
journalctl -xe
```
**Why:** Displays additional system-level logs.

> **What I Learned:** Systemd services store logs in journald and can be monitored in real time.

---

### Scenario 4 – File Permission Issue

**Step 1:**
```bash
ls -l /home/user/backup.sh
```
**Why:** Checks current file permissions.

**Step 2:**
```bash
chmod +x /home/user/backup.sh
```
**Why:** Adds execute permission to the script.

**Step 3:**
```bash
ls -l /home/user/backup.sh
```
**Why:** Verifies execute permission was added.

**Step 4:**
```bash
./backup.sh
```
**Why:** Runs the script after fixing permissions.

> **What I Learned:** Always verify permissions before running a script, and use `chmod +x` to grant execute access.
