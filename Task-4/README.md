# Task 4: Secure Monitoring Logs with Dedicated User

## 📌 Objective

To secure monitoring logs by restricting access to a dedicated user and preventing unauthorized access.

---

## ⚙️ Requirements

* Create a dedicated user for monitoring operations
* Create monitoring directory: `/opt/container-monitor`
* Assign ownership of monitoring folder to created user
* Provide full access to monitoring user
* Restrict access for other users
* Verify access control

---

## 🛠️ Implementation Steps

### 1. Create a dedicated monitoring user

```bash
sudo useradd monitoruser
sudo passwd monitoruser
```
---
### 2. Allow monitoring user to access Docker

```bash
sudo usermod -aG docker monitoruser
newgrp docker
```
---

### 3. Assign ownership of directory to monitoring user

```bash
sudo chown -R monitoruser:monitoruser /opt/container-monitor
```

---

### 4. Set secure permissions

```bash
sudo chmod -R 700 /opt/container-monitor
```

---

### 5. Verify ownership and permissions

```bash
ls -ld /opt/container-monitor
```

Expected:

```bash
drwx------ monitoruser monitoruser
```

---

### 6. Verify restricted access for other users

```bash
su - mangesh
cd /opt/container-monitor
```

Expected:

```
Permission denied
```

---

## ✅ Expected Outcome

* Monitoring directory secured
* Only monitoring user has full access
* Other users are restricted from accessing logs and scripts
* Monitoring files are protected from unauthorized access

---

## 🧠 Conclusion

Successfully secured monitoring logs by creating a dedicated user, assigning proper ownership, and restricting access permissions to ensure isolation and security.
