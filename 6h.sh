#!/bin/sh
#DATE=`date|cut -d" " -f5|cut -d":" -f1`
H=$1
#FILE=/data/software/mp3/想把我唱给你听.mp3
FILE="-playlist /data/software/morning.m3u"

sleep $H && amixer set Master unmute 99%+ && mplayer -volume 100 -loop 0 $FILE && amixer set Master unmute 70% # && amixer set PCM unmute 70%
