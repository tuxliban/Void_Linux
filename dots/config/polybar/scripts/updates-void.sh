#!/bin/sh

if ! updates=$(sudo xbps-install -Su --dry-run 2> /dev/null | wc -l); then
	updates=0
fi

if [ "$updates" -gt 0 ]; then
	notify-send -i "/home/skynet/.config/polybar/scripts/updates.png" "Hay $updates actualizaciones disponibles"
	echo "$updates"
else
	echo ""
fi
