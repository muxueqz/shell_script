#!/bin/sh
sudo ip route replace default scope global via $1
