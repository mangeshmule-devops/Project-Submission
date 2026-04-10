# Task 1: Server Setup and SSH Configuration

## 📌 Objective

To configure secure remote access to a Linux server using SSH with key-based authentication and disable password-based login.

---

## ⚙️ Requirements

* A Linux server (RHEL-based local virtual machine)
* A Linux client machine (RHEL-based)
* Both client and server must be on the same network
* Both client and server must be on the same network to ensure connectivity
* Initial password-based SSH access required for first-time key setup
* Basic Linux command-line knowledge
  
---

## 🛠️ Implementation Steps

### 1. Check if SSH server is installed

```bash
rpm -qa | grep openssh-server
```

---

### 2. Install SSH server (if not installed)

```bash
sudo dnf install openssh-server -y
```

---

### 3. Start and enable SSH service

```bash
sudo systemctl start sshd
sudo systemctl enable sshd
```

---

### 4. Verify SSH service status

```bash
sudo systemctl status sshd
```

Expected output:

```bash
active (running)
```

---

### 5. Configure firewall to allow SSH

```bash
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd --reload
```

---

### 6. Get IP address of the server

```bash
ip a
```

---

### 7. Generate SSH key on client machine

```bash
ssh-keygen
```

---

### 8. Copy public key to server

```bash
ssh-copy-id mangesh@<server-ip>
```

> Enter password once during this step.

---

### 9. Verify passwordless authentication

```bash
ssh mangesh@<server-ip>
```

Expected:

* Login successful
* No password prompt

---

### 10. Disable password-based authentication

Edit SSH configuration:

```bash
sudo nano /etc/ssh/sshd_config
```

Update the following lines:

```bash
PasswordAuthentication no
PermitRootLogin no
PubkeyAuthentication yes
```

---

### 11. Restart SSH service

```bash
sudo systemctl restart sshd
```

---

### 12. Final verification

```bash
ssh mangesh@<server-ip>
```

Expected:

* Login successful
* Password authentication disabled

---

## 📁 Files Used

* /etc/ssh/sshd_config
* ~/.ssh/authorized_keys

---

## 🧠 Conclusion

Successfully configured secure SSH access on a RHEL-based Linux server using key-based authentication and disabled password login to enhance security.
