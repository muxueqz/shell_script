#!/bin/sh
PASSFILE=~/.pass
NAME=$1
IP=`cat $PASSFILE |grep -v ^#| grep name=$NAME | cut -d " " -f2|cut -d "@" -f2|head -n1`
OPASSWD=`cat $PASSFILE | grep name=$NAME | cut -d " " -f3|head -n1`
OPORT=`cat $PASSFILE | grep name=$NAME | cut -d " " -f4|head -n1`
USER=`cat $PASSFILE | grep name=$NAME | cut -d " " -f2|cut -d "@" -f1|head -n1`
USUALPSW=`cat $PASSFILE |grep usualPSW |cut -d" " -f2|head -n1`
if [ "$OPASSWD" != "" ] ; then #如果ssh等于空
	PASSWD=`echo $OPASSWD|base64 -d`
	        else
		        PASSWD=`echo $USUALPSW|base64 -d`
			        fi
if [ "$OPORT" != "" ] ; then #如果ssh等于空
        PORT=$OPORT
elif [ "$3" = "" ]; then
                        PORT=22
                else
                        PORT=$3
                                fi



AUTO_EXP=/tmp/auto-ssh.exp

COMMAND="$2"

rm -rf ~/.ssh/known_hosts

echo "#!/usr/bin/expect -f
set timeout 300
set IP [lindex \$argv 0]
set USER [lindex \$argv 1]
set COMMAND [lindex \$argv 2] 
spawn ssh -o \"ProxyCommand corkscrew 127.0.0.1 8080 %h %p\" -p $PORT -l \$USER $IP "$COMMAND"
expect \"Are you sure you want to continue connecting\"
send \"\yes\r\" 
expect \"password:\" 
send \"$PASSWD\r\" 
#expect \"]*\" 
interact " > $AUTO_EXP

chmod a+x $AUTO_EXP
$AUTO_EXP $IP $USER "$COMMAND"
