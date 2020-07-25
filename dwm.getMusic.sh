#!/bin/sh

filter() { mpc | sed "/^volume:/d;s/\\&/&amp;/g;s/\\[paused\\].*/⏸/g;/\\[playing\\].*/d" | paste -sd ' ';}

filter

pidof -x dwm.getMpd.sh >/dev/null 2>&1 || dwm.getMpd.sh >/dev/null 2>&1 &
