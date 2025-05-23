#!/bin/bash

#limit

CPU_LIMIT=80
RAM_LIMIT=80
DISK_LIMIT=80

#log file and date
DATE=$(date +%d_%m_%Y)
LOG_FILE="sys_monitor.log"


#time stamp
echo "=== System Health Monitor Report - $DATE ===" >> "$LOG_FILE"

#cpu usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
CPU_USAGE_INT=${CPU_USAGE%.*}

echo "Current Cpu usage is : $CPU_USAGE_INT%"  >> "$LOG_FILE"

if (( $CPU_USAGE_INT > $CPU_LIMIT )); then
   echo -e "⚠️ Current Cpu usage is above ${CPU_LIMIT}%: ${CPU_USAGE_INT}% $CPU_USAGE%"
else echo "==== system usage is healthy ====" | tee -a $LOG_FILE

fi

# ram usage
MEM_TOTAL=$(free | awk '/Mem/ {print $2}')
MEM_USED=$(free | awk '/Mem/ {print $3}')
MEM_USAGE=$(echo "scale=2; 100 * $MEM_USED / $MEM_TOTAL" | bc)

if (( $(echo "$MEM_USAGE < $RAM_LIMIT" | bc -l) )); then
  echo "Current Memory usage is $MEM_USAGE%" | tee -a $LOG_FILE
  
   # Print the memory usage if it's below the limit
else
  echo "MEMORY TOO HIGH" | tee -a $LOG_FILE

fi
# disk usage 

DISK_USAGE=$(df -h --total | grep total | awk '{print $5}' | tr -d '%')
DISK_USAGE_INT=($DISK_USAGE)

if [ "$DISK_USAGE_INT" -gt "$DISK_LIMIT" ]; then
 echo "ALERT: Disk usage: $DISK_USAGE_INT% - CRITICAL DISK SPACE! Services may fail." 
else 
 echo "Disk space usage [OK]: All filesystems below $DISK_LIMIT%. Currently $DISK_USAGE_INT%" | tee -a $LOG_FILE
fi
