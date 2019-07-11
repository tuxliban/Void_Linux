#!/bin/sh

lista=$(xbps-install -nuM | awk '{print $1}' | head -6 )

if ! updates=$(xbps-install -nuM | wc -l); then
	updates=0
fi

if [ "$updates" -gt 0 ]; then
	notify-send -i "/home/skynet/.config/polybar/scripts/updates.png" "Actualizaciones disponibles:" "$lista \n ..."
	echo "$updates"
else
	echo ""
fi
