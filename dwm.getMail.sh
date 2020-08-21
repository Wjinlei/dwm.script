#!/bin/sh

# Displays number of unread mail and an loading icon if updating.
# When clicked, brings up `neomutt`.

case $BLOCK_BUTTON in
	1) setsid -f "$TERMINAL" -e neomutt ;;
	2) setsid -f mailsync >/dev/null ;;
	3) notify-send "📬 邮件模块" "\- 查看未读邮件
- 图标 🔃 表示邮件正在同步中...
- 左键点击打开neomutt
- 中键点击立即同步邮件" ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

unread="$(find "${XDG_DATA_HOME:-$HOME/.local/share}"/mail/*/[Ii][Nn][Bb][Oo][Xx]/new/* -type f 2>/dev/null | wc -l 2>/dev/null)"

pidof mbsync >/dev/null 2>&1 && icon="Syncing:🔃,"

[ "$unread" != "0" ] && cvlc --play-and-exit ./email.recv.mp3

[ "$unread"  = "0" ] && [ "$icon" = "" ] || echo "$icon📬$unread"
