#!/bin/sh

porcentaje=$(cat /sys/class/power_supply/BAT1/capacity)
restante=$(acpi | awk '{print $5}')
estado=$(acpi | awk '{print $3}' | cut -d"," -f1)

# Comprobar si el porcentaje de la bateria es mayor a 20%
if [ "$porcentaje" -gt 20 ]; then
	echo ""

# En caso de que el porcentaje de batería sea igual a 20%, mostrar el siguiente mensaje
elif
	[ "$porcentaje" -eq 20 ]; then
	notify-send --urgency=normal "Conectar cargador" "Tiempo de bateria disponible $restante"

# En caso de que el porcentaje sea menor o igual al 15% y la bateria se está descargando, poner en modo "Suspensión" el equipo
else
	if
#		[ "$porccentaje" -le 15 && 'Discharging' == "$estado" ]; then
		[ "$porcentaje" -le 15 ]; then
		notify-send --urgency=critical "Equipo entrará en modo 'Suspender' en 20 segundos..."
		sleep 20 && sudo zzz
	else
		[ "$estado" = 'Charging' ]
		notify-send --urgency=normal "Cargando bateria..."
	fi
fi
