#!/bin/sh

# Prints the current volume or 🔇 if muted.

case $BLOCK_BUTTON in
	1) setsid -f "$TERMINAL" -e pulsemixer ;;
	2) pamixer -t ;;
	4) pamixer --allow-boost -i 1 ;;
	5) pamixer --allow-boost -d 1 ;;
	3) notify-send "📢 音量模块" "\- 音量调节:🔇,🔈,🔉,🔊
- 左键点击打开pulsemixer
- 中键点击静音.
- 滑轮上下调整音量." ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

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
