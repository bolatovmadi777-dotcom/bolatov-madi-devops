#!/usr/bin/env bash
# Student information and system information script
# Student: Madi Bolatov | Group: IT2-2308 | Student ID: 41511

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
INFO_FILE="$SCRIPT_DIR/../Bolatov_Madi_info.txt"

echo "=============================="
echo "Student Information"
echo "=============================="
echo
echo "Name: Madi"
echo "Surname: Bolatov"
echo "Group: IT2-2308"
echo "Student ID: 41511"
echo
echo "=============================="
echo "System Information"
echo "=============================="
echo
echo "Username: $(whoami)"
echo "Hostname: $(hostname)"
echo "Current Date: $(date)"

if [ "$(uname)" = "Darwin" ]; then
  echo "Operating System: $(sw_vers -productName) $(sw_vers -productVersion) ($(uname -sm))"
else
  echo "Operating System: $(uname -srm)"
fi

echo "Disk Usage: $(df -h / | tail -1 | awk '{print $3 " used of " $2 " (" $5 " used)"}')"

if [ "$(uname)" = "Darwin" ]; then
  echo "Memory Usage: $(top -l 1 -n 0 | grep PhysMem)"
else
  echo "Memory Usage: $(free -h | awk 'NR==2 {print $3 " used of " $2}')"
fi
echo

if [ -f "$INFO_FILE" ]; then
  echo "Student information file exists."
else
  echo "Student information file does not exist."
fi
