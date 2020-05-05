#!/bin/bash

#compton -b
picom -b

#fcitx &

ibus-daemon -x -d

albert &

~/my.scripts/setwallpaper.sh &
