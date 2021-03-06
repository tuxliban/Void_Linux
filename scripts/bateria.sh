#!/bin/sh

## Script de notificación para la bateria

restante=$(acpi | awk '{print $5}')
#estado=$(acpi | awk '{print $3}' | cut -d"," -f1)
estado=$(cat /sys/class/power_supply/BAT1/capacity_level)
porcentaje=$(cat /sys/class/power_supply/BAT1/capacity)

# Si el porcentaje de bateria es menor o igual a 30 y mayor a 25, mostrar el mensaje
if [ "$porcentaje" -le 30 ] && [ "$porcentaje" -gt 25 ]; then
	notify-send --urgency=normal -i $HOME/.icons/status/battery_low.png "Conectar el cargador" "Tiempo de bateria disponible $restante" 
fi

# Si el porcentaje de bateria es igual o menor a 25, mostrar el siguiente mensaje y...
# 1. Si se conecta el cargador no suspender el equipo
# 2. Si no se conecta el cargador suspender el equipo
if [  "$porcentaje" -le 25 ]; then
	notify-send --urgency=critical -i $HOME/.icons/status/battery_critical.png "Batería crítica" "Activando modo de ahorro de \nenergia en 30 segundos..."
	sleep 30 &&
       if [ "$estado" = "Charging" ]; then
	       notify-send --urgency=normal "Cargando bateria"
	else
	doas zzz
       fi
fi

# Si el porcentaje de la bateria es igual al 100% mostrar el siguiente mensaje
#if [ "$porcentaje" -eq "100" ]; then
#	notify-send --urgency=normal -i $HOME/.icons/status/battery_charged.png "Bateria cargada" "Puede desconectar el cargador"
#fi
