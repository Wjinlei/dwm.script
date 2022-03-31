#!/bin/bash

fcitx5 -d
dwmblocks &
picom -b
#mailsync &

./setWallpaper.sh &
./chk.packages.sh &

