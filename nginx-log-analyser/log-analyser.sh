#!/bin/env bash
# This script is used to analyze nginx logs and generate a report.

while getopts "f:" opt; do
  case $opt in
    f) LOG_FILE="$OPTARG" ;;
    *) echo "Usage: $0 -f <log_file>"; exit 1 ;;
  esac
done

# Verify if the log file exists
if [ ! -f "$LOG_FILE" ]; then
  echo "Error: Log file not found."
  echo "Usage: $(basename $0) -f <log_file>"
  exit 1
fi

# Extract the top 5 IP addresses from the log file
echo "Top 5 address with the most requests:"
TOP_IPS=$(awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr | head -n 5)
echo "$TOP_IPS" | awk '{print $2,"-",$1,"requests"}'
