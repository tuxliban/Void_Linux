#!/bin/sh

# V0.2.1
# Script para descargar una lista personalizada con direcciones para bloquearlas 
# a través del fichero hosts

# Para automatizar este proceso se recomienda crear una tarea (crontab) y ajustarla a las necesidades del usuario (diario, semanal
# mensual, etc)

# Realizar copia de seguridad del fichero hosts en caso de no existir
if [ ! -f /etc/hosts.bak ]; then
	printf '%b' "\033[32;1mCreando copia de seguridad del fichero hosts...\033[0m\n";
	doas cp /etc/hosts /etc/hosts.bak && sleep 1s; printf '%b' "\033[33;1mCopia finalizada\033[0m\n"
else
	printf '%b' "\033[35;5mYa existe copia de seguridad del fichero hosts\033[0m\n"
fi

# Descargar actualizaciones  mas reciente del repositorio y copiarlo al fichero hosts
if [ ! -w /etc/hosts ]; then
	doas chmod o+w /etc/hosts && sleep 1s;
	printf '%b' "\033[32;1mDescargando y copiando lista actualizada para fichero hosts...\033[0m\n" &&
	wget -O /etc/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts && sleep 1s;
else
	printf '%b' "\033[32;1mDescargando y copiando lista actualizada para fichero hosts...\033[0m\n" &&
	wget -O /etc/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts && sleep 1s;
#	wget -O /etc/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts && sleep 1s;
fi

# Agregar lista personalizada de páginas al fichero hosts
printf '%b' "\033[32;1mAgregando parche de la lista personalizada al fichero hosts...\033[0m\n";
cat /home/skynet/Datos/Git/archivos_diversos/parche >> /etc/hosts; sleep 2; 
printf '%b' "\033[33;1mParche aplicado\033[0m\n";

~/Datos/Git/scripts/varios/dunst_sound.sh &&

# Notificacion de actualizacion del fichero
printf '%b' "\033[36;1mFichero hosts actualizado.\nTarea finalizada.\033[0m\n";
#notify-send -t 5000 -i /home/skynet/.icons/status/hosts_update.png "Tarea finalizada" 'Fichero hosts actualizado'
#printf 'IMG:/home/skynet/Datos/Git_Hub/Void_Linux/otros/icons/status/hosts_update.png\tTarea finalizada\tFichero hosts actualizado\n' > $XNOTIFY_FIFO
herbe "Lista de fichero hosts actualizado"
