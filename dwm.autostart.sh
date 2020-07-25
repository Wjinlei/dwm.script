#!/bin/bash

dwm.getMpd.sh &

#compton -b
picom -b

#fcitx &

ibus-daemon -x -d

albert &

dwmblocks &

~/my.scripts/setWallpaper.sh &
