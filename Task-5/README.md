# Task 5: Firewall Configuration

## 📌 Objective

To configure a secure firewall that restricts unauthorized access while allowing required services such as SSH, HTTP, and application traffic.

---

## ⚙️ Requirements

* Install and configure firewall using firewalld (iptables backend)
* Allow SSH access only from a specific IP address
* Allow HTTP access
* Allow traffic on port 8000

---

## 🛠️ Implementation Steps

### 1. Start and enable firewall service

```bash
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo systemctl status firewalld
```

Expected output:

```bash
active (running)
```

---

### 2. Check existing firewall rules

```bash
sudo firewall-cmd --list-all
```

---

### 3. Allow SSH access only from a specific IP

Replace `<your-ip>` with your client machine IP address:

```bash
sudo firewall-cmd --permanent --add-rich-rule='rule family="ipv4" source address="<your-ip>" port protocol="tcp" port="22" accept'
```

---

### 4. Remove general SSH access

```bash
sudo firewall-cmd --permanent --remove-service=ssh
```

---

### 5. Allow HTTP access (port 80)

```bash
sudo firewall-cmd --permanent --add-service=http
```

---

### 6. Allow application traffic on port 8000

```bash
sudo firewall-cmd --permanent --add-port=8000/tcp
```

---

### 7. Reload firewall rules

```bash
sudo firewall-cmd --reload
```

---

### 8. Verify firewall configuration

```bash
sudo firewall-cmd --list-all
```

Expected:

* HTTP service allowed
* Port 8000 allowed
* SSH allowed only from specified IP

---

## ✅ Expected Outcome

* SSH access restricted to a specific IP address
* HTTP service accessible
* Application accessible on port 8000
* Unauthorized access blocked

---

## 🧠 Conclusion

Successfully configured firewall rules using firewalld to restrict SSH access to a specific IP while allowing HTTP and application traffic, ensuring a secure system configuration.
