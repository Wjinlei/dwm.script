#!/bin/bash

dwmblocks &

chk.packages.sh &

#compton -b
picom -b

#fcitx &

ibus-daemon -x -d

albert &

~/my.scripts/setWallpaper.sh &

