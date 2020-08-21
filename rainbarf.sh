#!/bin/sh
tmpstr=$(rainbarf --notmux --width 10)
result=$(echo ${tmpstr} | cut -d'[' -f2 | cut -d'm' -f2)
printf "$result"

