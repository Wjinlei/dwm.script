#!/bin/bash

#compton -b
picom -b

#fcitx &

ibus-daemon -x -d

albert &

#dwm status
dwmblocks &

~/my.scripts/setWallpaper.sh &
