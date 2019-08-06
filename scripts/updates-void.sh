#!/bin/sh

lista=$(xbps-install -nuM | awk '{print $1}' )
updates=$(xbps-install -nuM | wc -l)

if [ "$updates" -eq 1 ]; then
	notify-send -i "$HOME/.icons/status/package-upgrade.png" "Hay una actualización disponible:" "$lista"
	echo "$updates"
elif [ "$updates" -le 5 ] && [ "$updates" -ge 2 ]; then
	notify-send -i "$HOME/.icons/status/package-upgrade.png" "Hay $updates actualizaciones disponibles:" "$lista"
	echo "$updates"
elif [ "$updates" -ge 6 ]; then
	notify-send -i "$HOME/.icons/status/package-upgrade.png" "Hay $updates actualizaciones disponibles:" "$lista \n..."
	echo "$updates"
else
	if [ "$updates" -eq 0 ]; then
		echo ""
	fi
fi

sleep 180;
if [ "$updates" -eq 0 ]; then
	echo ""
fi

