#!/bin/sh
PASSFILE=~/.pass
NAME="$1"
IP="$2"
USER="$3"
PASSWD=`echo "$4"|base64`
PORT="$5"

readuspw() {
	read -p "Plase Input:'name ip user passwd port' " NAME IP USER PASSWD PORT
	PASSWD=`echo "$PASSWD"|base64`
}
saveuspw() {
	echo "name=$NAME $USER@$IP $PASSWD $PORT"
	echo "name=$NAME $USER@$IP $PASSWD $PORT" >> $PASSFILE
}

if [ -z $NAME ];then
	echo '请重新填写'
	readuspw && saveuspw
	continue
#	exit 1
elif [ -z $IP ];then
	echo '未填写IP'
	exit 1
else
	saveuspw
	fi
