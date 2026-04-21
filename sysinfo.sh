#!/bin/bash

#System statistics

computer=$(hostname)
user=$(whoami)
today=$(date '+%Y-%m-%d %H:%M:%S')
uptime=$(uptime -p)
RAM_TOTAL=$(free -h | awk 'NR==2 {print $2}')
RAM_USED=$(free -h | awk 'NR==2 {print $3}')
RAM_FREE=$(free -h | awk 'NR==2 {print $4}')
DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')
DISK_PERCENT=$(df -h / | awk 'NR==2 {print $5}')
TOTAL_PROCESSES=$(ps aux --no-headers | wc -l)


echo "=================================================="
 printf "==========SYSTEM STATISTICS=====================\n"
 echo " Host name: $computer" 
 echo "Current user: $user" 
 echo "Date and time: $today"
 printf " -------------------Uptime-------------------\n"
 echo "   $uptime   "
echo "===================================="
echo ""


echo "--- MEMORY (mb) ---"
echo "  Total  : $RAM_TOTAL"
echo "  Used   : $RAM_USED"
echo "  Free   : $RAM_FREE"
echo ""

echo "--- DISK SPACE ---"
echo "  Total  : $DISK_TOTAL"
echo "  Used   : $DISK_USED"
echo "  Free   : $DISK_FREE"
echo "  Usage  : $DISK_PERCENT"
echo ""

echo "--- PROCESSES---RUNNING---"
echo "  Total programs running: $TOTAL_PROCESSES"
echo ""

TOP5=$(ps aux --no-headers | sort -rk3 | head -5 | awk '{print "  " $11 "  (CPU: " $3 "%  MEM: " $4 "%)"}')

echo "--- TOP 5 PROGRAMS USING THE MOST CPU ---"
echo "$TOP5"

echo ""
echo "==================================="