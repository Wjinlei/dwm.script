#!/bin/sh

# Shows the current moon phase.

case $BLOCK_BUTTON in
	3) notify-send "🌜 月象模块" "显示当前月象.
- 🌑: New
- 🌒: Waxing Crescent
- 🌓: First Quarter
- 🌔: Waxing Gibbous
- 🌕: Full
- 🌖: Waning Gibbous
- 🌗: Last Quarter
- 🌘: Waning Crescent" ;;
	6) "$TERMINAL" -e "$EDITOR" "$0" ;;
esac

moonfile="${XDG_DATA_HOME:-$HOME/.local/share}/moonphase"

[ "$(stat -c %y "$moonfile" 2>/dev/null | cut -d' ' -f1)" = "$(date '+%Y-%m-%d')" ] ||
	{ curl -sf "wttr.in/?format=%m" > "$moonfile" || exit 1 ;}

icon="$(cat "$moonfile")"

case "$icon" in
	🌑) name="New" ;;
	🌒) name="Waxing Crescent" ;;
	🌓) name="First Quarter" ;;
	🌔) name="Waxing Gibbous" ;;
	🌕) name="Full" ;;
	🌖) name="Waning Gibbous" ;;
	🌗) name="Last Quarter" ;;
	🌘) name="Waning Crescent" ;;
	*) exit 1 ;;
esac

echo "${icon-?}"

