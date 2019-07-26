#!/bin/bash

## Script de notificación para la bateria

restante=$(acpi | awk '{print $5}')
estado=$(acpi | awk '{print $3}' | cut -d"," -f1)
porcentaje=$(cat /sys/class/power_supply/BAT1/capacity)

# Si el porcentaje de bateria es menor o igual a 20 y mayor a 15, mostrar el mensaje
if [ "$porcentaje" -le 20 ] && [ "$porcentaje" -gt 15 ]; then
	notify-send --urgency=normal -i $HOME/.icons/status/battery_low.png "Conectar el cargador" "Tiempo de bateria disponible $restante" 
fi

# Si el porcentaje de bateria es igual o menor a 15, mostrar el mensaje y suspender el equipo
if [  "$porcentaje" -le 15 ]; then
	notify-send --urgency=critical -i $HOME/.icons/status/battery_critical.png "Activando modo de ahorro de energia en 30 segundos..."
	sleep 30 && sudo zzz
fi

# Si ninguna de las condiciones anteriores se cumple, mientras el estado de la bateria sea igual a "Cargando"
if [ "$porcentaje" -eq '100' ]; then
	notify-send --urgency=normal -i $HOME/.icons/status/battery_charged.png "Bateria cargada" "Puede desconectar el cargador"
fi
