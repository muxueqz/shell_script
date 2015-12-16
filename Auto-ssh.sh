#!/bin/sh
PASSFILE=~/.pass
NAME=$1
IP=`cat $PASSFILE |grep -v ^#| grep name=$NAME | cut -d " " -f2|cut -d "@" -f2|head -n1`
OPASSWD=`cat $PASSFILE | grep name=$NAME | cut -d " " -f3|head -n1`
OPORT=`cat $PASSFILE | grep name=$NAME | cut -d " " -f4|head -n1`
USER=`cat $PASSFILE | grep name=$NAME | cut -d " " -f2|cut -d "@" -f1|head -n1`
USUALPSW=`cat $PASSFILE |grep usualPSW |cut -d" " -f2|head -n1`
if [ "$OPASSWD" != "" ] ; then #���ssh���ڿ�
	PASSWD=`echo $OPASSWD|base64 -d`
	        else
		        PASSWD=`echo $USUALPSW|base64 -d`
			        fi
if [ "$OPORT" != "" ] ; then #���ssh���ڿ�
        PORT=$OPORT
elif [ "$3" = "" ]; then
                        PORT=22
                else
                        PORT=$3
                                fi



AUTO_EXP=/dev/shm/$RANDOM-auto-ssh.exp

COMMAND="$2"

rm -rf ~/.ssh/known_hosts

expect -c "
spawn ssh -o "StrictHostKeyChecking=no" -p $PORT -l $USER $IP "$COMMAND"
set timeout 300
expect \"assword:\" 
send \"$PASSWD\r\" 
#expect \"]*\" 
interact "

#expect \"Are you sure you want to continue connecting\"
#send \"\yes\r\" 