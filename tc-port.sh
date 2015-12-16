#!/bin/bash
IF=em2
PORT=$1
RATE=$2

tc qdisc del dev ${IF} root
tc qdisc add dev ${IF} root handle 1: htb default 30
tc class add dev ${IF} parent 1: classid 1:1 htb rate ${RATE} burst 15k
tc class add dev ${IF} parent 1:1 classid 1:10 htb rate ${RATE} burst 15k
tc qdisc add dev ${IF} parent 1:10 handle 10: sfq perturb 10
U32="tc filter add dev ${IF} protocol ip parent 1:0 prio 1 u32"
$U32 match ip sport ${PORT} 0xffff flowid 1:10

