# Day 14 – Networking Fundamentals & Hands-on Checks

## Objective

Understand networking fundamentals and practice real troubleshooting commands used in Linux and DevOps environments.

---

# Quick Concepts

## OSI Model vs TCP/IP Stack

| OSI Layer         | Purpose              | TCP/IP Equivalent |
| ----------------- | -------------------- | ----------------- |
| L7 – Application  | HTTP, DNS, SSH       | Application       |
| L6 – Presentation | Encryption, Encoding | Application       |
| L5 – Session      | Session Management   | Application       |
| L4 – Transport    | TCP / UDP            | Transport         |
| L3 – Network      | IP Routing           | Internet          |
| L2 – Data Link    | MAC, Frames          | Link              |
| L1 – Physical     | Signals, Cables      | Link              |

---

## Protocol Placement

| Protocol     | Layer              |
| ------------ | ------------------ |
| HTTP / HTTPS | Application        |
| DNS          | Application        |
| TCP / UDP    | Transport          |
| IP           | Internet / Network |

Example:

```text
curl https://google.com
```

Application → HTTPS
Transport → TCP
Network → IP

---

# Hands-on Checklist

## 1. Identity Check

Command:

```bash
hostname -I
```

Output:

```text
172.31.8.104
172.17.0.1
172.18.0.1
fc00:f853:ccd:e793::1
```

Observation:

* Main private IP detected: 172.31.8.104
* Additional addresses belong to Docker/container networking.

---

## 2. Reachability Test

Command:

```bash
ping google.com -c 5
```

Result:

* Average latency: ~1.2 ms
* Packet loss: 0%

Observation:

* Network connectivity healthy.
* Very low latency indicates stable routing.

---

## 3. HTTP Connectivity

Command:

```bash
curl -I https://google.com
```

Result:

```text
HTTP/2 301
```

Observation:

* Service reachable.
* Redirect received to [www.google.com](http://www.google.com).
* Application layer working.

---

## 4. Name Resolution

Commands:

```bash
dig google.com
nslookup google.com
```

Resolved:

```text
142.250.195.238
```

Observation:

* DNS resolution successful.
* Local resolver handled requests.

---

## 5. Open Ports Inspection

Command:

```bash
ss -tulnp
```

Listening Services:

| Port  | Service           |
| ----- | ----------------- |
| 22    | SSH               |
| 80    | Nginx             |
| 30000 | Container Service |
| 30001 | Container Service |

Observation:

* SSH available for remote access.
* Nginx active on HTTP.
* Docker exposed additional ports.

---

## 6. Port Probe

Commands:

```bash
nc -zv localhost 22
nc -zv localhost 30000
nc -zv localhost 30001
```

Results:

* Port 22 → reachable
* Port 30000 → reachable
* Port 30001 → reachable

Additional checks:

```bash
nc -zv 80.225.231.61 80
```

Reachable

```bash
nc -zv 80.225.231.61 8000
```

Connection refused

Interpretation:

* Port 8000 not accepting connections.
* Next checks:

```bash
systemctl status <service>
sudo ufw status
```

---

## 7. Service Validation

Commands:

```bash
systemctl status nginx
systemctl status docker
```

Observation:

* Nginx → running
* Docker → running

Additional Findings:

```bash
systemctl status kubectl
systemctl status kind
```

Result:

* Not systemd services.

---

## 8. Firewall Status

Command:

```bash
sudo ufw status
```

Result:

```text
inactive
```

Observation:

* Firewall not blocking traffic.

---

## 9. Path Analysis

Command:

```bash
traceroute google.com
```

Observation:

* Destination reached in 6 hops.
* No major latency spikes.
* Route stable.

---

## Connections Snapshot

Command:

```bash
netstat -an | head
```

Observation:

* Use to quickly identify LISTEN and ESTABLISHED states.

---

# Reflection

### Which command gives fastest signal?

```text
ping
```

Quickly confirms basic reachability.

---

### If DNS fails?

Inspect:

```text
Application Layer (DNS)
TCP/IP → Application
```

Commands:

```bash
dig
nslookup
```

---

### If HTTP 500 appears?

Inspect:

```text
Application Layer
```

Check:

```bash
systemctl status
docker logs
journalctl
nginx logs
```

---

## Two follow-up checks in real incidents

```bash
journalctl -xe
docker logs <container>
```

```bash
top
free -h
```

