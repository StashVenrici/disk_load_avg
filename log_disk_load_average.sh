#!/bin/bash

busy_flag=0
while IFS= read -r line
do
  device=$(echo $line | awk '{print $2}')
  util=$(echo $line | awk '{print $10}' | cut -d '.' -f 1)
  if [ "$util" -gt 30 ]; then
    busy_flag=1
  fi
    output+="$device: $util% "
done < <(sar -p -d 1 1 | grep Average | grep -v "swap\|loop" | tail -n+2)

if [ $busy_flag -eq 1 ]; then
  echo "`date +"%Y-%m-%d %H:%M:%S"` CRITICAL: One or more disks have exceeded the limit: $output" >> /var/log/disk_load_avg.log
fi