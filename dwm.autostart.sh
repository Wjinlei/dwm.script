#!/bin/bash

dwmblocks &
picom -b
#mailsync &
#fcitx &

./setWallpaper.sh &
./chk.packages.sh &

