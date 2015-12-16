#!/bin/bash
for comp in `bashcomp-config list |awk '{print $2}'`;do bashcomp-config enable $comp -global;sudo bashcomp-config enable $comp -global ;done
