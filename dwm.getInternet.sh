#!/bin/sh

# Show wifi 📶 and percent strength or 📡 if none.
# Show 🌐 if connected to ethernet or ❎ if none.

GetIp(){
    local ipv4=$( ip addr | egrep -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | \
    egrep -v "^192\.168|^172\.1[6-9]\.|^172\.2[0-9]\.|^172\.3[0-2]\.|^10\.|^127\.|^255\.|^0\." | head -n 1 )
    [ -z "${ipv4}" ] && ipv4=$( wget -qO- -t1 -T2 ip.hws.com/getip.asp )
    if [ "${ipv4}" == "" ]; then
        ipv4='127.0.0.1'
    fi
    printf -- "%s" "${ipv4}"
}

case "$(cat /sys/class/net/w*/operstate 2>/dev/null)" in
	down) wifiicon="📡" ;;
	up) wifiicon="$(awk '/^\s*w/ { print "📶" }' /proc/net/wireless)" ;;
esac

printf "Ethernet:%s,Wifi:%s,IP:%s\n" \
    "$(sed "s/down/❎/;s/up/🌐/" /sys/class/net/e*/operstate 2>/dev/null)" \
    "$wifiicon" \
    "$(GetIp)"
