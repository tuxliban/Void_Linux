#!/bin/sh

if ! updates=$(xbps-install -Su --dry-run 2> /dev/null | wc -l); then
	updates=0
fi

if [ "$updates" -gt 0 ]; then
	notify-send -i "/home/skynet/.config/polybar/scripts/updates.png" "Hay $updates actualizaciones disponibles"
	echo "%{F#ff8a00} $updates"
else
	echo ""
fi
