# Day 13 – Linux Volume Management (LVM) on AWS EC2

## Objective

Learn Linux Logical Volume Manager (LVM) by creating and managing storage dynamically on an AWS EC2 instance using an attached EBS volume.

---

## Environment

* Platform: AWS EC2 (Ubuntu)
* Storage Type: EBS Volume
* Device Name Detected: `/dev/nvme1n1`

---

# Task 1 – Verify Attached Storage

Checked available block devices:

```bash
lsblk
```

Observed attached volume:

```text
nvme1n1      259:5    0   10G  0 disk
```

---

# Task 2 – Enter Root Mode

```bash
sudo su
```

---

# Task 3 – Verify Disk

Checked whether the disk already contained a filesystem:

```bash
sudo file -s /dev/nvme1n1
```

Purpose:

* Confirm disk is empty before creating LVM structures.

---

# Task 4 – Create Physical Volume (PV)

Command:

```bash
sudo pvcreate /dev/nvme1n1
```

Verify:

```bash
sudo pvs
```

Purpose:

* Convert raw EBS storage into an LVM Physical Volume.

---

# Task 5 – Create Volume Group (VG)

Command:

```bash
sudo vgcreate devops-vg /dev/nvme1n1
```

Verify:

```bash
sudo vgs
```

Purpose:

* Create a storage pool for logical volumes.

---

# Task 6 – Create Logical Volume (LV)

Command:

```bash
sudo lvcreate -L 5G -n app-data devops-vg
```

Verify:

```bash
sudo lvs
```

Purpose:

* Allocate 5GB storage from the Volume Group.

---

# Task 7 – Create Filesystem

Command:

```bash
sudo mkfs.ext4 /dev/devops-vg/app-data
```

Purpose:

* Format the Logical Volume with ext4.

---

# Task 8 – Mount Logical Volume

Create mount directory:

```bash
sudo mkdir -p /mnt/app-data
```

Mount storage:

```bash
sudo mount /dev/devops-vg/app-data /mnt/app-data
```

Verify:

```bash
df -h
```

Purpose:

* Make storage accessible to the operating system.

---

# LVM Architecture

```text
AWS EBS Volume
      ↓
Physical Volume (PV)
      ↓
Volume Group (VG)
      ↓
Logical Volume (LV)
      ↓
Filesystem (EXT4)
      ↓
Mounted Directory
```

---

# Screenshots to Add

1. lsblk output
2. pvcreate success output
3. pvs output
4. vgcreate and vgs output
5. lvcreate and lvs output
6. mount and df -h output

---

# Commands Used

```bash
sudo su
lsblk
sudo file -s /dev/nvme1n1
sudo pvcreate /dev/nvme1n1
sudo pvs
sudo vgcreate devops-vg /dev/nvme1n1
sudo vgs
sudo lvcreate -L 5G -n app-data devops-vg
sudo lvs
sudo mkfs.ext4 /dev/devops-vg/app-data
sudo mkdir -p /mnt/app-data
sudo mount /dev/devops-vg/app-data /mnt/app-data
df -h
```

---

# What I Learned

1. AWS EBS volumes appear as NVMe devices on modern EC2 instances.

2. LVM enables flexible and scalable storage management.

3. Logical Volumes can be mounted and managed independently from physical disks.

---

## Conclusion

Today I practiced Linux LVM on AWS and created a complete storage workflow from EBS attachment to mounted logical volume. This demonstrated how storage can be managed more flexibly in real cloud environments.
