#!/bin/bash
DEVICE='DVI-D-0'
CURRENT_MODE=`xrandr | grep $DEVICE | cut -d' ' -f4`
if [ "$CURRENT_MODE" != "left" ] ; then
 ROTATE_MODE=left
else
 ROTATE_MODE=normal
fi
xrandr --output $DEVICE --rotate $ROTATE_MODE
