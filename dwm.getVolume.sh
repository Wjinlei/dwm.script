#!/bin/sh

# Prints the current volume or 🔇 if muted.

case $BLOCK_BUTTON in
	1) setsid -f "$TERMINAL" -e pulsemixer ;;
	2) pamixer -t; pkill -RTMIN+101 dwmblocks ;;
	4) pamixer --allow-boost -i 1;;
	5) pamixer --allow-boost -d 1;;
	3) notify-send "📢 音量模块" "\- 音量调节:🔇,🔈,🔉,🔊
- 左键点击打开pulsemixer
- 中键点击静音.
- 滑轮上下调整音量." ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

get_volume() {
    VOL=$(pamixer --get-volume)
    MUTED=$(pamixer --get-mute)
    if [ "$MUTED" = true ]; then
        printf "🔇:%s%%" "$VOL"
        return
    fi

    if [ "$VOL" -eq 0 ]; then
        printf "🔇:%s%%" "$VOL"
    elif [ "$VOL" -gt 00 ] && [ "$VOL" -le 30 ]; then
        printf "🔈:%s%%" "$VOL"
    elif [ "$VOL" -gt 30 ] && [ "$VOL" -le 70 ]; then
        printf "🔉:%s%%" "$VOL"
    else
        printf "🔊:%s%%" "$VOL"
    fi
}

get_volume
