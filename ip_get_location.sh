#!/bin/sh
IP=$1
FILE=/dev/shm/"$RANDOM"_ip_location
wget -q -O $FILE myip.cn/$IP
cat $FILE|grep '您的IP地址'| sed -e :a -e 's/<[^>]*>//g;/</N;//ba'
cat $FILE|grep '来自'| sed -e :a -e 's/<[^>]*>//g;/</N;//ba'
