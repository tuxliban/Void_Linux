#!/bin/sh
# Alternar estado de conexión wifi

read -r state < /sys/class/net/wlan0/operstate

case "$1" in
	--toggle)
		if [ "$(pgrep wpa_supplicant)" ]; then
			doas pkill -f wpa_supplicant
			herbe "Wifi desactivado"
		else
			if [ "$state" = "down" ]; then
				doas wpa_supplicant -B -D wext -c /etc/wpa_supplicant/wpa_supplicant.conf -i wlan0
				sleep 2; herbe "Wifi activado"
			fi
		fi
		;;
	*)
		if [ "$(pgrep wpa_supplicant)" ]; then
			herbe "Wifi activado"
		else
			herbe "Wifi desactivado"
		fi
		;;
esac

