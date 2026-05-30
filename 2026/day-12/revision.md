# Day 12 – Revision & Fundamentals Checkpoint

## Goal

Review and reinforce key Linux and DevOps concepts learned during Days 01–11.

---

# Quick Revision Notes

## Day 01 – DevOps Roadmap & Learning Plan

* Defined my 90 Days of DevOps journey
* Set goals around Linux, Docker, Kubernetes, CI/CD, Monitoring, Cloud, and Automation
* Goal remains unchanged: become job-ready for DevOps Engineer roles

---

## Day 03 – Linux Commands Cheat Sheet

### Top 5 Commands I Would Use During an Incident

```bash
ps -ef
```

View running processes.

```bash
top
```

Monitor system resources in real time.

```bash
systemctl status <service>
```

Check service health.

```bash
tail -f /var/log/syslog
```

Monitor logs live.

```bash
grep
```

Search logs and configuration files quickly.

---

## Process & Service Checks

### Check Running Processes

```bash
ps -ef
```

### Check System Resources

```bash
top
```

### Check Service Status

```bash
systemctl status nginx
```

### Check Service Logs

```bash
journalctl -u nginx
```

### Observations

* Verified active processes running on the server.
* Confirmed service status using systemctl.
* Reviewed logs using journalctl.
* Understood how services behave after startup.

---

## File Operations Practice

### Create Directory

```bash
mkdir revision-practice
```

### Create File

```bash
echo "Linux Revision" > notes.txt
```

### Copy File

```bash
cp notes.txt backup.txt
```

### Check Permissions

```bash
ls -l
```

### Change Permissions

```bash
chmod 644 notes.txt
```

### Change Ownership

```bash
sudo chown ubuntu:ubuntu notes.txt
```

---

## User & Group Verification

### Create User

```bash
sudo useradd devopsuser
```

### Verify User

```bash
id devopsuser
```

### Verify Ownership

```bash
ls -l
```

### Observation

* User creation successful.
* Ownership changes reflected correctly.
* Verified user and group details using id command.

---

# Mini Self-Check

## 1. Which 3 commands save you the most time right now, and why?

### ps -ef

Quickly identifies running processes.

### systemctl status

Checks service health instantly.

### tail -f

Allows real-time log monitoring for troubleshooting.

---

## 2. How do you check if a service is healthy?

Commands I run first:

```bash
systemctl status nginx
```

```bash
journalctl -u nginx
```

```bash
ps -ef | grep nginx
```

---

## 3. How do you safely change ownership and permissions?

Example:

```bash
sudo chown ubuntu:ubuntu app.log
```

```bash
chmod 644 app.log
```

Always verify using:

```bash
ls -l
```

before and after making changes.

---

## 4. What will you focus on improving in the next 3 days?

* Linux networking fundamentals
* Shell scripting basics
* Real-world troubleshooting skills
* Faster command-line navigation
* Better understanding of system services

---

# Key Takeaways

✅ Linux commands are becoming more natural with daily practice.

✅ Service troubleshooting is easier using systemctl and journalctl.

✅ Understanding permissions and ownership is critical for server administration.

✅ Consistent revision helps retain concepts for real-world DevOps work.

---

# Commands Revised Today

```bash
ps -ef
top
systemctl status
journalctl -u
tail -f
grep
ls -l
chmod
chown
id
mkdir
cp
echo
```