#!/bin/sh
USER=root
PASSWD=uClinux
IP=$1
#IP=192.168.0.203
TIMEOUT=0.5

(sleep $TIMEOUT 
echo "$USER"
sleep $TIMEOUT
echo "$PASSWD"
dd bs=1 if=/dev/tty
)|telnet $IP
