#!/bin/sh

case $BLOCK_BUTTON in
	1) notify-send "🧠 Memory hogs" "$(ps axch -o cmd:15,%mem --sort=-%mem | head)" ;;
	2) setsid -f "$TERMINAL" -e htop ;;
	3) notify-send "🧠 内存模块" "\- 查看内存使用率和总量.
- 左键点击查看内存占用情况.
- 中键点击打开htop." ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

free --mebi | sed -n '2{p;q}' | awk '{printf ("🧠:%2.2fGiB/%2.2fGiB\n", ( $3 / 1024), ($2 / 1024))}'
