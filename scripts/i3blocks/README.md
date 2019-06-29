## Scripts sencillos pero funionales para utilizar con i3blocks. Siéntete libre de editarlos para adaptarlos a tus necesidades

| i3blocks Script | Dependencias      |
|-----------------|-------------------|
| bat.sh          | ACPI              |
| date.sh         | ------            |
| focus.sh        | Xdotool           |
| mem.sh          | ------            |
| mpd.sh          | Mpd, Ncmpcpp, Mpc |
| mocp.sh         | Moc               |
| temp.sh         | lm-sensors        |
| trash.sh        | ----              |
| vol.sh          | alsa-utils        |
| cpu.sh          | sysstat           |
| disk.sh         | ------            |
| key_l.sh        | ------            |
| net.sh          | ------            |
| touchpad.sh     | ------            |
| update.sh       | checkupdates      |
| long.sh         | ------            |
| uptime.sh       | ------            |

---

### Instalación

git clone https://github...



### Configuración

##### Batería
[Bat]
command=~/.config/i3blocks/Blocks/bat.sh
interval=30
color=#CC0099


##### Fecha y hora
[Time]
command=~/.config/i3blocks/Blocks/date.sh
interval=60
color=#6699FF


##### Ventana enfocada

[Focus]
command=~/.config/i3blocks/Blocks/focus.sh
interval=1
color=#FF6666


##### Memoria ram
[Ram]
command=~/.config/i3blocks/Blocks/mem.sh -m
interval=10
color=#FF6600


##### Área de intercambio
[Swap]
command=~/.config/i3blocks/Blocks/mem.sh -s
interval=10
color=#6699FF


##### MPD
[MPD]
command=~/.config/i3blocks/Blocks/mpd.sh
interval=5
color=#66CCFF


##### Temperatura del cpu
[Temp]
command=~/.config/i3blocks/Blocks/temp.sh
interval=60
color=#6699FF


##### Papelera de reciclaje
[Trash]
command=~/.config/i3blocks/Blocks/trash.sh
interval=60
color=#c68c53


##### Volumen
[Vol]
command=~/.config/i3blocks/Blocks/Vol.sh
interval=3
color=#9933FF


##### Uso del cpu
[Cpu]
command=~/.config/i3blocks/Blocks/cpu.sh
interval=5
color=#FFFF66


##### Uso del disco
[Disk]
command=~/.config/i3blocks/Blocks/disk.sh /
interval=60
color=#CC6699


##### Distribución del teclado
[Key]
command=~/.config/i3blocks/Blocks/key_l.sh
interval=once
color=#33ff33


##### Mocp
[Mocp]
command=~/.config/i3blocks/Blocks/mocp.sh
interval=60
color=#66CCFF


##### Conexión Ethernet
[Ether]
command=~/.config/i3blocks/Blocks/net.sh -e
interval=10
color=#CC99FF


##### Conexión Wifi
[Ether]
command=~/.config/i3blocks/Blocks/net.sh -w
interval=10
color=#CC99FF


##### Touchpad
[Touchpad]
command=~/.config/i3blocks/Blocks/touchpad.sh
interval=10
color=#4d4dff


##### Actualizaciones
[Update]
command=~/.config/i3blocks/Blocks/update.sh
interval=600
color=#FFCC99


##### Tiempo de uso
[Uptime]
command=~/.config/i3blocks/Blocks/uptime.sh
interval=60
color=#FFCC00


##### Idioma del sistema
[Long]
command=~/.config/i3blocks/Blocks/long.sh
interval=600
color=#FFFF99


### [!] NOTA:
Necesitarás intalar el paquete fonts awesome
