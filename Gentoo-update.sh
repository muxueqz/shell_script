#!/bin/sh
# emerge --sync
 emerge  --keep-going -vuD --newuse world
 #emerge --skipfirst -vuD --newuse world
 emerge -depclean
 revdep-rebuild
