#!/bin/bash

# Welcome script to Linux Mint

USER=$(whoami)
HOSTNAME=$(hostname)
DATE=$(date '+%d/%m/%Y')
HOURMIN=$(date '+%H:%M')
UPTIME=$(uptime -p)
HOUR=$(date '+%H')
PRETTY_NAME=$(cat /etc/*-release | grep '^PRETTY_NAME=' | cut -d'=' -f2 | tr -d '"')

RED='\033[0;31m'    
GREEN='\033[0;32m'  
BLUE='\033[0;34m'   
NC='\033[0m'        

fcheck_hour() {

    if (( $HOUR >= 6 && $HOUR < 12 )); then
        echo "🌅"
    elif (( $HOUR >= 12 && $HOUR < 18 )); then
        echo "🌇"
    else
        echo "🌑"
    fi
}

gnome-terminal --title="welcome, $USER! $(fcheck_hour)" -- bash -c "
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
echo -e '$GREEN Date$NC: $DATE - Hour: $HOURMIN';
echo -e '$GREEN Uptime$NC: $UPTIME';
echo -e '$GREEN OS Info$NC: $PRETTY_NAME';
echo -e '$GREEN CPU$NC: $(grep -m 1 'model name' /proc/cpuinfo | cut -d: -f2 | sed 's/^[ \t]*//')';
echo -e '$GREEN Disk Space (/)$NC: $(df -h / | awk 'NR==2 {print $4 " free of " $2}')';
echo;
echo -e ' $USER@$HOSTNAME system started!';
sleep 7
exit
"