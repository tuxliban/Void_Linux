#!/bin/sh

lista=$(xbps-install -nu | awk '{print $1}')

if ! updates=$(xbps-install -nu | wc -l); then
	updates=0
fi

if [ "$updates" -gt 0 ]; then
	notify-send -i "/home/skynet/.config/polybar/scripts/updates.png" "Actualizaciones disponibles:" "$lista"
	echo "$updates"
else
	echo ""
fi
