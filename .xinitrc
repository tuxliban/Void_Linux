#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi
if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi
if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xrdb -merge ~/.Xresources

#-----------------------------------------------------

## Transparencias
compton -bc &

#-----------------------------------------------------

## Wallpaper aleatorio
feh --bg-fill --randomize --no-fehbg ~/Wallpaper/* &

#-----------------------------------------------------

### Distribución de teclado

## Español latinoamericano
#setxkbmap -layout latam &

## Usar acentos en teclado US
#setxkbmap us -variant intl

## Español España
setxkbmap -layout es &

#----------------------------------------------------

## Activar teclado numérico
#numlockx &

#----------------------------------------------------

## Auto montaje de dispositivos
devmon --exec-on-drive "notify-send -t 7000 --icon=/home/skynet/.icons/mount.png --urgency=low \"Dispositivo %l listo para usar\"" &

#----------------------------------------------------

## Bloqueo de pantalla
#xautolock -time 10 -locker lock

#----------------------------------------------------

## Reproductor de música
mpd

#----------------------------------------------------

## Gestor de ventanas
exec i3
