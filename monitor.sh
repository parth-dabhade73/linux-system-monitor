#!/bin/bash

LOG_FILE="system_monitor.log"

echo "System Monitoring Started at: $(date)" >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"

while true
do
    echo "Timestamp: $(date)" >> "$LOG_FILE"
    
    # CPU Usage 
    mpstat 1 1 | awk '/Average/ && $3 ~ /[0-9.]+/ { print "CPU Usage: " 100 - $13 "%"}' >> "$LOG_FILE"

    # Memory Usage
    free -m | awk 'NR==2{printf "Memory Usage: %.2f%%\n", $3*100/$2 }' >> "$LOG_FILE"

    # Disk Usage
    df -h / | awk 'NR==2 {printf "Disk Usage: %s of %s (%s)\n", $3, $2, $5}' >> "$LOG_FILE"

    echo "----------------------------------------" >> "$LOG_FILE"
    
    sleep 5
done

