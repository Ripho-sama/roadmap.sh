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
echo
echo "Top 5 address with the most requests:"
echo
TOP_IPS=$(awk '{print $1}' $LOG_FILE | sort | uniq -c | sort -nr | head -n 5) # extract IP addresses | place them adjacent to each other | count each identical, adjacent lines add the number at the beginning of the line | sort them according to mathematical decreasing order, print the top 5 lines
echo "$TOP_IPS" | awk '{print $2,"\t-",$1,"requests"}'


# Extract the top 5 most requested path
echo
echo "Top 5 most requested paths\n"
echo
TOP_PATH=$(awk -F\" '{print $2}' $LOG_FILE | awk '{print $2}' | sort | uniq -c | sort -nr | head -n5) # Divide the file in two and take the second path | extract only the path (removing the METHODS(methods like GET,POST in the beginning) used and the PROTOCOL(protocols like http/1.1, http/1.2) used) | Place Identical lines adjacent to each other | count identical lines and add the total number of appearance in the beginning of each uniq line. It also strips repetitif lines | print the top 5
echo "$TOP_PATH" | awk 'BEGIN {ORS="\n---\n"} {print $2,"-",$1,"requests"}'


