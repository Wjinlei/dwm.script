#!/bin/bash

dwmblocks &

mailsync &
chk.packages.sh &

#compton -b
picom -b

fcitx &

~/my.scripts/setWallpaper.sh &

