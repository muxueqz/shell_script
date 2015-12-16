#!/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/sbin:/usr/sbin:/home/muxueqz/bin:/opt/muxueqz-sh/:/opt/muxueqz-py:/opt/jre/bin:/opt/Palm/novacom/

wkhtmltoimage 'http://sandbox.runjs.cn/show/ydp3it7b' /dev/shm/programmer_today.png
habak -ms  ~/Downloads/linux-world-map-large.png -mp 500,100 /dev/shm/programmer_today.png
