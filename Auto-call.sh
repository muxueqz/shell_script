#!/bin/sh
NUM=$1
TIMEOUT=$3
CONF=$2
#CONF=ucsky-siptest


(echo "call $NUM"
sleep $TIMEOUT
)|twinkle -c -f $CONF

