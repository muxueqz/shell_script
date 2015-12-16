#!/bin/sh
#ssh -o 'UserKnownHostsFile=/dev/null'  -o 'StrictHostKeyChecking=no' opera.linuxzh.org -l muxueqz -X -Y '/usr/bin/deepin-wine-rtx2010' &> /tmp/rtx.log
export WINEARCH=win32
export WINEPREFIX=/home/muxueqz/wineprefix_rtx/
#~/.PlayOnLinux/wine/linux-x86/1.6.2/bin/wine /data/iso/RTXC/RTX.exe
#wine /data/iso/RTXC/RTX.exe
wine "${WINEPREFIX}/drive_c/Program Files/RTXC/RTX.exe"
winebook -k
