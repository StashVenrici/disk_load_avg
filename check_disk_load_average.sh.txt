#!/bin/bash

count=$(tail -n 100 /var/log/disk_load_avg.log | grep "$(date +"%Y-%m-%d %H:")\|$(date +"%Y-%m-%d %H:" --date '1 hours ago')" | grep "CRITICAL" | wc -l)

if [ "$count" -le 10 ]; then
    echo "OK: disk load average is lesser 30% at last 1 hr"
    exit 0
else
    echo "CRITICAL: One or more disks have exceeded the limit 30% at last hr"
    tail -n 3 /var/log/disk_load_avg.log
    exit 2
fi