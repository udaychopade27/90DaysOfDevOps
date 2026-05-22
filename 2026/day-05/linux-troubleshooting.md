# Linux Troubleshooting Runbook — Day 05

## Objective

Perform a structured Linux troubleshooting drill by checking:

- CPU usage
- Memory usage
- Disk usage
- Network connectivity
- Service status & logs

**Service selected:** `nginx`

---

## Why nginx?

`nginx` is one of the most widely used web servers and reverse proxies in production environments. Knowing how to quickly diagnose its health is a core DevOps skill — covering web traffic routing, SSL termination, load balancing, and static file serving.

---

## 1. Check System CPU Usage

### Command

```bash
top
# Or for a friendlier view:
htop
```

### Observation

- Checked all active processes sorted by CPU consumption
- Verified `nginx` worker processes were not consuming abnormal CPU
- No unexpected CPU spikes observed during the check

### Next Action if High CPU

- Identify the high CPU process:
  ```bash
  ps aux --sort=-%cpu | head -10
  ```
- Check if nginx is handling a traffic spike or DDoS attempt:
  ```bash
  netstat -an | grep :80 | wc -l
  ```
- Reload nginx config without downtime:
  ```bash
  sudo nginx -s reload
  ```
- Investigate heavy request patterns in access logs

---

## 2. Check Memory Usage

### Command

```bash
free -h
```

### Observation

- Memory utilization reviewed — system had sufficient free memory
- Swap usage was minimal, indicating no memory pressure
- nginx worker processes were within expected memory bounds

### Next Action if Memory is High

- Identify memory-heavy processes:
  ```bash
  ps aux --sort=-%mem | head -10
  ```
- Check nginx worker count (too many workers = high memory):
  ```bash
  grep worker_processes /etc/nginx/nginx.conf
  ```
- Tune `worker_processes` to match CPU cores:
  ```bash
  nproc  # Check available cores
  ```
- Restart nginx if a leak is suspected:
  ```bash
  sudo systemctl restart nginx
  ```

---

## 3. Check Disk Space

### Command

```bash
df -h
```

### Observation

- Verified available disk space across all mounted partitions
- Root partition utilization reviewed — within acceptable range
- `/var/log/nginx/` log directory size checked

### Next Action if Disk is Full

- Check nginx log directory size:
  ```bash
  du -sh /var/log/nginx/
  ```
- Rotate or clear nginx logs:
  ```bash
  sudo logrotate -f /etc/logrotate.d/nginx
  ```
- Vacuum old system journal logs:
  ```bash
  sudo journalctl --vacuum-time=7d
  ```
- Remove orphaned packages or temp files:
  ```bash
  sudo apt autoremove && sudo apt clean
  ```

---

## 4. Check Network Connectivity

### Commands

```bash
ping google.com
curl ifconfig.me
```

### Observation

- Internet connectivity confirmed via ping
- Public IP successfully retrieved via curl
- nginx listening ports verified

### Next Action if Network Fails

- Check which ports nginx is listening on:
  ```bash
  sudo ss -tulnp | grep nginx
  ```
- Check network interface status:
  ```bash
  ip a
  ip link show
  ```
- Verify firewall is not blocking port 80/443:
  ```bash
  sudo ufw status
  sudo iptables -L -n | grep -E '80|443'
  ```
- Test nginx is reachable locally:
  ```bash
  curl -I http://localhost
  ```

---

## 5. Check Service Status

### Command

```bash
systemctl status nginx
```

### Observation

- nginx service reported as **active (running)**
- No failed state or error exit codes observed
- PID and uptime confirmed via systemctl output

### Next Action if Service Fails

- Restart the nginx service:
  ```bash
  sudo systemctl restart nginx
  ```
- Enable nginx to start on boot:
  ```bash
  sudo systemctl enable nginx
  ```
- Test nginx configuration before restarting:
  ```bash
  sudo nginx -t
  ```
- Check for port conflicts (another process on port 80):
  ```bash
  sudo lsof -i :80
  sudo lsof -i :443
  ```

---

## 6. Trace Logs

### Commands

```bash
# View last 50 log entries for nginx
journalctl -u nginx -n 50

# Follow live nginx logs
journalctl -u nginx -f

# Access log (HTTP requests)
sudo tail -f /var/log/nginx/access.log

# Error log (critical issues)
sudo tail -f /var/log/nginx/error.log
```

### Observation

- Reviewed recent 50 log entries via journalctl
- Checked `/var/log/nginx/error.log` — no critical errors found
- Access log showed expected request patterns

### Next Action if Errors Exist

| Error Type | Action |
|---|---|
| `[emerg]` — Config error | Run `sudo nginx -t` and fix the config |
| `[crit]` — Permission denied | Check file/folder permissions: `ls -la /var/www/` |
| `502 Bad Gateway` | Upstream app (e.g., app server) is down |
| `connection refused` | Check if backend service is running |
| `SSL handshake failed` | Verify cert paths in nginx config |

- Investigate repeated failures:
  ```bash
  sudo grep "error" /var/log/nginx/error.log | tail -20
  ```
- Verify permissions on web root:
  ```bash
  ls -la /var/www/html/
  ```
- Roll back recent config changes:
  ```bash
  sudo cp /etc/nginx/nginx.conf.bak /etc/nginx/nginx.conf
  sudo nginx -t && sudo systemctl reload nginx
  ```

---

## 7. nginx-Specific Health Checks

These checks go beyond basic Linux troubleshooting and are specific to nginx operations:

### Validate Config Syntax

```bash
sudo nginx -t
```

### View Active nginx Config

```bash
sudo nginx -T | head -60
```

### Check nginx Version

```bash
nginx -v
```

### Reload Config Without Downtime

```bash
sudo nginx -s reload
```

### Check Active Connections (if stub_status enabled)

```bash
curl http://localhost/nginx_status
```

Expected output:
```
Active connections: 12
server accepts handled requests
 100 100 450
Reading: 0 Writing: 1 Waiting: 11
```

---

## Quick Reference — Command Cheatsheet

| Purpose | Command |
|---|---|
| CPU overview | `top` / `htop` |
| Memory usage | `free -h` |
| Disk space | `df -h` |
| Directory size | `du -sh /var/log/nginx/` |
| Network interfaces | `ip a` |
| Open ports | `ss -tulnp` |
| Service status | `systemctl status nginx` |
| Restart service | `sudo systemctl restart nginx` |
| Test config | `sudo nginx -t` |
| Live error log | `sudo tail -f /var/log/nginx/error.log` |
| Live access log | `sudo tail -f /var/log/nginx/access.log` |
| Journal logs | `journalctl -u nginx -n 50` |
| Follow journal | `journalctl -u nginx -f` |
| Port conflict check | `sudo lsof -i :80` |

---

## Key Takeaway

This Day 05 troubleshooting drill covered a full **incident-style workflow** for nginx:

- **Resource monitoring** — CPU, memory, disk
- **Network verification** — connectivity, port binding, firewall
- **Service inspection** — systemctl status, config validation
- **Log tracing** — journalctl, access/error log analysis
- **nginx-specific checks** — config test, reload, active connection stats

A structured runbook like this reduces mean time to resolution (MTTR) during production incidents by giving engineers a repeatable, ordered checklist rather than relying on memory under pressure.

---