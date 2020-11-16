#!/bin/bash

dwmblocks &

mailsync &
chk.packages.sh &

#compton -b
picom -b

fcitx5 &

albert &

~/my.scripts/setWallpaper.sh &

