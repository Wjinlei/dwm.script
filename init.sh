#!/bin/bash

fcitx5 -d
dwmblocks &
picom -b

./wallpaper.sh &
./chkUpdate &

# Loop chkMailbox
while :
do
    ./chkMailbox &
    sleep 300
done
