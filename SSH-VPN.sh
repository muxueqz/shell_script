#!/bin/sh
DST=124.172.250.146
LOCAL_IP=10.10.10.8
DST_IP=10.10.10.146
NETMASK=255.255.255.0
PORT=51722
ssh -p $PORT -S /var/run/ssh-myvpn-tunnel-control -M -f -w 0:0 $DST true

sleep 5
ifconfig tun0 $LOCAL_IP/24 pointopoint $DST_IP
#route add -net 10.99.99.0 netmask 255.255.255.0 gw 10.254.254.1 tun0

#ssh -S /var/run/ssh-myvpn-tunnel-control -O exit $DST

