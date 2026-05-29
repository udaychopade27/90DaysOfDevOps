# Day 11 – Linux File Ownership Challenge

## Objective

Learn how Linux manages file ownership and groups using:

* chown
* chgrp
* Recursive ownership changes
* User and group management

---

## Understanding File Ownership

Command Used:

```bash
ls -l
```

Example Output:

```bash
-rw-r--r-- 1 ubuntu ubuntu 0 Aug 11 devops.txt
```

Explanation:

| Field      | Meaning       |
| ---------- | ------------- |
| -rw-r--r-- | Permissions   |
| 1          | Link Count    |
| ubuntu     | Owner         |
| ubuntu     | Group         |
| 0          | File Size     |
| Aug 11     | Modified Date |
| notes.txt  | File Name     |

### Owner vs Group

| Owner                  | Group                                  |
| ---------------------- | -------------------------------------- |
| User who owns the file | Collection of users with shared access |
| Has primary control    | Members inherit group permissions      |
| Changed using chown    | Changed using chgrp                    |

---

## Task 1 – Understanding Ownership

Commands:

```bash
ls -l
```

Observed owner and group information for files in the home directory.

---

## Task 2 – Basic chown Operations

Created File:

```bash
touch devops-file.txt
```

Checked Ownership:

```bash
ls -l devops-file.txt
```

Changed Owner:

```bash
sudo chown tokyo devops-file.txt
sudo chown berlin devops-file.txt
```

Verification:

```bash
ls -l devops-file.txt
```

Ownership Change:

```text
ubuntu:ubuntu → tokyo:ubuntu → berlin:ubuntu
```

---

## Task 3 – Basic chgrp Operations

Created File:

```bash
touch team-notes.txt
```

Created Group:

```bash
sudo groupadd heist-team
```

Changed Group:

```bash
sudo chgrp heist-team team-notes.txt
```

Verification:

```bash
ls -l team-notes.txt
```

Ownership Change:

```text
ubuntu:ubuntu → ubuntu:heist-team
```

---

## Task 4 – Combined Owner and Group Change

Created File:

```bash
touch project-config.yaml
```

Changed Owner and Group:

```bash
sudo chown professor:heist-team project-config.yaml
```

Created Directory:

```bash
mkdir app-logs
```

Changed Ownership:

```bash
sudo chown berlin:heist-team app-logs
```

Verification:

```bash
ls -ld app-logs
ls -l project-config.yaml
```

---

## Task 5 – Recursive Ownership

Created Structure:

```bash
mkdir -p heist-project/vault
mkdir -p heist-project/plans

touch heist-project/vault/gold.txt
touch heist-project/plans/strategy.conf
```

Created Group:

```bash
sudo groupadd planners
```

Applied Recursive Ownership:

```bash
sudo chown -R professor:planners heist-project/
```

Verification:

```bash
ls -lR heist-project/
```

Result:

All files and directories inherited:

Owner: professor

Group: planners

---

## Task 6 – Practice Challenge

Created Users:

```bash
sudo useradd tokyo
sudo useradd berlin
sudo useradd nairobi
```

Created Groups:

```bash
sudo groupadd vault-team
sudo groupadd tech-team
```

Created Directory:

```bash
mkdir bank-heist
```

Created Files:

```bash
touch bank-heist/access-codes.txt
touch bank-heist/blueprints.pdf
touch bank-heist/escape-plan.txt
```

Assigned Ownership:

```bash
sudo chown tokyo:vault-team bank-heist/access-codes.txt

sudo chown berlin:tech-team bank-heist/blueprints.pdf

sudo chown nairobi:vault-team bank-heist/escape-plan.txt
```

Verification:

```bash
ls -l bank-heist/
```

---

## Commands Used

```bash
ls -l

chown

chgrp

chown owner:group

chown -R owner:group

groupadd

useradd
```

---

## What I Learned

1. Every Linux file has an owner and a group.

2. `chown` changes ownership while `chgrp` changes group ownership.

3. Recursive ownership changes help manage entire application directories efficiently.

4. Proper ownership is critical for deployments, containers, CI/CD pipelines, and log management.

5. Many "Permission denied" issues are caused by incorrect ownership rather than incorrect permissions.

---

## Real-World DevOps Use Cases

* Application deployment directories
* Docker volume permissions
* Jenkins workspace ownership
* Shared team folders
* Log file management
* Kubernetes persistent volumes


