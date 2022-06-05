#!/bin/sh

# 显示 wifi 📶 和百分比强度，如果没有则显示 📡.
# 如果连接到以太网则显示 🌐 如果没有则显示 ❎.
# 如果 vpn 连接处于活动状态，则显示 🔒

case $BUTTON in
	1) "$TERMINAL" -e nmtui; pkill -RTMIN+12 dwmblocks ;;
	3) notify-send "🌐 网络模块" "\- 点击连接
❌: wifi禁用
📡: 没有wifi连接
📶: wifi已连接
❎: 没有以太网连接
🔒: vpn 处于活动状态
" ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

if grep -xq 'up' /sys/class/net/w*/operstate 2>/dev/null ; then
	wifiicon="$(awk '/^\s*w/ { print "📶", int($3 * 100 / 70) "% " }' /proc/net/wireless)"
elif grep -xq 'down' /sys/class/net/w*/operstate 2>/dev/null ; then
	grep -xq '0x1003' /sys/class/net/w*/flags && wifiicon="📡 " || wifiicon="❌ "
fi

printf "%s%s%s\n" "$wifiicon" "$(sed "s/down/❎/;s/up/Eth/" /sys/class/net/e*/operstate 2>/dev/null)" "$(sed "s/.*/🔒/" /sys/class/net/tun*/operstate 2>/dev/null)"
