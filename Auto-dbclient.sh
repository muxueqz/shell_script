#!/bin/sh
PASSFILE=~/.pass
NAME=$1
IP=`cat $PASSFILE |grep -v ^#| grep name=$NAME | cut -d " " -f2|cut -d "@" -f2|head -n1`
OPASSWD=`cat $PASSFILE | grep name=$NAME | cut -d " " -f3|head -n1`
OPORT=`cat $PASSFILE | grep name=$NAME | cut -d " " -f4|head -n1`
USER=`cat $PASSFILE | grep name=$NAME | cut -d " " -f2|cut -d "@" -f1|head -n1`
USUALPSW=`cat $PASSFILE |grep usualPSW |cut -d" " -f2|head -n1`
if [ "$OPASSWD" != "" ] ; then #如果ssh等于空
        PASSWD=$OPASSWD
	        else
		        PASSWD=$USUALPSW
			        fi
if [ "$OPORT" != "" ] ; then #如果ssh等于空
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
spawn dbclient -y -p $PORT -l $USER $IP "$COMMAND"
set timeout 300
expect \"password:\" 
send \"$PASSWD\r\" 
#expect \"]*\" 
interact "

#chmod 700 $AUTO_EXP
#$AUTO_EXP $IP $USER "$COMMAND" 2> /dev/null
#expect \"Are you sure you want to continue connecting\"
#send \"\yes\r\" 
