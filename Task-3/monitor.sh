#!/bin/bash

CONTAINER_NAME=my-web-app
LOG_FILE="/opt/container-monitor/logs/monitor.log"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

docker stats --no-stream --format "{{.Name}} | CPU: {{.CPUPerc}} | MEM: {{.MemUsage}}" \
| grep "$CONTAINER_NAME" >> "$LOG_FILE"

echo "Timestamp: $TIMESTAMP" >> "$LOG_FILE"
echo "-----------------------------------" >> "$LOG_FILE"
