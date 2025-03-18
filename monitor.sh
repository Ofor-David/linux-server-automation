#!/bin/bash
 
 set -e # exits if any command fails
# collect cpu
cpu_usage=$(echo "100 - $(mpstat 1 1 | awk '/Average/ {print $NF}')" | bc)
echo "CPU usage: $cpu_usage%"

# collect ram
memory_usage=$(free | awk '/Mem/ {print $3/$2 * 100}')
echo "Memory usage: $memory_usage%"

# collect disk
disk_usage=$(df -h / | awk 'NR==2 {print $5}')
echo "Disk usage: $disk_usage"