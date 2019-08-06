#!/bin/bash

# V0.3
# Script para descargar una lista personalizada con direcciones para bloquearlas 
# a través del fichero hosts

# Para automatizar este proceso se recomienda crear una tarea (crontab) y ajustarla a las necesidades del usuario (diario, semanal
# mensual, etc)

# Realizar copia de seguridad del fichero hosts previo
echo -e "\e[34mHaciendo copia de seguridad del fichero hosts...\e[0m"; sudo cp /etc/hosts /etc/hosts.bak &&  #sleep 1s; echo -e "\e[32mOK\e[0m"

# Descargar lista mas reciente del repositorio y copiarlo al fichero hosts
echo -e "\e[93mDescargando y copiando lista actualizada para fichero hosts...\e[0m"; sudo wget -O /etc/hosts https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts && #sleep 1s; echo -e "\e[32mOK\e[0m" 

# Agregando lista personalizada de páginas al fichero hosts
echo -e "\e[31mAgregando parche de lista personalizada al fichero hosts...\e[0m"; cat /home/skynet/Datos/Git_Hub/Void_Linux/otros/parche >> sudo /etc/hosts; sleep 2; sudo sv restart NetworkManager &&

# Notificacion de actualizacion del fichero
echo -e "\e[96mTarea finalizada. Fichero host actualizado\e[0m"; notify-send -t 5000 -i /home/skynet/.icons/status/hosts_update.png "Tarea finalizada" 'Fichero hosts actulizado'
