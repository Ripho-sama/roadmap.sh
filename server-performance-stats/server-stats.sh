#!/bin/env sh

#=============================================================$
# A SIMPLE SCRIPT THAT VERIFIES THE CPU, MEMORY AND DISK LOAD #
#=============================================================#

# Get the os name and version
NAME=$(cat /etc/os-release | grep -E "^NAME")
NAME=${NAME#*\"} ; NAME=${NAME%\"*} # Clean the quotes
VERSION=$(cat /etc/os-release | grep -E "^VERSION_CODENAME")
VERSION=${VERSION#*=} # Clean the quotes

echo "----- \t GENERAL \t ----- "
echo "NAME: $NAME $VERSION "

echo $(uptime)
echo "\n"

echo "----- \t CPU \t -----"
echo "* Top 5 cpu consumming processes \n"
ps aux --sort=-%cpu | head -n5

echo "\n* Top 5 memory consumming processes \n"

ps aux --sort=-%mem | head -n5

echo "\n----- \t DISK MANAGEMENT \t -----"

TOTAL=$(df / -h --output=size | tail -n1 )
USED=$(df / -h --output=used | tail -n1 )
AVAIL=$(df / -h --output=avail | tail -n1 )
PCENT_USED=$(df / -h --output=pcent | tail -n1 )
echo "Total: $TOTAL"
echo "Used: $USED"
echo "Available: $AVAIL"
echo "Percent Used: $PCENT_USED"

echo "\nCONCLUSION: Out of $TOTAL,  ${USED}(${PCENT_USED}%) is used and $AVAIL is available."
echo "--------------------------------------------------------------------------------------"