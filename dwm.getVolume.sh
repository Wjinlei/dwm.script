#!/bin/sh

# Prints the current volume or 🔇 if muted.

vol=$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')

if [ "$vol" -eq "0" ]; then
    icon="🔇"
elif [ "$vol" -gt "70" ]; then
	icon="🔊"
elif [ "$vol" -lt "30" ]; then
	icon="🔈"
else
	icon="🔉"
fi

echo "$icon:$vol%"
