#!/bin/sh

# Dependencias: udevil

ayuda() {
	cat << EOF
usb.sh v1.0 (21/12/2020)

Modo de uso:

usb.sh [-muUh]

Script para montar y desmontar dispositivos a través de devmon y udevil.

Opciones:
	-m	Montar dispositivo extraible
	-u	Desmontar dispositivo extraible
	-U	Desmontar último pendrive insertado
	-h	Mostrar ayuda


EOF
}

while :;
do
	case $1 in
		-m)
			# Montar dispositivo extraible
			devmon --sync --exec-on-drive "herbe 'DISPOSITIVO USB' 'Listo para utilizarse'" &
			break
			;;
		-u)
			# Desmontar dispositivo
			devmon --unmount /media/$USER/* && sleep 2; herbe "DISPOSITIVO USB" "Puede retirarlo con seguridad"
			pkill -9 devmon && pkill -9 udevil
			break
			;;
		-U)
			# Desmontar último pendrive insertado
			devmon --unmount-recent && sleep 2; herbe "DISPOSITIVO USB" "Puede retirarlo con seguridad"
			break
			;;
		-h)
			ayuda
			break
			;;
		*)
			printf '%b' "\033[31;5mOpción inválida\033[0m\n"
			printf '%b' "\033[37;2mOpciones disponibles:\033[0m\n"
			printf '%b' "\033[32;1m-m:   \033[36;2mMontar dispositivo extraible\033[0m\\033[0m\n"
			printf '%b' "\033[32;1m-u:   \033[36;2mDesmontar dispositivo\033[0m\\033[0m\n"
			printf '%b' "\033[32;1m-U:   \033[36;2mDesmontar último pendrive insertado\033[0m\\033[0m\n"
			printf '%b' "\033[32;1m-h:   \033[36;2mMostrar ayuda\033[0m\\033[0m\n\n"
			return
			;;
	esac
done

if [ ! -f /usr/bin/udevil ]; then
	printf '%b' "\033[31;5m[ERROR] No se encontró instalado el paquete 'udevil'\033[0m\n"
	exit 0;
else
	exit 0;
fi
