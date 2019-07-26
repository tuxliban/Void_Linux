#!/bin/sh

lista=$(xbps-install -nuM | awk '{print $1}' | head -6 )

if ! updates=$(xbps-install -nuM | wc -l); then
	updates=0
fi

if [ "$updates" -eq 1 ]; then
	notify-send -i "$HOME/.icons/status/package-upgrade.png" "Hay una actualización disponible:" "$lista"
	echo "$updates"
fi

if [ "$updates" -le 5 ]; then
	notify-send -i "$HOME/.icons/status/package-upgrade.png" "Hay $updates actualizaciones disponibles:" "$lista"
	echo "$updates"

elif [ "$updates" -ge 6 ]; then
	notify-send -i "$HOME/.icons/status/package-upgrade.png" "Hay $updates actualizaciones disponibles:" "$lista \n ..."
	echo "$updates"

else
	echo ""
fi

