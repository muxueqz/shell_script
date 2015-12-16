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


rdesktop -r clipboard:PRIMARYCLIPBOARD -a 8 -z $IP -u $USER -p $PASSWD
