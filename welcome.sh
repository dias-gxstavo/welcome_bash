#!/bin/bash

# Welcome script to Linux Mint

USUARIO=$(whoami)
HOSTNAME=$(hostname)
DATE=$(date '+%d/%m/%Y')
HOUR=$(date '+%H:%M')
UPTIME=$(uptime -p)
PRETTY_NAME=$(cat /etc/*-release | grep '^PRETTY_NAME=' | cut -d'=' -f2 | tr -d '"')

RED='\033[0;31m'    
GREEN='\033[0;32m'  
BLUE='\033[0;34m'   
NC='\033[0m'        

fcheck_hour() {
    current_hour=$(date +%H)

    if (( current_hour >= 6 && current_hour < 12 )); then
        echo "🌅"
    elif (( current_hour >= 12 && current_hour < 18 )); then
        echo "🌇"
    else
        echo "🌑"
    fi
}

gnome-terminal --title="welcome, $USUARIO! $(fcheck_hour)" -- bash -c "
echo '
 ░██       ░██            ░██                                                  
░██       ░██            ░██                                                  
░██  ░██  ░██  ░███████  ░██  ░███████   ░███████  ░█████████████   ░███████  
░██ ░████ ░██ ░██    ░██ ░██ ░██    ░██ ░██    ░██ ░██   ░██   ░██ ░██    ░██ 
░██░██ ░██░██ ░█████████ ░██ ░██        ░██    ░██ ░██   ░██   ░██ ░█████████ 
░████   ░████ ░██        ░██ ░██    ░██ ░██    ░██ ░██   ░██   ░██ ░██        
░███     ░███  ░███████  ░██  ░███████   ░███████  ░██   ░██   ░██  ░███████  
                                                                              
                                                                                                                                                          
';
echo -e ' DETAILS';
echo -e '$GREEN -----------------------------$NC';
echo -e '$GREEN Date$NC: $DATE - Hour: $HOUR';
echo -e '$GREEN Uptime$NC: $UPTIME';
echo -e '$GREEN OS Info$NC: $PRETTY_NAME';
echo -e '$GREEN CPU$NC: $(grep -m 1 'model name' /proc/cpuinfo | cut -d: -f2 | sed 's/^[ \t]*//')';
echo -e '$GREEN Disk Space (/)$NC: $(df -h / | awk 'NR==2 {print $4 " free of " $2}')';
echo;
echo -e ' $USUARIO@$HOSTNAME system started!';
read
"