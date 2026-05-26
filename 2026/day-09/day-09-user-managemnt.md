# Day 09 – Linux User & Group Management Challenge

## Objective

Practice Linux user and group management by creating users, groups, assigning permissions, and configuring shared directories.

---

## Task 1 – Create Users

### Users Created

- `tokyo`
- `berlin`
- `professor`

### Commands Used

```bash
sudo useradd -m tokyo
sudo passwd tokyo
sudo useradd -m berlin
sudo passwd berlin
sudo useradd -m professor
sudo passwd professor
```

### Verification

```bash
cat /etc/passwd | grep -E 'tokyo|berlin|professor'
ls /home
```

---

## Task 2 – Create Groups

### Groups Created

- `developers`
- `admins`

### Commands Used

```bash
sudo groupadd developers
sudo groupadd admins
```

### Verification

```bash
cat /etc/group | grep -E 'developers|admins'
```

---

## Task 3 – Assign Users to Groups

### Group Assignments

| User      | Groups                  |
|-----------|-------------------------|
| tokyo     | developers              |
| berlin    | developers, admins      |
| professor | admins                  |

### Commands Used

```bash
sudo usermod -aG developers tokyo
sudo usermod -aG developers berlin
sudo usermod -aG admins berlin
sudo usermod -aG admins professor
```

### Verification

```bash
groups tokyo
groups berlin
groups professor
```

---

## Task 4 – Shared Directory Setup

### Directory Created

`/opt/dev-project`

### Commands Used

```bash
sudo mkdir -p /opt/dev-project
sudo chgrp developers /opt/dev-project
sudo chmod 775 /opt/dev-project
```

### Verification

```bash
ls -ld /opt/dev-project
```

### Test File Creation

```bash
sudo -u tokyo touch /opt/dev-project/tokyo-file.txt
sudo -u berlin touch /opt/dev-project/berlin-file.txt
```

### Verify Files

```bash
ls -l /opt/dev-project
```

---

## Task 5 – Team Workspace Challenge

### User Created

- `nairobi`

### Group Created

- `project-team`

### Commands Used

```bash
sudo useradd -m nairobi
sudo passwd nairobi
sudo groupadd project-team
sudo usermod -aG project-team nairobi
sudo usermod -aG project-team tokyo
```

### Team Workspace Directory

**Directory Created:** `/opt/team-workspace`

```bash
sudo mkdir -p /opt/team-workspace
sudo chgrp project-team /opt/team-workspace
sudo chmod 775 /opt/team-workspace
```

### Verification

```bash
ls -ld /opt/team-workspace
```

### Test Workspace Access

```bash
# Create file as nairobi
sudo -u nairobi touch /opt/team-workspace/nairobi-test.txt

# Verify
ls -l /opt/team-workspace
```

---

## Commands Summary

| Command    | Purpose                              |
|------------|--------------------------------------|
| `useradd`  | Create a new user                    |
| `passwd`   | Set or change a user's password      |
| `groupadd` | Create a new group                   |
| `usermod`  | Modify user account (e.g. add group) |
| `groups`   | Show groups a user belongs to        |
| `mkdir`    | Create directories                   |
| `chgrp`    | Change group ownership               |
| `chmod`    | Change file/directory permissions    |
| `ls`       | List directory contents              |
| `touch`    | Create an empty file                 |

---

## What I Learned

- How Linux user and group management works in multi-user systems.
- How group permissions help teams collaborate securely.
- How to configure shared directories using ownership and permissions.

---

## Real-World DevOps Relevance

User and group management is critical in DevOps because servers are shared by multiple engineers, applications, and automation tools.

Proper permissions help:

- Improve security
- Prevent unauthorized access
- Enable controlled collaboration
- Reduce operational risks