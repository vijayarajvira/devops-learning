#!/bin/bash
# System Health Check Script

echo "===== SYSTEM HEALTH CHECK ====="
echo "Date & Time: $(date)"
echo ""

echo "=== UPTIME ==="
uptime
echo ""

echo "=== DISK USAGE ==="
df -h | grep '^/dev'
echo ""

echo "=== MEMORY USAGE ==="
free -h
echo ""

echo "=== TOP 5 PROCESSES BY CPU ==="
ps -eo pid,comm,%cpu --sort=-%cpu | head -6
echo ""

echo "=== DISK ALERT CHECK ==="
DISK_USAGE=$(df / | grep / | awk '{print $5}' | sed 's/%//')

if [ $DISK_USAGE -gt 80 ]; then
  echo "⚠️  Warning: Disk usage is above 80% ($DISK_USAGE%)"
else
  echo "✅ Disk usage is normal ($DISK_USAGE%)"
fi

