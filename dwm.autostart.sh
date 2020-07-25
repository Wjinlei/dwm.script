#!/bin/bash

mpd &

dunst &

#compton -b
picom -b

#fcitx &

ibus-daemon -x -d

albert &

dwmblocks &

~/my.scripts/setWallpaper.sh &
