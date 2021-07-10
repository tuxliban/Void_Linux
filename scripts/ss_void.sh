#!/bin/sh
# v1.0
#Script escrito en POSIX para realizar capturas de pantalla

# Dependencias: scrot, xclip, herbe

ayuda(){ 
cat << EOF
ss_void.sh v1.0 (4/10/2020)
Modo de uso:

ss_void.sh [-PSgsh]

Script minimalista escrito en POSIX con cuatro opciones para realizar capturas de pantalla.

Opciones:
	-P:	Guardar captura de pantalla en portapapeles
	-S:	Guardar captura de pantalla del área seleccionada en el portapapeles
	-g:	Guardar captura de pantalla en disco duro
	-s:	Guardar captura de pantalla de área seleccionada en disco duro
	-h:	Mostrar ayuda

EOF
}

while :;
do
	case $1 in
		-P)
			# Guardar captura de pantalla en el portapapeles
			scrot /tmp/'%F_%T.png' -e 'xclip -selection c -t image/png < $f'
			break
			;;
		-S)
			# Guardar captura de pantalla de área seleccionada en el portapapeles
			sleep 1
			scrot -s /tmp/'%F_%T.png' -e 'xclip -selection c -t image/png < $f'
			break
			;;
		-g)
			# Guardar captura de pantalla
			scrot -q 100 '%F_%H%M%S_$wx$h.png' -e 'mv $f /home/skynet/Datos/Capturas/'
			sleep 1
			
			# Notificación
			~/Datos/Git/scripts/varios/dunst_sound.sh
			herbe "CAPTURA DE PANTALLA" "Guardando en: ~/Datos/Capturas"
			break
			;;
		-s)
			# Guardar captura de pantalla de área seleccionada
			sleep 1
			scrot -s -q 50 'Select_%F_%H%M%S_$wx$h.png' -e 'mv $f /home/skynet/Datos/Capturas/select'

			# Notificación
			~/Datos/Git/scripts/varios/dunst_sound.sh
			herbe "CAPTURA DE PANTALLA" "Guardando en: ~/Datos/Capturas/select"
			break
			;;
		-h)
			ayuda
			break
			;;
		*)
			printf '%b' "\033[31;5mOpción inválida\033[0m\n"
			printf '%b' "\033[37;2mOpciones disponibles:\033[0m\n"
			printf '%b' "\033[32;1m-P:   \033[36;2mGuardar captura de pantalla en portapapeles\033[0m\\033[0m\n"
			printf '%b' "\033[32;1m-S:   \033[36;2mGuardar captura de pantalla del área seleccionada en el portapapeles\033[0m\\033[0m\n"
			printf '%b' "\033[32;1m-g:   \033[36;2mGuardar captura de pantalla en disco duro\033[0m\\033[0m\n"
			printf '%b' "\033[32;1m-s:   \033[36;2mGuardar captura de pantalla de área seleccionada en disco duro\033[0m\\033[0m\n\n"
			return
			;;
	esac
done

# Si no existe el binario scrot
if [ ! -f /usr/bin/scrot ]; then
	printf '%b' "\033[31;5m[ERROR] No se encontró instalado el paquete 'scrot'\033[0m\n"
	exit 0;

# Si no existe el binario xclip
elif [ ! -f /usr/bin/xclip ]; then
	printf '%b' "\033[31;5m[ERROR] No se encontró instalado el paquete 'xclip'\033[0m\n"
	exit 0;

# Si no existe el binario herbe
elif [ ! -f /usr/bin/herbe ]; then
	printf '%b' "\033[31;5m[ERROR] No se encontró instalado el paquete 'herbe'\033[0m\n"
	exit 0;

else
	exit 0;
fi
