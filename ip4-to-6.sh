#!/bin/sh
LOCAL_IP=`ip add |grep ppp |grep inet|cut -d" " -f6`
ip tunnel add sit1 mode sit remote 202.120.58.150 local $LOCAL_IP
ifconfig sit1 up 
ifconfig sit1 add 2001:da8:8000:d010:0:5efe:$LOCAL_IP/64
ip route add ::/0 via 2001:da8:8000:d010::1 metric 1
