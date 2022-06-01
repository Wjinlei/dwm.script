#!/bin/bash

fcitx5 -d
dwmblocks &
picom -b

./wallpaper.sh &
./chkUpdate &
./chkVol & # Ensure show vol
