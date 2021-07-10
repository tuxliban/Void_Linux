#!/bin/sh

/bin/xbps-install -nuM 1>/tmp/updates 2>/tmp/error

updates="$(wc -l < /tmp/updates)"
broken="$(grep broken /tmp/error | wc -l)"
pkg="$(awk '{print $1" ---> "$2}' /tmp/updates)"
pkgs="$(awk '{print $1}' /tmp/updates)"
unresolved="$(grep broken /tmp/error | awk '{ print $1" "$5 }')"
xx=$(printf "==============================")

if [ "$broken" = 0 ] && [ "$updates" -ge 1 ]; then
	~/Datos/Git/scripts/varios/dunst_sound.sh
	if [ "$updates" -eq 1 ]; then
		herbe "ACTUALIZACIÓN DISPONIBLE:" "$xx $pkg"
	elif [ "$updates" -gt 1 ]; then
		herbe "ACTUALIZACIONES DISPONIBLES: $updates" "$xx $pkgs"
	else
		echo ""
	fi
fi

if [ "$broken" -ge 1 ]; then
	herbe "HAY PAQUETES ROTOS:" "$xx" "$(cut -d " " -f 1,5 /tmp/error)"
#	herbe "HAY PAQUETES ROTOS:" "$xx" "$unresolved"
fi
