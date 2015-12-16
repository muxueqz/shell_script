#!/bin/bash
#xterm -e "huami.py $1 | xclip -i"
xterm -e "huami.py $1 ; read"
