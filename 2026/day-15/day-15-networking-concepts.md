# Day 15 – Networking Concepts: DNS, IP, Subnets & Ports

## Goal

Understand core networking concepts used daily in DevOps and cloud environments:

* DNS
* IP Addressing
* CIDR & Subnetting
* Ports and Services

---

# Task 1: DNS – How Names Become IPs

## 1. What happens when you type `google.com` in a browser?

When I enter `google.com` in a browser, my system first checks local DNS cache to see if the IP already exists. If not found, a DNS query is sent to a DNS resolver which contacts DNS servers to find the correct IP address. Once resolved, the browser connects to that IP using HTTP/HTTPS and loads the website.

---

## 2. DNS Record Types

| Record | Purpose                                   |
| ------ | ----------------------------------------- |
| A      | Maps a domain name to an IPv4 address     |
| AAAA   | Maps a domain name to an IPv6 address     |
| CNAME  | Points one domain name to another domain  |
| MX     | Specifies mail servers for email delivery |
| NS     | Identifies authoritative DNS servers      |

---

## 3. DNS Lookup

Command:

```bash
dig google.com
```

Output:

```bash
;; ANSWER SECTION:
google.com.    300   IN   A   142.250.xxx.xxx
```

Observations:

* A Record → `142.250.xxx.xxx`
* TTL → `300`

> Replace with your actual output.

---

# Task 2: IP Addressing

## 1. What is IPv4?

IPv4 is a 32-bit addressing system used to uniquely identify devices on a network.

Example:

```text
192.168.1.10
```

Structure:

```text
Network Portion + Host Portion
```

---

## 2. Public vs Private IP

| Type       | Description                    | Example      |
| ---------- | ------------------------------ | ------------ |
| Public IP  | Reachable from internet        | 8.8.8.8      |
| Private IP | Internal network communication | 192.168.1.20 |

---

## 3. Private IP Ranges

```text
10.0.0.0 – 10.255.255.255

172.16.0.0 – 172.31.255.255

192.168.0.0 – 192.168.255.255
```

---

## 4. Identify Local Private IP

Command:

```bash
ip addr show
```

Output:

```bash
inet 172.xx.xx.xx/20
```

Observation:

* My local IP belongs to the Private IP range.

> Replace with your actual output.

---

# Task 3: CIDR & Subnetting

## 1. What does `/24` mean?

`/24` means the first 24 bits represent the network portion and remaining bits represent host addresses.

Example:

```text
192.168.1.0/24
```

Subnet Mask:

```text
255.255.255.0
```

---

## 2. Hosts Calculation

| CIDR | Formula     | Usable Hosts |
| ---- | ----------- | ------------ |
| /24  | 2^(32−24)-2 | 254          |
| /16  | 2^(32−16)-2 | 65,534       |
| /28  | 2^(32−28)-2 | 14           |

---

## 3. Why do we subnet?

Subnetting helps divide large networks into smaller manageable networks. It improves security, reduces broadcast traffic, and optimizes IP allocation.

---

## 4. CIDR Table

| CIDR | Subnet Mask     | Total IPs | Usable Hosts |
| ---- | --------------- | --------- | ------------ |
| /24  | 255.255.255.0   | 256       | 254          |
| /16  | 255.255.0.0     | 65,536    | 65,534       |
| /28  | 255.255.255.240 | 16        | 14           |

---

# Task 4: Ports – The Doors to Services

## 1. What is a Port?

A port is a logical communication endpoint that allows multiple services to run on the same machine.

---

## 2. Common Ports

| Port  | Service |
| ----- | ------- |
| 22    | SSH     |
| 80    | HTTP    |
| 443   | HTTPS   |
| 53    | DNS     |
| 3306  | MySQL   |
| 6379  | Redis   |
| 27017 | MongoDB |

---

## 3. Check Listening Ports

Command:

```bash
ss -tulpn
```

Example Output:

```bash
tcp LISTEN 0 128 0.0.0.0:22
tcp LISTEN 0 511 0.0.0.0:80
```

Observations:

* Port 22 → SSH Service
* Port 80 → HTTP Service

> Replace with your actual output.

---

# Task 5: Putting It Together

## 1. `curl http://myapp.com:8080`

Networking concepts involved:

* DNS resolves `myapp.com`
* TCP establishes connection
* Port `8080` identifies application service
* HTTP sends request and receives response

---

## 2. App cannot reach database `10.0.1.50:3306`

Things to check:

* Database server status
* Port 3306 listening
* Security group / firewall rules
* DNS/IP reachability
* Network ACLs and routing

Commands:

```bash
ping 10.0.1.50

nc -zv 10.0.1.50 3306

telnet 10.0.1.50 3306
```

---

# What I Learned (Key Takeaways)

### 1.

DNS acts like the internet phonebook and converts names into IP addresses.

### 2.

CIDR and subnetting make network design scalable and efficient.

### 3.

Ports allow multiple services to communicate simultaneously on one machine.

---

# Commands Used

```bash
dig google.com

ip addr show

ss -tulpn
```