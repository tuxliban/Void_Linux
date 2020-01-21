#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#------------------------------------------------------ Prompt -----------------------------------------------------------------------

# Prompt predeterminado
#PS1='[\u@\h \W]\$ '

#Prompt personalizado
PS1='\[\e[1;37m\] > \d \t \n \[\e[1;32m\]\u\[\e[m\]@\[\e[1;34m\]\h\[\e[m\] \[\e[1;33m\]\w\[\e[m\] \[\e[0;31m\]\$\[\e[m\]\[\e[0;37m\] '

#----------------------------------------------------- Autologin en TTY1 ---------------------------------------------------------------

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
exec startx
fi

#----------------------------------------------------------------------------------------------------------------------------------
# Variables de entotno
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'              # Iniciar en negrita
export LESS_TERMCAP_md=$'\E[1;36m'              # Iniciar parpadeando
export LESS_TERMCAP_me=$'\E[0m'                 # Restablecer en negrita/parpadear
export LESS_TERMCAP_so=$'\E[01;44;33m'          # Comenzar video inverso
export LESS_TERMCAP_se=$'\E[0m'                 # Restablecer video inverso
export LESS_TERMCAP_us=$'\E[1;32m'              # Comenzar a subrayar
export LESS_TERMCAP_ue=$'\E[0m'                 # Restablecer subrayado

man() {
      LESS_TERMCAP_md=$'\e[01;31m' \
      LESS_TERMCAP_me=$'\e[0m' \
      LESS_TERMCAP_se=$'\e[0m' \
      LESS_TERMCAP_so=$'\e[01;44;33m' \
      LESS_TERMCAP_ue=$'\e[0m' \
      LESS_TERMCAP_us=$'\e[01;32m' \
      command man "$@"
}

export PAGER="less"                             # Paginador predeterminado
export EDITOR="vim"                             # Editor de texto predeterminado
export TERM="xterm"                             # Emulador de consola predeterminado
#export BROWSER="firefox"                        # Navegador web predeterminado
#export BROWSER="chromium"                        # Navegador web predeterminado
export READER="zathura"                         # Lector PDF predeterminado
export IMAGEVIEWER="feh"			# Visor de imanenes predeterminado

export PATH="/usr/lib/ccache/bin/:$PATH"

# Variables de entorno para nnn
export NNN_OPENER=xdg-open
#export NNN_FALLBACK_OPENER=xdg-open
export NNN_BMS='d:~/Datos/Dropbox/Tareas;t:~/Datos/Telegram;D:~/Descargas;s:~/Datos/Capturas;p:~/.local/share/Trash/files;P:~/Datos/.Trash-1000/files'   # Marcadores
export NNN_PLUG="i:sxiv"                        # Plugins
export NNN_USE_EDITOR=1                         # Usar el $EDITOR para abrir archivos de texto
export NNN_CONTEXT_COLORS="2631"                # Usar un color distinto para cada contexto (pestañas)
export NNN_TRASH=1                              # Mover archivos a papelera en lugar de eliminar definitivamente
export NNN_READER="zathura"

#---------------------------------------------------- Alias para XBPS -------------------------------------------------------------

alias xi='doas xbps-install -S'
alias in='doas xbps-install'					# Instalación sencilla
alias xc='doas xbps-remove -Ov'					# Eliminar caché de versiones anteriores de paquetes
alias xo='doas xbps-remove -ov'					# Eliminar paquetes huerfanos
alias update='doas xbps-install -Su'				# Actualizar sistema
alias xr='doas xbps-remove -R'					# Eliminar paquetes con sus dependencias
alias hold='doas xbps-pkgdb -m hold'				# Congelar paquetes
alias unhold='doas xbps-pkgdb -m unhold'			# Descongelar paquetes
alias pkg='echo "Total de paquetes instalados:"\ && xbps-query -l | wc -l && echo "Paquetes instalados manualmente:"\ && xbps-query -m | wc -l'	# Mostrar total de paquetes instalados
alias manual='xbps-query -m'					# Mostrar lista de paquetes instalados manualmente

#---------------------------------------------------- Otros Alias personalizados -------------------------------------------------------------

alias ls='ls -lhX --color=auto --group-directories-first'	# Agregar color a la salida de "ls" usando el formato de listado largo y poniendo en primer lugar los directorios
alias grep='grep --color=auto'					# Agregar color a la salida de "grep"
alias top='top -d 1 -u skynet'					# Mostrar procesos del usuario
#alias layes='setxkbmap -layout es'				# Teclado español
#alias keyoff='xinput set-int-prop 11 "Device Enabled" 8 0'	# Desactivar teclado interno
#alias keyon='xinput set-int-prop 12 "Device Enabled" 8 1'	# Activar teclado interno
alias del='trash-put'						# Enviar archivos a papelera
alias empty='trash-empty'						# Vaciar papelera de reciclaje
alias du='du -bsh'						# Mostrar tamaño directorios
alias cp='rsync -rh --progress'					# Copiar archivos y directorios con informacion de transferencia
alias Sync='rsync -Prtvu --delete'				# Sincronización de directorios
alias dropbox='rclonesync.py Dropbox: /home/skynet/Datos/Dropbox --check-access --rclone-args -P --checkers=16 --transfers=8 --checksum'	# Sync manual de Dropbox
alias find='find . -name'					# Buscar FIND
alias zombie='ps -el | grep 'Z''				# Mostrar procesos zombies
alias net='doas sv restart dhcpcd'				# Reiniciar servicio de conexión wifi
alias gvideo='ffmpeg -video_size 1366x768 -framerate 25 -f x11grab -i :0.0 -f pulse -ac 2 -i 1 -c:a libvorbis -b:a 128k video.mkv -async 1 -vsync 1'	# Grabar video
alias 7z='7z -t7z -m0=lzma2 -mx=9 -mfb=64 -md=64m -ms=on'	# Maximo nivel de compresion de archivos
alias diff='diff -y --color=auto'				# Comparar cambios en archivos
alias pg='ping -c 2 8.8.8.8'
alias yt='youtube-dl -x --audio-format mp3'			# Descargar audio youtube

DEVICE=$(iw dev | grep Interface | cut -d " " -f2)
alias potencia='doas iw dev $DEVICE scan | egrep "SSID|signal|\(on"'
alias nnn='nnn -d'

# Sincronización nube Dropbox
alias dlocal='rclone -P sync --checkers=16 --transfers=8 --checksum /home/skynet/Datos/Dropbox Dropbox:'
alias dremote='rclone -P sync --checkers=16 --transfers=8 --checksum Dropbox: /home/skynet/Datos/Dropbox'

# Sincronización nube Box
alias bxlocal='rclone -v -P sync /home/skynet/Datos/box_cloud Box: '
alias bxremote='rclone -v -P sync Box: /home/skynet/Datos/box_cloud'

alias un='devmon --unmount ~/usb/*; notify-send -t 8000 -i ~/.icons/umount.png "Dispositivo %f" "Puede retirarlo con seguridad" '
