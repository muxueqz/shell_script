#!/bin/bash
google-search () {
    search=""
    echo "$1"
    for term in $*; do
        search="$search%20$term"
    done
    w3m "http://www.google.com/search?q=$search"
#    w3m "http://www.google.com/search?hl=zh-CN&q=$search"
#    xdg-open "http://www.google.com/search?q=$search"
    }

google-search $1
