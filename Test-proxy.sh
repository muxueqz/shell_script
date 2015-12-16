#!/bin/sh
export http_proxy=

IP=$1
PORT=$2
wget -S http://$IP:$PORT
