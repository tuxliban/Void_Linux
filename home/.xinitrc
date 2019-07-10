#!/bin/sh

userresources=$HOME/.Xresources
#usermodmap=$HOME/.Xmodmap
#sysresources=/etc/X11/xinit/.Xresources
#sysmodmap=/etc/X11/xinit/.Xmodmap

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

#xrdb -merge ~/.Xresources

#-----------------------------------------------------

## Compositor de ventanas
compton -bc --inactive-dim=0.5 &

#-----------------------------------------------------

## Wallpaper aleatorio en cada inicio de sesión
#feh --bg-fill --randomize --no-fehbg ~/Wallpaper/* &

## Wallpaper aleatorio cada 20 minutos
watch -n 1200 feh --randomize --bg-fill ~/Wallpaper/* &

#-----------------------------------------------------

### Distribución de teclado

## Español latinoamericano
setxkbmap -layout latam &

## Usar acentos en teclado US
#setxkbmap us -variant intl

#----------------------------------------------------

## Activar teclado numérico
numlockx &

#----------------------------------------------------

## Auto montaje de dispositivos
devmon --exec-on-drive "notify-send -t 9000 --icon=/home/skynet/.icons/mount.png --urgency=low \"Dispositivo %l listo para usar\"" &

#----------------------------------------------------

## Reproductor de música
mpd &

#----------------------------------------------------

## Ajustar brillo de pantalla al 2%
xbacklight -set 2 &

#---------------------------------------------------
## Gestor de ventanas
exec i3
