#!/bin/bash

dwmblocks &

mailsync &
chk.packages.sh &

#compton -b
picom -b

fcitx5 &

~/my.scripts/setWallpaper.sh &

