#!/bin/bash

"PID||STAT||COMMAND"

for pid in $(ls -l /proc | awk '{print $9}' | grep -s "^[0-9]*[0-9]$"| sort -n );
do

#time=$(cat 2>/dev/null /proc/$pid/timers | awk '{print $3}')
stat=$(cat 2>/dev/null /proc/$pid/stat | awk '{print $3}')
cmd=$(cat 2>/dev/null /proc/$pid/cmdline | awk '{print $0}')

printf "%-8s | %-15s | %s\n" "$pid | $stat | $time | $cmd" | column -t  -s '|'
done

