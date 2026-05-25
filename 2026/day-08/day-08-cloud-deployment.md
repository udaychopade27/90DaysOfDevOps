# Day 08 – Cloud Server Setup: Docker, Nginx & Web Deployment

## Objective

The goal of today’s task was to deploy a real web server on a cloud instance and practice practical server management tasks including SSH access, package installation, security group configuration, and log management.

---

# Cloud Platform Used

* AWS EC2
* Ubuntu Server 26.04 LTS

---

# Tasks Performed

## 1. Launched AWS EC2 Instance

* Created an Ubuntu EC2 instance
* Configured key pair authentication
* Attached Security Group rules for SSH and HTTP access

---

## 2. Connected to Server Using SSH

Command used:

```bash
ssh -i Devops-training-server-key.pem ubuntu@3.25.53.239
```

Successfully connected to the remote Linux server.

---

## 3. Updated the Server

Updated package repositories before installation.

```bash 
sudo apt-get update
```

---

## 4. Installed Nginx

Installed Nginx web server on the EC2 instance.

```bash 
sudo apt install nginx
```

---

## 5. Verified Nginx Service

Checked whether Nginx service was running correctly.

```bash 
sudo systemctl status nginx
```

Tested locally using:

```bash 
curl http://localhost
```

---

## 6. Configured Security Group

Added inbound rules in AWS Security Group:

| Type | Port | Source    |
| ---- | ---- | --------- |
| SSH  | 22   | 0.0.0.0/0 |
| HTTP | 80   | 0.0.0.0/0 |

This allowed public access to the web server.

---

## 7. Verified Public Web Access

Opened the browser and accessed:

```text id="r7pwf4"
http://<public ip of ec2>
```

Successfully viewed the default Nginx welcome page.

---

## 8. Viewed and Saved Nginx Logs

Viewed access logs:

```bash 
sudo cat /var/log/nginx/access.log
```

Saved logs into a separate file:

```bash
sudo cp /var/log/nginx/access.log ~/nginx-logs.txt
```

---


# What I Learned

* How to launch and configure an AWS EC2 instance
* How to securely connect to a cloud server using SSH
* How to install and manage Nginx on Ubuntu
* Importance of Security Groups and firewall configuration
* How to verify services and analyze Nginx logs
* Real-world basics of cloud infrastructure management

---

# Key DevOps Concepts Practiced

* Cloud Infrastructure Provisioning
* Remote Linux Server Management
* Web Server Deployment
* Security Group Configuration
* Log Management
* Troubleshooting Public Access Issues

---

# Files Added

* day-08-cloud-deployment.md
* nginx-logs.txt

---

# Conclusion

Today’s task provided hands-on experience with deploying and managing a real cloud-hosted web server using AWS EC2 and Nginx. This exercise helped strengthen foundational DevOps skills including Linux administration, cloud networking, service deployment, and troubleshooting.
