#!/bin/bash

# collect cpu
cpu_usage=$(echo "100 - $(mpstat 1 1 | awk '/Average/ {print $NF}')" | bc)
echo "CPU usage: $cpu_usage%"
if ($cpu_usage > 60); then

# collect ram
memory_usage=$(free | awk '/Mem/ {print $3/$2 * 100}')
echo "Memory usageL: $memory_usage%"
# collect disk