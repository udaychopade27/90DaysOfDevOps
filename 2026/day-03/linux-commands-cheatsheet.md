# Day 03 – Linux Commands Cheat Sheet

Today’s goal is to build Linux command confidence.

This command toolkit will help during troubleshooting, process inspection, file operations, and networking tasks.

---

# Process Management Commands

### 1. ps
Show currently running processes

```bash
ps
```

### 2. ps -ef
Display all running processes in full format

```bash
ps -ef
```

### 3. top
Show real-time system and process usage

```bash
top
```

### 4. htop
Interactive process viewer

```bash
htop
```

### 5. kill PID
Terminate a process using Process ID

```bash
kill 1234
```

### 6. kill -9 PID
Forcefully stop a process

```bash
kill -9 1234
```

### 7. pgrep
Find process ID by process name

```bash
pgrep nginx
```

### 8. systemctl status
Check service status

```bash
systemctl status nginx
```

### 9. systemctl start
Start a service

```bash
systemctl start nginx
```

### 10. systemctl restart
Restart a service

```bash
systemctl restart nginx
```

---

# File System Commands

### 11. pwd
Print current working directory

```bash
pwd
```

### 12. ls -la
List files including hidden files

```bash
ls -la
```

### 13. cd
Change directory

```bash
cd foldername
```

### 14. mkdir
Create a new directory

```bash
mkdir devops
```

### 15. touch
Create a file

```bash
touch notes.txt
```

### 16. cp
Copy files or directories

```bash
cp file1 file2
```

### 17. mv
Move or rename files

```bash
mv old.txt new.txt
```

### 18. rm -rf
Delete files/directories forcefully

```bash
rm -rf foldername
```

### 19. cat
Display file content

```bash
cat notes.txt
```

### 20. grep
Search text inside files

```bash
grep error logs.txt
```

### 21. find
Search files and directories

```bash
find . -name "*.txt"
```

### 22. tail -f
Monitor logs in real time

```bash
tail -f app.log
```

---

# Networking Troubleshooting Commands

### 23. ping
Check connectivity with another host

```bash
ping google.com
```

### 24. ip addr
Display IP address information

```bash
ip addr
```

### 25. curl
Transfer data or test APIs

```bash
curl https://example.com
```

### 26. dig
DNS lookup command

```bash
dig google.com
```

### 27. netstat -tulnp
Display listening ports

```bash
netstat -tulnp
```

### 28. ss -tuln
Display socket statistics

```bash
ss -tuln
```

---

# Quick Commands I Found Useful

Log command:

```bash
tail -f app.log
```

Useful for viewing logs in real time.

Networking command:

```bash
ping google.com
```

Useful for checking network connectivity.

---

# Why This Matters for DevOps

Real production issues are solved from the command line.

The faster you inspect logs, processes, and networking issues, the faster you can:

- Restore services
- Reduce downtime
- Gain trust as an operator

