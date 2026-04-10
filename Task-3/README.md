# Task 3: Container Monitoring and Logging

## 📌 Objective

To monitor Docker container resource usage and log CPU and memory usage with timestamps automatically.

---

## ⚙️ Requirements

* Create a monitoring script to:

  * Capture container CPU usage
  * Capture container memory usage
  * Add timestamp for each entry
  * Store logs in a monitoring folder

* Automate monitoring using cron job (runs every minute)

* Store logs in:

  ```
  /opt/container-monitor/logs/
  ```

---

## 🛠️ Implementation Steps

### 1. Create monitoring directory

```bash id="0lbv3r"
sudo mkdir -p /opt/container-monitor/logs
```

---

### 2. Create monitoring script

```bash 
nano /opt/container-monitor/monitor.sh
```

Add the following:

```bash id="zz3gaj"
#!/bin/bash

CONTAINER_NAME=my-web-app
LOG_FILE="/opt/container-monitor/logs/monitor.log"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

docker stats --no-stream --format "{{.Name}} | CPU: {{.CPUPerc}} | MEM: {{.MemUsage}}" \
| grep "$CONTAINER_NAME" >> "$LOG_FILE"

echo "Timestamp: $TIMESTAMP" >> "$LOG_FILE"
echo "-----------------------------------" >> "$LOG_FILE"
```

---

### 3. Make script executable

```bash 
chmod +x /opt/container-monitor/monitor.sh
```

---

### 4. Test the script manually

```bash 
/opt/container-monitor/./monitor.sh
```

Check logs:

```bash id="nm0f3i"
cat /opt/container-monitor/logs/monitor.log
```

---

### 5. Automate using cron (runs every minute)

```bash id="gq7jz8"
crontab -e
```

Add:

```bash 
* * * * * /opt/container-monitor/monitor.sh
```

---

### 6. Verify automatic logging

```bash id="3swh2z"
cat /opt/container-monitor/logs/monitor.log
```

---

## ✅ Expected Outcome

* Container CPU usage captured
* Container memory usage captured
* Timestamp added for each log entry
* Logs stored in `/opt/container-monitor/logs/`
* Monitoring runs automatically every minute

---

## 📁 Files Used

* monitor.sh
* /opt/container-monitor/logs/monitor.log

---

## 🧠 Conclusion

Successfully implemented automated container monitoring using a shell script and cron job to log CPU and memory usage with timestamps.
