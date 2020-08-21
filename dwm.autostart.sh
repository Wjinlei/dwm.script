#!/bin/bash

dwmblocks &

mailsync &
chk.packages.sh &

#compton -b
picom -b

#fcitx &

ibus-daemon -x -d

albert &

~/my.scripts/setWallpaper.sh &

