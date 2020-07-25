#!/bin/sh

# Prints all batteries, their percentage remaining and an emoji corresponding
# to charge status (🔌 for plugged up, 🔋 for discharging on battery, etc.).

# Loop through all attached batteries.
for battery in /sys/class/power_supply/BAT?
do
	# Get its remaining capacity and charge status.
	capacity=$(cat "$battery"/capacity 2>/dev/null) || break
	status=$(sed "s/[Dd]ischarging/🔋/;s/[Nn]ot charging/🛑/;s/[Cc]harging/🔌/;s/[Uu]nknown/❓/;s/[Ff]ull/😀/" "$battery"/status)

	# If it is discharging and 25% or less, we will add a ❗ as a warning.
	 [ "$capacity" -le 25 ] && [ "$status" = "🔋" ] && status="❗"

	printf "%s:%s%%" "$status" "$capacity%"
done | sed 's/ *$//'
