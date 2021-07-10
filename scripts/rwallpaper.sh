#!/bin/sh

if [ ! -f /usr/bin/bgs ]; then
	printf '%b' "\033[31;5m[ERROR] No se encontró instalado el paquete 'bgs', instálelo\033[0m\n"
	exit 0;
fi

dir_wall=$HOME/Datos/Imagenes/Wallpapers
wallpaper=$(ls "$dir_wall" | grep -E '(jpeg|jpg|png)$' | sort -R | tail -1)
cd "$dir_wall" && bgs  -z "$wallpaper"
