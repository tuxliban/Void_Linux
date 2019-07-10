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

#---------------------------------------------------- Variables de entorno para el comando LESS -------------------------------------
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # Iniciar en negrita
export LESS_TERMCAP_md=$'\E[1;36m'     # Iniciar parpadeando
export LESS_TERMCAP_me=$'\E[0m'        # Restablecer en negrita/parpadear
export LESS_TERMCAP_so=$'\E[01;44;33m' # Comenzar video inverso
export LESS_TERMCAP_se=$'\E[0m'        # Restablecer video inverso
export LESS_TERMCAP_us=$'\E[1;32m'     # Comenzar a subrayar
export LESS_TERMCAP_ue=$'\E[0m'        # Restablecer subrayado

man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

#----------------------------------------------------- Editor de consola predeterminado ------------------------------------------------

#export EDITOR="nano"
export EDITOR="vim"

#----------------------------------------------------- Variable de entorno para ccache -------------------------------------------------

export PATH="/usr/lib/ccache/bin/:$PATH"

#----------------------------------------------------- Autologin en TTY1 ---------------------------------------------------------------

if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
exec startx
fi

#----------------------------------------------------- Múltiples consolas --------------------------------------------------------------
#tmux

#---------------------------------------------------- Alias personalizados -------------------------------------------------------------

#----- Alias para xbps -----

# Instalación sencilla
alias in='sudo xbps-install'

# Instalar paquetes
alias ins='sudo xbps-install -S'

# Eliminar paquetes huerfanos y caché de versiones anteriores de paquetes
alias limpiar='sudo xbps-remove -Oov'

# Actualizar sistema
alias update='sudo xbps-install -Su'

# Eliminar paquetes
alias quitar='sudo xbps-remove -R'

# Congelar paquetes
alias hold='sudo xbps-pkgdb -m hold'

# Descongelar paquetes
alias unhold='sudo xbps-pkgdb -m unhold'

# Buscar paquetes
alias buscar='xbps-query -Rs'

#-------------------------------------------

# Agregar color a la salida de "ls" usando el formato de listado largo y poniendo en primer lugar los directorios
alias ls='ls -lhX --color=auto --group-directories-first'

# Agregar color a la salida de "grep"
alias grep='grep --color=auto'

# Teclado español
alias layes='setxkbmap -layout es'

# Desactivar teclado interno
#alias keyoff='xinput set-int-prop 11 "Device Enabled" 8 0'

# Activar teclado interno
#alias keyon='xinput set-int-prop 12 "Device Enabled" 8 1'

# Navegadores web modo texto
#alias google='links -g www.google.com.mx'
#alias gg='w3m www.google.com'

# Enviar archivos a papelera
alias rm='mv --target-directory ~/.local/share/Trash/files'

# Borrar solicitando confirmación
#alias rm='rm -Irvd'

# Mostrar tamaño directorios
alias how='du -bsh'

# Copiar archivos y directorios con informacion de transferencia
alias cp='rsync -rh --progress'

# Sincronización de directorios
alias Sync='rsync -Prtvu --delete'

# Iniciar Dropbox
alias dropbox='cd ~/.dropbox-dist && ./dropboxd &'

# Buscar FIND
alias Find='find . -name'

# Chroot Archlinux
#alias arch='cd /mnt && sudo /mnt/arch/bin/arch-chroot /mnt/arch && su skynet'

## Mostrar procesos zombies
alias zombie='ps -el | grep 'Z''

## Reiniciar serviciod de conexión wifi
alias wifi='sudo sv restart NetworkManager'

## Grabar video
alias gvideo='ffmpeg -f x11grab -r 30 -s 1366x768 -i :0.0 video.mp4'

## Maximo nivel de compresion de archivos
alias 7z='7z -t7z -m0=lzma2 -mx=9 -mfb=64 -md=64m -ms=on'

## Comparar cambios en archivos
alias diff='diff -y --color=auto'

alias pg='ping -c 2 8.8.8.8'

# Descargar audio youtube
alias yt='youtube-dl -x --audio-format mp3'

DEVICE=$(iw dev | grep Interface | cut -d " " -f2)
alias potencia='sudo iw dev $DEVICE scan | egrep "SSID|signal|\(on"'
