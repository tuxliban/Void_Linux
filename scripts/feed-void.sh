#!/bin/sh

if [ -f /usr/bin/rsstail ]; then

  feed="https://github.com/void-linux/void-packages/commits/master.atom"
  updatedpkgs="$(rsstail -1 -u ${feed} | grep -e "Update" -e "update" | wc -l)"
  newpkgs="$(rsstail -1 -u ${feed} | grep -e "New" -e "new" | wc -l)"
  sysupdates="$(xbps-install -Mnu | wc -l)"

# Notificación emergente
  notify-send --urgency=critical """CAMBIOS EN EL REPOSITORIO:
  Paquetes actualizados: ${updatedpkgs}
  Nuevos paquetes: ${newpkgs}

ACTUALIZACIONES DE SISTEMA:
  Disponible actualmente: ${sysupdates}"""

# Notificación en consola
printf '%b' "\033[32;1mCAMBIOS EN EL REPOSITORIO\033[0m\n"
printf '%b' "\033[34;1m	Paquetes actualizados: \033[0m"${updatedpkgs}
printf "\n"
printf '%b' "\033[34;1m	Nuevos paquetes: \033[0m"${newpkgs}
printf "\n"
printf "\n"
printf '%b' "\033[32;1mACTUALIZACIONES DE SISTEMA:\033[0m\n"
printf '%b' "\033[33;5m	Disponible actualmente: \033[0m"${sysupdates}
printf "\n"


# En caso de existir errores
elif [ ! -f /usr/bin/rsstail ];then
	printf '%b' "\033[31;5m[ERROR] Este  script requiere del paquete: 'rsstail'\033[0m\n"
	exit 0;
else
	printf '%b' "\033[33;5m\033[33;1mAlgo salió mal: verificar /usr/bin/rsstail\033[0m\033[0m\n"
	exit 0;
fi
