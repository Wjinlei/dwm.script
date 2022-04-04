#!/bin/sh

# Prints all batteries, their percentage remaining and an emoji corresponding
# to charge status (🔌 for plugged up, 🔋 for discharging on battery, etc.).

case $BLOCK_BUTTON in
	3) notify-send "🔋 电源模块" "
🛑: 未找到电池
🔌: 充电中
🔋: 已充满" ;;
    #4) xbacklight -inc 10 ;;
    #5) xbacklight -dec 10 ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

dwm_battery() {
    # Change BAT1 to whatever your battery is identified as. Typically BAT0 or BAT1
    CHARGE=$(cat /sys/class/power_supply/BAT0/capacity)
    STATUS=$(cat /sys/class/power_supply/BAT0/status)

    if [ "$STATUS" = "Charging" ]; then
        printf "🔌%s%% %s" "$CHARGE" "$STATUS"
    elif [ "$STATUS" = "Not Charging" ]; then
        printf "🛑%s%% %s" "$CHARGE" "$STATUS"
    else
        printf "🔋%s%% %s" "$CHARGE" "$STATUS"
    fi

    [ "$CHARGE" -le 25 ] && cvlc --play-and-exit ./low.power.mp3
    [ "$CHARGE" -le  5 ] && poweroff
}

dwm_battery
