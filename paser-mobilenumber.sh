#!/bin/sh
NUM=$1
wget -q -U "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.2.16) Gecko/20110323 Linux Deepin/10.12 (maverick) Firefox/3.6.16" "http://www.baidu.com/s?bs=111&f=8&wd=$NUM" -O -|iconv -f gbk -t utf8|grep '手机归属地数据'|sed -e :a -e 's/<[^>]*>//g;/</N;//ba' -e 's/&quot;//g' -e 's/&nbsp;//g'|awk '{print $2,$3,$4}'
