# **GUÍA CHROOT VOID LINUX**

## Autores

### Telegram

* @tenshalito	Tuxliban Torvalds
* @lumaro	Luis

-----

### **ÍNDICE**

* [Indroducción](#Introducción)
* [Preparar el sistema de archivos](#Preparar-el-sistema-de-archivos)
* [Crear punto de montaje para el nuevo sistema de archivos (raíz)](#Crear-punto-de-montaje-para-el-nuevo-sistema-de-archivos-(raíz))
* [Instalación del sistema](#Instalación-del-sistema)
	* [XBPS](#XBPS)
	* [Tarball rootfs](#Tarball-rootfs)
* [Configuración](#Configuración)
	* [Configurar jaula chroot](#Configurar-jaula-chroot)
		* [Instalación de sistema (ROOTFS)](#Instalación-de-sistema-(ROOTFS))
	* [Configuración de la instalación](#Configuración-de-la-instalación)
	* [Crear la contraseña para la cuenta de root](#Crear-la-contraseña-para-la-cuenta-de-root)
	* [Establecer permisos para la cuenta de root](#Establecer-permisos-para-la-cuenta-de-root)
	* [Configurar el fichero fstab](#Configurar-el-fichero-fstab)
* [Instalación del kernel](#Instalación-del-kernel)
	* [Configurar archivos de arranque](#Configurar-archivos-de-arranque)
* [Instalación de GRUB](#Instalación-de-GRUB)
	* [Para sistemas BIOS](#Para-sistemas-BIOS)
	* [Para sistemas EFI](#Para-sistemas-EFI)
* [Finalización](#Finalización)
* [Referencias](#Referencias)

-----

<a id="Introducción"></a>
## Introducción

El método de instalación mediante chroot en lugar de la instalación por defecto mediante el menú basado en ncurses, nos aportará un mayor control sobre los paquetes y configuración que se instalarán en nuestro sistema. 

Chroot o *Change root* es una utilidad de Unix empleada principalmente para crear un nuevo entorno conocido como "jaula chroot", separado lógicamente del directorio raíz del sistema principal. Uno de los usos principales del enjaulamiento es crear un sistema Linux independiente encima del sistema huesped que se utiliza para llevar a cabo esta tarea. Explicado y expuesto el método, se expondrá la medología para realizar este tipo de instalación montando la jaula Chroot desde distintas fuentes para adquirir nuestro sistema.

Void permite al usuario poder instalar el sistema a través de dos métodos siguiendo la metodología de chroot. El primero es realizarlo utilizando el gestor de paquetes XBPS  y descargar el sistema base y paquetes apoyándose de un sistema host (Glibc o Musl)  y el segundo método es hacerlo descomprimiendo un tarball de ROOTFS obteniendo un sistema host que permita ingresar a una jaula chroot. Un tercer método, fuera del alcance de esta guía es compilando desde fuentes todo el sistema mediante XBPS-SRC, instalación más compleja  que merece una guía a parte. 

Antes de comenzar el proceso de instalación, debemos fijarnos si el comando se debe ejecutar como root, precedido de #, o bien como usuario del sistema, precedido por $. Aclarado esto, estamos preparados para abordar la instalación.

-----

<a id="Preparar-el-sistema-de-archivos"></a>
## Preparar el sistema de archivos

Antes de comenzar con la instalación del sistema, es necesario llevar a cabo el proceso de particionamiento del disco. En nuestro caso nos apoyaremos de crear las particiones de la herramienta [cfdisk](https://man.voidlinux.org/cfdisk.8) que está incluída en las ISO’s que distribuye Void.

Para nuestro ejemplo consideraremos que el sistema estará compuesto de cuatro particiones:

1. /boot
2. /
3. /home
4. swap

Ante cualquier duda sobre qué tamaño asignar a la partición swap, en este [link](https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions) podrán ver algunas recomendaciones.

**NOTA:** En sistemas de arranque UEFI será necesario contar con una partición de por lo menos unos 200 MB y estar formateada en FAT32.
Procedemos a formatear las particiones:

`# mkfs.vfat /dev/sdaX` ← Partición para /boot

`# mkfs.ext4 /dev/sdaY` ← Partición para /

`# mkfs.ext4 /dev/sdaZ` ← Partición para /home

`# mkswap /dev/sdaW` ← Partición para swap


-----

<a id="Crear-punto-de-montaje-para-el-nuevo-sistema-de-archivos-(raíz)"></a>
## Crear punto de montaje para el nuevo sistema de archivos (raíz)

Dado que esta guía se basa en el supuesto de que la tabla de particiones es tipo GPT, entonces será necesario de un punto de montaje especial para el sistema EFI. Para ello montaremos primero la partición que se ha designado para el sistema raíz:

	# mount /dev/sdaY /mnt

Crear el punto de montaje para el sistema EFI y montar la partición

	# mkdir -p /mnt/boot/efi
	# mount /dev/sdaX /mnt/boot/efi

Activar el área de intercambio (swap)

	# swapon /dev/sdaW

Montar la partición que se ha designado para el home del usuario:

	# mkdir /mnt/home
 	# mount /dev/sdaZ /mnt/home

**Nota:** Después de haber montado todas las particiones que usaremos en el sistema, opcionalmente se puede exportar a texto plano cómo están distribuidas las particiones para que cuando estemos en la jaula chroot terminemos de editarlo y usarlo como nuestro fstab de forma sencilla:

	# lsblk -o NAME,UUID,MOUNTPOINT,FSTYPE > /mnt/etc/fstab

-----

<a id="Instalación-del-sistema"></a>
## Instalación del sistema

Como se mencionó anteriormente, Void Linux puede instalarse mediante chroot siguiendo dos métodos: a través de XBPS descargando el sistema del repositorio o descomprimiendo un tarball que ya contiene un sistema base.

<a id="XBPS"></a>
### XBPS

Si escogió este método, tendrá que elegir el mirror más cercano a usted. Para ver cuáles están disponibles consulte este [artículo](https://docs.voidlinux.org/xbps/repositories/mirrors/index.html)

**NOTA:** Si desea instalar la versión de *Void + Glibc*, añadir al final del mirror seleccionado `/current`; si desea instalar la versión de *Void + Musl* añadir al final del mirror seleccionado `/current/musl`.
Cabe mencionar que Musl es una implementación de libc que se esfuerza por ser liviana, rápida, simple y correcta. Void admite oficialmente musl al usarlo en su base de código para todas las plataformas de destino (aunque los paquetes binarios no están disponibles para i686). Además, todos los paquetes compatibles de los repositorios oficiales están disponibles con binarios vinculados a musl además de sus equivalentes glibc. En caso de que opten por instalar la versión compilada para musl, tener en cuenta, que algunos binarios de los repositorios *non-free*, no estarán disponibles para esta versión, por lo tanto si busca una mejor compatibilidad se recomienda altamente instalar la versión con glibc. Por ejemplo si desea utilizar los drivers privativos de Nvidia.

Para comenzar a descargar el sistema, es necesario indicarle a *XBPS* qué arquitectura se necesita, es decir *x86_64, x86_64-musl o para i686*. ¡Claro, Void Linux también da soporte para arquitecturas de 32 Bits!

Dependiendo de la aquitectura que haya elegido y tomando como ejemplo que se seleccionó el mirror de Alemania, proceder del siguiente modo:

1. Para la versión con glibc:

    `export XBPS_ARCH=x86_64 && xbps-install -S -R https://alpha.de.repo.voidlinux.org/current -r /mnt base-minimal`
    
2. Para la versión con musl:

    `export XBPS_ARCH=x86_64-musl && xbps-install -S -R https://alpha.de.repo.voidlinux.org/current/musl -r /mnt base-minimal`


**NOTA 1:** Void Linux provee al usuario de tres opciones para tomar como base la construcción del sistema:
1. *base-minimal:* Metapaquete con las herramientas mínimas para el sistema
2. *base-system:* Metapaquete del sistema base que viene con las ISO's que provee Void
3. *base-voidstrap:* Conjunto de herramientas necesarias para crear contenedores o jaulas chroot

**NOTA 2:** Si se instaló el paquete *base-minimal*, quizá desee instalar algunos paquetes extras para que el sistema funcione correctamente, es decir, paquetes que brinden funciones como soporte de wifi, detección de periféricos, etc.

**NOTA 3:** Algunas de las funciones que desearía habilitar si optó por el paquete *base-minimal* se consigue instalando paquetes como los siguientes:

* nano/vim - editor de texto cli de su preferencia
* less – paginador de archivos de texto
* man-pages – manuales
* e2fsprogs – Utilidades de sistema de archivos para ext2, ext3 y ext4 (badbloks, blkid, fsck)
* procps-ng – Utilidades para monitorizar el sistema y sus procesos (free, pkill, top, etc)
* pciutils – Conjunto de programas para enumerar dispositivos PCI (lspci)
* usbutils – Utilidades para mostrar información de buses USB (lsusb)
* iproute2 – Programas para redes básicas y avanzadas en IPV4 (ip, bridge, ifstat,etc)
* util-linux – Diversos programas de utilidad (blkid, dmesg,kill, mkfs, mount, etc)
* kbd – Fuentes de consola y utilidades de teclado (setfont, fgconsole, loadkeys, etc)
* wifi-firmware - Metapaquete con driver para tarjetas *ipw2100, ipw2200, zd1211*
* ethtool – Utilidades para examinar controladores y hardware de red
* kmod – Utilidades para cargar módulos del núcleo (depmod, lsmod, modprobe, etc)
* traceroute - Rastrea la ruta tomada por los paquetes a través de una red IPv4 / IPv6
* iputils - Utilidades eficaces para redes Linux (incluido ping)

**NOTA 4:** Al instalar *base-system* tener en cuenta que se tiene menos control de los paquetes instalados para el sistema ya que de manera predeterminada instala los metapaquetes *linux, linux-firmware, wifi-firmware*, además de un paquete que no es de mucha utilidad: *void-artwork*
Por lo tanto, con una instalación mínima es posible escoger qué paquetes realmente necesita y no tener en el sistema paquetes que nunca utilizará (*linux-firmware-amd linux-firmware-nvidia linux-firmware-intel ipw2100-firmware ipw2200-firmware zd1211-firmware*) o una versión de kernel que reemplazará después.

<a id="Tarball-rotfs"></a>
### Tarball rootfs

Descargar del siguiente [link](https://alpha.de.repo.voidlinux.org/live/current/) la versión que desea instalar: glibc o musl.

**NOTA:** Para la arquitectura de i686 no está disponible una versión con musl

Una vez seleccionado el tarball proceder a descomprimirlo en la partición que será asignda para el directorio raíz:

	# tar xvf <ROOTFS_VERSIÓN>.tar.xz -C /path

**NOTA:** Reemplazar *path* por la ruta que han definido para la construcción del sistema

-----

<a id="Configuracion"></a>
## Configuración

A partir de estos pasos y exceptuando la instalación base del sistema usando un tarball, la metodología aplicará a ambos métodos, tanto para XBPS como para ROOTFS.

<a id="Consfigurar-jaula-chroot"></a>
### Configurar jaula chroot

Montar los directorios **sys dev proc** para el correcto funcionamiento de la jaula chroot:

	# for i in sys dev proc; do $(mount --rbind /$i /mnt/$i && mount --make-rslave /mnt/$i); done

También será necesario copiar el fichero resolv.conf del sistema anfitrión ya que contiene la configuración de DNS necesarios para que XBPS descargue los paquetes más recientes dentro de la jaula recien creada:

	# cp /etc/resolv.conf /mnt/etc

Se procede a ingresar a la jaula chroot y para mayor comodidad se cambia el prompt para recordarnos que lo estamos usando. Así mismo, se establece a *bash* como shell de trabajo durante la instalación y configuración,
	
	# PS1='(chroot) # ' chroot /mnt /bin/bash

<a id="Instalación-del-sistema-(ROOTFS)"></a>
#### Instalación de sistema (ROOTFS)

Debido a que los tarball no tienen una fecha de publicación reciente, suelen estar desactualizados, por lo que una vez que se ha extraido el contenido en la partición que se utilizará como directorio raíz, hay que proceder a actualizar los paquetes:

	# xbps-install -uy xbps
	# xbps-install -Suy

<a id="Configuración-de-la-instalación"></a>
### Configuración de la instalación

Crear el hostname para la nueva instalación:

	# echo HOSTNAME > /etc/hostname

Editar el fichero rc.conf del sistema que se está configurando. Para que el sistema lea esas configuraciones será necesario eliminar '#' que está al inicio de cada una de las líneas respectivas.
Para llevar a cabo esta tarea, utilice el editor [VI](https://man.voidlinux.org/nvi.1) que viene incluído en el chroot. Para introducir texto presione la tecla **i** de insertar o la tecla **a** de añadir. Para salir del modo edición presione la tecla **Esc**

	# vi /etc/rc.conf
		HOSTNAME="foo"
		HARDWARECLOCK="UTC"
		TIMEZONE="America/Mexico_City" <-- Ejemplo para México / "Europe/Madrid" <-- Ejemplo para España
		KEYMAP="la-latin" <-- Distribución de teclado para español latinoamericano / "es" <-- Distribución para español

Una vez haya finalizado de editar, para guardar los cambios presione las teclas **:wq** y después la tecla **Enter**

Para conocer más zonas horarias (TIMEZONE) liste las ubicaciones con:

	# ls -l /usr/share/zoneinfo/

Como se darán cuenta, mostrará directorios con los continentes disponibles, por lo que deben de ubicar la ruta completa para reemplazarla en el ejemplo que se muestra arriba.

La distribución de teclado para las consolas virtuales en español España se añade reemplazando *la-latin* por **es**.

NOTA: Si se optó por instalar la versión de Void con glibc, hay que editar el fichero */etc/default/libc.locales* y descomentar quitando el símbolo **#** del entorno de [locales](https://docs.voidlinux.org/config/locales.html) que desee. Se recomienta altamente utilizar las opciones UTF.

	LANG=es_MX.UTF-8 <-- Configuración para México	
    LANG=es_ES.UTF-8 <-- Configuración para España
	
Generar los archivos locales (sólo para glibc)

	# xbps-reconfigure -f glibc-locales

<a id="Crear-la-contraseña-para-la-cuenta-de-root"></a>
### Crear la contraseña para la cuenta de root

	# passwd

<a id="Establecer-permisos-para-la-cuenta-de-root"></a>
### Establecer permisos para la cuenta de root
	
	# chown root:root /
	# chmod 755 /	

<a id="Configurar-el-fichero-fstab"></a>
### Configurar el fichero fstab

<a id="Modo-avanzado"></a>
#### Modo avanzado

El fichero fstab (File System TABle) es el encargado de montar las particiones en cada inicio del sistema. Su configuración inicial se puede generar tomando como base las particiones que se tengan montadas en el fichero */proc/monts*, así que se procederemos a copiar dicho fichero en nuestra jaula chroot:

	# cp /proc/mounts /etc/fstab

**NOTA:** Una vez que se ha copiado el fichero hay que editarlo y eliminar las líneas que hacen referencia a *proc, sys, devtmpfs* y *pts*.

Con ayuda de la herramienta [blkid](https://man.voidlinux.org/blkid.8) podremos identificar el UUID de cada una de las particiones que serán parte de nuestro sistema. Ejecutamos el programa  así:

	# blkid

Si tiene más de un disco duro conectado, entonces especificar cuál es el que se desea analizar. Por ejemplo:

	# blkid /dev/sda
	# blkid /dev/sdc

El sistema devolverá algo parecido a esto:

```
/dev/sda1: UUID="7EE1-A537" TYPE="vfat" PARTLABEL="EFI" PARTUUID="b35386b0-30d8-4d9d-9bc1-b02e78a2c708"
/dev/sda2: UUID="39b09ece-b3c5-4d72-b8a2-7f1611504820" TYPE="ext4" PARTLABEL="GRUB" PARTUUID="824a24e5-5795-4a98-9977-1e534e480fa6"
/dev/sda3: UUID="b7c453a3-332b-4feb-9e57-29a3c08f6fb5" TYPE="ext4" PARTLABEL="tmp" PARTUUID="12e852ce-79cc-4447-a8a0-d93c41b1967a"
/dev/sda4: UUID="95abee86-9bcf-40d6-83bd-2afd30e78e90" PARTLABEL="swap" PARTUUID="e4f25f1c-f74b-487b-9413-0f43a1ac1a99"
```

Ahora que ya se conoce la UUID de cada una de las particiones reemplazarlas en nuestro fstab para que quede de la siguiente manera:

```
# <UUID>					<dir>		<type>		<options>			<dump>	<pass>
UUID=39b09ece-b3c5-4d72-b8a2-7f1611504820   	/            	ext2        	defaults	            	0	1	# Partición raíz
UUID=7EE1-A537					/boot/efi	vfat		defaults			0	2	# Partición de arranque
UUID=b7c453a3-332b-4feb-9e57-29a3c08f6fb5	/home		ext4		defaults			0	2	# Partición home
UUID=95abee86-9bcf-40d6-83bd-2afd30e78e90	none		swap		sw				0	0	# Área de intercambio
tmpfs						/tmp		tmpfs		defaults,nosuid,nodev		0	0	# Sistema de archivos virtual para almacenar archivos en memoria RAM
```

Al configurar el fstab (File System TABle), es necesario asignar el valor de 1 para la entrada de la partición del directorio raíz (columna pass) y asignar un 2 para las demás particiones exeptuando a la partición swap y para tmpfs (ver más detalles [aquí](https://man.voidlinux.org/fsck.8))

La ventaja de configurar el fstab de este modo es que las particiones serán detectadas por el sistema incluso si tuvieran un nombre y se les modificara más adelante.

<a id="Modo-sencillo"></a>
#### Modo sencillo

Ahora procederemos a terminar de editar el fichero fstab. Como recordarán, antes de ingresar a la jaula chroot se creó un fichero en texto plano que contiene información que usaremos para definir las particiones que usará el sistema. Procedemos a abrir el fichero y a editarlo:

	# vi /etc/fstab

Comenzamos añadiendo una almohadilla **#** al inicio de la palabra *NAME* para que no sea leída por el sistema y se procede a eliminar las líneas que no se utilizarán teniendo cuidado de no borrar las que se usarán para el sistema:

```
#NAME		UUID		MOUNTPOINT			FSTYPE
loop0								squashfs	# Eliminar línea
loop1		xxxxx		/run/rootfsbase			ext		# Eliminar línea
sda		xxxxx						iso9660		# Eliminar línea
sda1		xxxxx		/run/initramfs/live		iso9660		# Eliminar línea
sda2		...								# Eliminar línea
sdb		xxxxx								# Eliminar línea
sdb1		xxxxx		/mnt/boot/efi			vfat
sdb2		xxxxx		/mnt				ext4
sdb3		xxxxx		[SWAP]				swap
sdb4		xxxxx		/mnt/home			ext4
sdb5		xxxxx		xxxxx				xxx
```

Para la creación del fichero fstab y fácil lectura nos apoyaremos de usar columnas. Para ello nos aseguraremos de tener en la primera línea los siguientes nombres: UUID MOUNTPOINT FSTYPE OPTIONS DUMP PASS y procedemos a hacer lo siguiente:

1. Eliminar la columna **NAME** que corresponde al nombre y número de partición
2. Añadir **UUID=** antes de la serie alfanumérica que corresponde a cada uuid
3. Colocar a la partición raíz **/** en la parte superior
4. Eliminar la palabra **mnt** de la columna *MOUNTPOINT*
5. Reemplazar *[SWAP]* por **none**
6. Añadir la palabra **defaults** en la columna *OPTIONS* para todas las particiones exceptuando a la partición SWAP a la cual se le añadirá `rw,noatime,discard`
7. En la columna *PASS* añadir **1** para la partición raíz; **0** (cero) para la partición swap, así como para el directorio `/tmp`; y añadir **2** para la partición `/boot /home` o cualquier otra que también hayan definido
8. Añadir una línea adicional para montar al directorio **/tmp** en la ram. En la columna **UUID** poner `tmpfs` en lugar de UUID

Tras haber realizado lo anterior, el resultado debería verse similar a este ejemplo:

```
#UUID		MOUNTPOINT	FSTYPE		OPTIONS			DUMP	PASS
UUID=xxxx	/		ext4		defaults		0	1	 # Partición raíz
UUID=xxxx	/boot/efi	vfat		defaults		0	2	# Partición sistema EFI
UUID=xxxx	none		swap		rw,noatime,discard	0	0	# Partición swap
UUID=xxxx	/home		ext4		defaults		0	2	# Partición home
tmpfs		/tmp		tmpfs		defaults,nosuid,nodev	0	0	# Partición de tmp montada en la ram
```

-----

<a id="Instalación-del-kernel"></a>
## Instalación del kernel

Si no eligió instalar el paquete *base-system* entonces puede continuar con este paso, de lo contrario omitirlo y continuar con el siguiente punto ya que el paquete *base-system* ya incluye un kernel.
	
	# xbps-install linuxX.XX dracut

**NOTA:** Si compilará módulos para el kernel entonces también será necesario instalar los *headers* de la misma versión del kernel que desee:

	# xbps-install linux-headersX.XX

Reemplazar X.XX por la serie del kernel que desea instalar

**NOTA:** Si su sistema necesita firmware adicional, es el momento de instalarlo, en otro caso puede que el sistema no arranque correctamente por falta de dichos controladores:

        # xbps-install linux-firmware-XXX

Dependiendo de su sistema, tendrá que instalar un paquete o varios, las opciones de firmware son *linux-firmware-amd linux-firmware-intel linux-firmware-network linux-firmware-nvidia*

<a id="Configurar-archivos-de-arranque"></a>
### Configurar archivos de arranque

	# xbps-install -fy linuxX.XX

-----

<a id="Instalación-de-GRUB"></a>
## Instalación de GRUB

Usar el comando [grub-install](https://www.gnu.org/software/grub/manual/grub/html_node/Installing-GRUB-using-grub_002dinstall.html) para instalar GRUB en el disco de arranque:

<a id="Para-sistemas-BIOS"></a>
### Para sistemas BIOS

```
# xbps-install -y grub
# grub-install --target=i386-pc /dev/sdX
```
<a id="Para-sistemas-EFI"></a>
### Para sistemas EFI

```
# xbps-install -y grub-x86_64-efi
# grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id="Void"
```

-----

<a id="Finalización"></a>
## Finalización

Utilice el comando [xbps-reconfigure](https://man.voidlinux.org/xbps-reconfigure.1) para asegurar que todos los paquete que se han instalado han sido configurados apropiadamente:

	# xbps-reconfigure -fa

El comando anterior hará que dracut genere un initramfs el cual hará que grub genere una configuración de trabajo. En este punto la instalación del sistema ya está completa, por lo que lo único que resta es salir de la jaula chroot y reiniciar el sistema:

	# exit
	# umount -R /mnt
	# shutdown -r now

-----

<a id="Referencias"></a>
## Referencias
* GNU Operating System (s.f.) Installing GRUB using grub-install. Sitio web de Manual Page Search Parameters:https://www.gnu.org/software/grub/manual/grub/html_node/Installing-GRUB-using-grub_002dinstall.html
* Void Linux (2009). FSCK(8). Sitio web de Manual Page Search Parameters: https://man.voidlinux.org/fsck.8
* Void Linux (2014). CFDISK(8). Sitio web de Manual Page Search Parameters: https://man.voidlinux.org/cfdisk.8
* Void Linux (2019). XBPS-RECONFIGURE(1). Sitio web de Manual Page Search Parameters:https://man.voidlinux.org/xbps-reconfigure.1
* Void Linux (2020). Download installable base live images and rootfs tarballs. Sitio web de Download: https://alpha.de.repo.voidlinux.org/live/current/
* Void Linux (s.f.). Mirrors. Sitio web de Handbook's Void: https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions
* Void Linux (s.f.). Partition notes. Sitio web de Handbook's Void: https://docs.voidlinux.org/installation/live-images/partitions.html#swap-partitions
* Void Linux. (2013). BLKID(8). Sitio web de Manual Page Search Parameters: https://man.voidlinux.org/blkid.8

