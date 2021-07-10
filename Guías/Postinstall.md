# **Guía de instalación *postinstall* para Void Linux**

## Autores

### Telegram

* @tenshalito	Tuxliban Torvalds
* @lumaro	Luis

-----

## **ÍNDICE**

* [Creación de usuario normal](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#1-creaci%C3%B3n-de-usuario-normal)
	* [Establecer contraseña de usuario](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#1-1-establecer-contrase%C3%B1a-de-usuario)
* [Permisos administrativos para la cuenta de usuario](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#2-permisos-administrativos-para-la-cuenta-de-usuario)
	* [sudo](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#2-1-sudo)
		* [Usuario normal con permisos de superusuario](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#2-1-1-usuario-normal-con-permisos-de-superusuario)
		* [Añadir usuario al grupo wheel](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#2-1-2-a%C3%B1adir-usuario-al-grupo-wheel)
	* [doas](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#2-2-doas)
		* [Instalación](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#2-2-1-instalaci%C3%B3n)
			[2.2.1.1 Eliminar sudo (opcional)](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#2-2-1-1-eliminar-sudo-opcional)
		* [Usuario normal con permisos de superusuario](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#2-2-2-usuario-normal-con-permisos-de-superusuario)
		* [Activar persistencia en doas](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#2-2-3-activar-persistencia-en-doas)
		* [No ingresar la contraseña](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#2-2-4-no-ingresar-la-contrase%C3%B1a)
		* [Permisos específicos para usuarios](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#2-2-5-permisos-espec%C3%ADficos-para-usuarios)
		* [Negar la ejecución de comandos](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#2-2-6-negar-la-ejecuci%C3%B3n-de-comandos)
* [Sevicios de runit](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#3-sevicios-de-runit)
* [Conexión a internet](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#4-conexi%C3%B3n-a-internet)
	* [Ethernet](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#4-1-ethernet)
	* [Conexión inalámbrica](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#4-2-conexi%C3%B3n-inal%C3%A1mbrica)
		* [wpa_supplicant](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#4-2-1-wpa_supplicant)
		* [NetworkManager](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#4-2-2-networkmanager)
* [Configuración de mirrors y repositorios](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#5-configuraci%C3%B3n-de-mirrors-y-repositorios)
	* [Selección de mirror](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#5-1-selecci%C3%B3n-de-mirror)
	* [Instalación de repositorios](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#5-2-instalaci%C3%B3n-de-repositorios)
* [Interfaz gráfica de usuario](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-interfaz-gr%C3%A1fica-de-usuario)
	* [Instalar xorg (servidor gráfico)](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-1-instalar-xorg-servidor-gr%C3%A1fico)
		* [Drivers de video](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-1-1-drivers-de-video)
	* [Window manager](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-2-window-manager)
	* [Entorno de escritorio](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-3-entorno-de-escritorio)
		* [Cinnamon Desktop](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-3-1-cinnamon-desktop)
		* [Enlightenment Desktop](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-3-2-enlightenment-desktop)
		* [Desktop](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-3-3-lxde-desktop)
		* [LXQT Desktop](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-3-4-lxqt-desktop)
		* [MATE Desktop](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-3-5-mate-desktop)
		* [XFCE Desktop](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-3-6-xfce-desktop)
		* [Budgie Desktop](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-3-7-budgie-desktop)
		* [GNOME Desktop](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-3-8-gnome-desktop)
		* [PLASMA Desktop](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-3-9-plasma-desktop)
		* [Lumina Desktop](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-3-10-lumina-desktop)
	* [Instalar un gestor de inicio](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-4-instalar-un-gestor-de-inicio)
		* [GDM](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-4-1-gdm)
		* [LightDM](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-4-2-lightdm)
		* [LXDM](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-4-3-lxdm)
		* [SDDM](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-4-4-sddm)
		* [SLIM](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-4-5-slim)
	* [Inicio manual a través del comando startx](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-5-inicio-manual-a-trav%C3%A9s-del-comando-startx)
	* [Autologin e inicio automático de X11](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-6-autologin-e-inicio-autom%C3%A1tico-de-x11)
	* [Configuración de teclado](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-7-configuraci%C3%B3n-de-teclado)
	* [Panel táctil (opcional)](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#6-8-panel-t%C3%A1ctil-opcional)
* [Ajustar brillo de pantalla](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#7-ajustar-brillo-de-pantalla)
	* [Brillo de pantalla](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#7-1-brillo-de-pantalla)
	* [Instalación](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#7-2-instalaci%C3%B3n)
	* [Uso de light](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#7-3-uso-de-light)
* [Fuentes](https://git.disroot.org/tuxliban/tutoriales_void/src/branch/master/Postinstall.md#8-fuentes)

-----

## 1. Creación de usuario normal

Para añadir la cuenta de nuestro usuario se requiere del programa [useradd](https://man.voidlinux.org/useradd.8). Con ayuda de éste agregaremos nuestra cuenta a los grupos que sean necesarios, también debemos definir la contraseña de esta cuenta. Procedemos a crear la cuenta y añadirla a varios grupos del siguiente modo. Para un correcto funcionamiento del sistema, prestad atención a los grupos en los que debe estar presente el usuario:

	# useradd -m -s /bin/bash -U -G wheel,disk,lp,audio,video,optical,storage,scanner,network,xbuilder USUARIO

**NOTA:** Al crear el nombre del usuario asegurarse de que sea con letras **minúsculas**.

Vamos a explicar, brevemente, el significado de cada comando y opción:

1. *useradd:* Comando para crear un nuevo usuario o actualizar información predeterminada del nuevo usuario
2. *-m:* crea el directorio *home* del usuario en caso de que no exista
3. *-s:* asignará la shell predeterminada a la cuenta que se está creando
4. */bin/bash:* Shell seleccionada para el usuario. Aquí puedes asignar otras como *zsh*, *fish*, *oksh*, *loksh* o *mksh* siempre y cuando se instale previamente el shell ya que de manera predeterminada el sistema solo tiene instalados a *dash* y *bash*.
5. *-U:* crea un nuevo grupo con el mismo nombre para del usuario, y agrega al usuario a este grupo
6. *-G:* grupos suplementarios a los que el usuario también formará parte. Cada uno de ellos debe estar separado por una coma y sin espacios entre ellos.
7. *wheel:* grupo utilizado para otorgar permisos administrativos temporales teniendo acceso de lectura y escritura a archivos del sistema
8. *disk:* acceso a dispositivos de alamacenamiento como disquetes, discos duros, ópticos, etc
9. *lp:* acceso a impresoras
10. *audio:* acceso directo al hardware de sonido para todas las sesiones
11. *video:* acceso a dispositivos de captura de video, aceleración de hardware, framebuffer, etc
12. *optical:* acceso a dispositivos óticos como unidades de CD o DVD
13. *storage:* acceso a unidades extraibles como pendrives USB o reproductores MP3; así mismo, permite al usuario montar los dispositivos de almacenamiento
14. *scanner:* acceso a hardware de scáner
15. *network:* grupo necesario para, generalmente, otorgar acceso a NetworkManager o wpa_supplicant para la gestión de las redes
16. *xbuilder:* grupo para poder utilizar el binario `xbps-uchroot` en la construcción de paquetes con `xbps-src`
17. *USUARIO:* reemplazar con el nombre que deseen para la cuenta o cuentas que vayan a a hacer

**NOTA:** Si pretende utilizar *QEMU* para virtualizar otros sistemas, entonces no olvide añadir a su usuario al grupo **`kvm`**

### 1.1 Establecer contraseña de usuario 

	# passwd USUARIO

-----

## 2. Permisos administrativos para la cuenta de usuario

En los sistemas *unix like*, de manera predeterminada, la cuenta que puede ejercer permisos administrativos siempre es *root*. Para que la cuenta de usuario común pueda ejecutar tareas administrativas como *root*, es necesario otorgarle los permisos necesarios y utilizar una herramienta que permita la escalada de privilegios desde un usuario común a *root*.
Void permite hacer este tipo de tareas a través de dos herramientas: [sudo](https://man.voidlinux.org/sudo.8) y [opendoas](https://github.com/Duncaen/OpenDoas)

### 2.1 sudo

`sudo` es el administrador de sistema predeterminado para delegar permisos de administración en casi todos los sistemas *unix like*.

Para configurar los permisos hay que editar el fichero `/etc/sudoers` y es altamente recomendable utilizar [visudo](https://jlk.fjfi.cvut.cz/arch/manpages/man/visudo.8) y no directamente a otros editores como *nano, vim, mousepad, kate, etc* porque en caso de algún error de sintaxis hará que `sudo` quede inutilizable. Al editarlo con `visudo` éste bloqueará el archivo y guardará los cambios en un archivo temporal para verificar que la sintaxis sea la correcta y después pueda copiarlo al archivo `/etc/sudoers`

De manera predederminada *visudo* tiene asignado a *VI*, sin embargo, es posible cambiarlo por un editor más amigable exportando la variable del editor antes de llamar a visudo. Por ejemplo:

	# EDITOR=nano visudo

#### 2.1.1 Usuario normal con permisos de superusuario

Para permitir que la cuenta de usuario normal pueda realizar la escalada de permisos de administrador, es necesario añadir la siguiente línea a la configuración de *sudoers*

	# visudo
	USUARIO	ALL=(ALL) ALL

#### 2.1.2 Añadir usuario al grupo wheel

Para permitir que todos los usuarios miembros del grupo *wheel* puedan ejecutar tareas administrativas descomentarla quitando **#**, al inicio de la línea

	# visudo
	%wheel	ALL=(ALL) ALL

### 2.2 doas

El comando `doas` es simple en su diseño, constrastando con la complejidad del diseño de `sudo`. Para la mayoría de las personas (como @tenshalito y @lumaro), es más que suficiente para las tareas administrativas del sistema.

#### 2.2.1 Instalación

	# xbps-install opendoas

##### 2.2.1.1 Eliminar sudo (opcional)

Una vez instalado `doas` se puede eliminar a *sudo* para dejar que el primero se encargue de la escalada de privelagios a *root* para la administración del sistema.

Como *sudo* forma parte del metapaquete `base-system` no es posible eliminarlo de la forma habitual, ya que el sistema mostrará un aviso de conflicto impidiendo su eliminación. Para eliminar *sudo* (o cualquier otro programa que forme parte de `base-system`) hay que añadir la excepción a una lista de paquetes ignorados por **xbps** del siguiente modo.

	# echo "ignorepkg=sudo" > /etc/xbps.d/10-ignore.conf
	# xbps-remove sudo

**NOTA:** En caso de que el paquete que se desee eliminar tenga dependencias, añadir el *flag* `-R` para eliminar de manera recursiva las dependencias no necesitadas por otros paquetes. Ejemplo:

	# xbps-remove -R foo

#### 2.2.2 Usuario normal con permisos de superusuario

Para configurarlo basta con crear y editar el fichero `/etc/doas.conf` del siguiente modo:

	# touch /etc/doas.conf
	# echo "permit :wheel" > /etc/doas.conf

Lo anterior permitirá que todos los usuarios que se encuentren en el grupo *wheel* puedan ejecutar comandos con permisos de administración.

#### 2.2.3 Activar persistencia en doas

Algo que diferencia a `doas` respecto a `sudo` es que éste último se caracteriza de la persistencia que permite a sus usuarios ingresar la contraseña una vez y no ingresarla de nuevo por un periodo de tiempo corto. Si desea hacer esto con `doas`, entonces añada esto a su configuración:

	# echo "permit persist :wheel" >> /etc/doas.conf

#### 2.2.4 No ingresar la contraseña

Si desea nunca tener que ingresar su contraseña añada lo siguiente a la configuración:

	# echo "permit nopass :wheel" >> /etc/doas.conf

#### 2.2.5 Permisos específicos para usuarios

Si desea agregar a un usuario en específico para ejecutar tareas administrativas, entonces la configuración debe quedar así:

```
permit nopass USUARIO		# No solicitar ingresar contraseña al usuario especificado
permit USUARIO			# Solicitar contraseña para tareas que requieran escalar permisos
```

#### 2.2.6 Negar la ejecución de comandos

Si fuera necesario **negar la ejecución de comandos** que requieran permisos de administrador (en caso de que compartan su equipo), pueden hacer una regla sencilla como esta:

```
permit :wheel		# Usuarios del grupo wheel pueden escalar permisos
deny USUARIO		# Usuario tiene restringida la escalada de permisos incluso si estuviera en el grupo wheel
```

Si sólo se desea restringir la ejecución de por ejemplo reiniciar el sistema entonces se haría así:

```
permit :wheel
deny USUARIO cmd /bin/reboot
```

Para mayor información sobre cómo funciona `doas` consulte los manuales de [doas](https://man.openbsd.org/doas) y [doas.conf](https://man.openbsd.org/doas.conf.5)

-----

## 3. Sevicios de runit

Ahora que ya tiene el sistema funcionando, es un buen momento para revisar qué servicios están ejecutándose actualmente y ver cuáles no necesita. Si no está seguro acerca de un servicio en partícular mejor déjelo activo, sin embargo, las siguientes son relativemente seguras eliminar:

1. Probablemente no necesite tener seis *tty*, por lo que podría eliminarlas y dejar por lo menos una activa para poder iniciar sesión. Como recomendación podría dejar activadas sólo dos *tty's* y eliminar las demás:

```
# rm /var/service/{agetty-tty3,agetty-tty4,agetty-tty5,agetty-tty6}
```

2. Si no planea conectarse a través de *ssh* desde otra computadora, entonces puede elimiar el servicio

```
# rm /var/service/sshd
```

3. Si está utilizando una configuración de red estática, puede eliminar el servicio de *dhcpcd*

```
# rm /var/service/dhcpcd
```

-----

## 4. Conexión a internet

### 4.1 Ethernet

Para una conexión rápida es necesario activar el servicio `dhcpcd`

	# ln -s /etc/sv/dhcpcd /var/service

### 4.2 Conexión inalámbrica

Antes de establecer la conexión es necesario revisar que las interfaces no se encuentren bloqueadas, por lo que en caso de estar bloquedas se habilitan con ayuda de [rfkill](https://man.voidlinux.org/rfkill.8):

	# rfkill unblock all

#### 4.2.1 wpa_supplicant

**NOTA:** Si instaló el sistema a través de una instalación mínima mediante *base-minimal* o con *base-voidstrap*, entonces instale `wpa_supplicant`. 

	# xbps-install wpa_supplicant

Si instaló el sistema desde una ISO live o desde una instalación normal desde el paquete *base-system*, entonces no es necesario instalar `wpa_supplicant` ya que viene incluído en las opciones antes mencionadas.

Identificar interfaz:

	$ ip link

A continuación, encontrar el ssid (nombre) de las redes inalámbricas disponibles:

	# iw dev INTERFAZ scan | grep -i ssid

Configuración wpa_supplicant:

```
# cp /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant-INTERFAZ.conf
$ wpa_passphrase {ssid} {password} | sudo tee -a /etc/wpa_supplicant/wpa_supplicant-INTERFAZ.conf
```

Activar el servicio de wpa_supplicant y de dhcpcd (de ser necesario, instálelo):

	# ln -s /etc/sv/{dhcpcd,wpa_supplicant} /var/service/

Establecer conexión:

	# wpa_supplicant -B -D wext -i wlp2s0 -c /etc/wpa_supplicant/wpa_supplicant.conf 

**NOTA:** *wlp2s0* es el nombre de la interfaz wifi, en su sistema posiblemente sea distinto.

#### 4.2.2 NetworkManager

Instalar el programa:

	# xbps-install NetworkManager

Crear una regla *polkit* en el siguiente directorio `/etc/polkit-1/rules.d/50-org.freedesktop.NetworkManager.rules` que contenga lo siguiente:

```
polkit.addRule(function(action, subject) {
	if (action.id.indexOf("org.freedesktop.NetworkManager.") == 0 && subject.isInGroup("network")) {
		return polkit.Result.YES;
	}
});
```

Por ejemplo usando *vim*

	# vim /etc/polkit-1/rules.d/50-org.freedesktop.NetworkManager.rules

En caso de que su usuario aún no se encuentre en el grupo *network*, añádalo del siguiente modo:

	# gpasswd -a USUARIO network

Desactive los servicios de *dhcpcd* y *wpa_supplicant* en caso de que esté activos ya que ellos y *NetworkManager* son mutuamente excluyentes:

	# rm -fr /var/service/{dhcpcd,wpa_supplicant}

Active los siguientes servicios:

	# ln -s /etc/sv/{NetworkManager,dbus} /var/service/

Conectarse a la red de su preferencia usando *nmtui*. Le ofrecerá una cómoda interfaz gráfica en modo ncurses

	$ nmtui

-----

## 5. Configuración de mirrors y repositorios

### 5.1 Selección de mirror

Dependiendo de la ubicación del usuario, cambiar los mirrors ayudarán seriamente con las velocidades de descarga de los paquetes. Los siguientes son mirrors que se sincronizan directamente desde el *build-master* y, por lo tanto, siempre tendrá los últimos paquetes disponibles.

| **Repositorio** | **Ubicación** |
| :--- | :--- |
| https://alpha.de.repo.voidlinux.org/ | UE: Finlandia |
| https://mirrors.servercentral.com/voidlinux/ | USA: Chicago |
|  https://alpha.us.repo.voidlinux.org/ | USA: Kansas, City |

Una vez detectado el mirror más cercano a su localización, proceda a reemplazar el mirror predeterminado en caso de ser necesario.

Primero hay que crear el siguiente directorio que servirá para guardar los mirrors:

	# mkdir -p /etc/xbps.d

Después copiar las configuraciones predeterminadas al directorio previamente creado:

	# cp /usr/share/xbps.d/*-repository-*.conf /etc/xbps.d/

Ahora reemplazar el contenido del mirror predeterminado por el que hayan elegido:

	# sed -i 's|https://alpha.de.repo.voidlinux.org|<repositorio>|g' /etc/xbps.d/*-repository-*.conf

Por último, sincronizar el índice del repositorio remoto

	# xbps-install -Sf

### 5.2 Instalación de repositorios

Independientemente del repositorio principal que viene activado en una instalación vanilla, Void también proporciona otros dos repositorios para poder ampliar los paquetes disponibles para instalar software, **nonfree** para paquetes cuyas licencias son *no libres*; **multilib** el cual contiene librerías de 32 bits para sistemas de 64 bits.

Para instalar los repositorios proseguir del siguiente modo:

1. Repositorio *nonfree*

```
# xbps-install void-repo-nonfree
# xbps-install void-repo-multilib-nonfree
```

**Nota:** El repositorio *multilib-nonfree* no está disponible para la versión de Void + Musl

2. Repositorio *multilib*

```
# xbps-install void-repo-multilib
```

**Nota:** El repositorio *multilib-nonfree* no está disponible para la versión de Void + Musl

-----

## 6. Interfaz gráfica de usuario

Los siguientes pasos le ayudarán a ejecutar una configuración básica para un WM o para un entorno de escritorio. Los pasos son esencialmente los mismos

### 6.1 Instalar xorg (servidor gráfico)

El paquete *xorg* es un metapaquete que instala todo lo relacionado con Xorg. Dicho paquete le dará un inicio "rápido", pero también llenará su sistema de paquetes innecesarios. Una buena práctica sería instalar el paquete *xorg-minimal* para tener menos dependencias, pero será necesario especificar el controlador de video; o si lo prefiere, instalar todo manualmente para que sepa lo que se instala en el sistema:

	# xbps-install xorg-server xauth xinit xf86-input-libinput xf86-video-XXX

#### 6.1.1 Drivers de video

Para identificar qué tipo de tarjeta tenemos instalada en nuestro equipo escribir lo siguiente en la consola:

	$ lspci | grep VGA

1. AMD Raedon:		`xf86-video-amdgpu`
2. ATI Raedon:		`xf86-video-ati`
3. Open source NVIDIA:	`xf86-video-noveau`
4. Intel:		`xf86-video-intel`
5. Driver genérico:	`xf86-video-vesa`

**NOTA:** Tenga en cuenta que el driver `xf86-video-intel` no se requiere en procesadores basados en *Sandy Brige* o en más nuevos

También puede optar por utilizar el driver [modesetting](https://wiki.archlinux.org/index.php/Kernel_mode_setting) que viene incluído en el kernel. Si se decide por esta opción, asegúrese de tener instalado también el paquete `mesa-dri`

### 6.2 Window manager

Existen diferentes tipos de WM que manejan las ventanas de manera diferente. Los más comunes que se suelen usar en Void son los siguientes:

1. Flotante: openbox
2. Tiling: bspwm, i3wm, sway (Wayland)
3. Dynamic: awesome, dwm

### 6.3 Entorno de escritorio

Void Linux cuenta en sus repositorios oficiales con soporte para varios entornos de escritorio. De manera oficial soporta a los siguientes:

1. Cinnamon
2. Enlightenment
3. lxde
4. lxqt
5. Mate
6. xfce

De manera no oficial dispone de:

1. Budgie
2. Gnome
3. Plasma
4. Lumina

#### 6.3.1 Cinnamon Desktop

El escritorio Cinnamon es una bifurcación de GNOME Shell, desarrollado por el proyecto [Linux Mint](https://github.com/linuxmint/cinnamon). Se caracteriza por ser un escritorio que apuesta por mantener la ligereza de su predecesor GNOME 2. Para instalar este entorno de escritorio proceder del siguiente modo:

```
# xbps-install cinnamon gnome-terminal lightdm lightdm-gtk-greeter dbus
# ln -s /etc/sv/{lightdm, dbus} /var/service/
```

**NOTA:** Se sabe que Cinnamon [actúa de manera extraña](https://www.reddit.com/r/voidlinux/comments/i21a7e/void_linux_musl_cinnamon_doesnt_work_properly) al ejecutarlo desde Musl. Esto también afecta a la imagen en vivo, void-live-x86_64-musl- <date> -cinnamon.iso

#### 6.3.2 Enlightenment Desktop

Para instalar el escritorio proceder del siguiente modo:

```
# xbps-install enlightenment lxdm lxterminal dbus
# ln -s /etc/sv/{lxdm, dbus} /var/service/
```

#### 6.3 3 LXDE Desktop

El escritorio lxde es uno de los más ligeros y una buena opción para aquellos equipos que se ven limitados en hardware. Para instalarlo proceder de la siguiente manera:

```
# xbps-install lxde dbus
# ln -s /etc/sv/{lxdm, dbus} /var/service/
```

#### 6.3.4 LXQT Desktop

El escritorio [lxqt es otro de los proyectos que apuesta por la ligereza](https://lxqt.github.io/), pero sin sacrificar lo estético. Es el resultado de la fusión de Razor-Qt y LXDE. Para instalarlo proceder del siguiente modo:

```
# xbps-install lxqt lxqt-l10n dbus lxdm
# ln -s /etc/sv/{lxdm, dbus} /var/service/
```

#### 6.3.5 MATE Desktop

El [escritorio Mate](https://git.mate-desktop.org/) está basado en Gnome 2 y se encuentra en constante desarrollo para ofrecer a sus usuarios un entorno atractivo e intuitivo. Para instalar el escritorio proceder del siguiente modo:

```
# xbps-install mate dbus ligtdm lightdm-gtk-greeter
# ln -s /etc/sv/{lightdm, dbus} /var/service/
```

Opcionalmente también podría optar por instalar el paquete `mate-extra` el cual le brindará al usuario una mejor experiencia al proporcionarle por ejemplo salvapantallas, visor de documentos, visor de imágenes, calculadora, terminal, etc

#### 6.3.6 XFCE Desktop

El [escritorio xfce](https://www.xfce.org/) se caracteriza por ser también uno de que consumen poco recursos del sistema sin dejar de ser visualmente atractivo y, por supuesto, sencillo de usar. Para instalarlo proceder del siguiente modo:

```
# xbps-install xfce4 dbus lxdm
# ln -s /etc/sv/{lxdm, dbus} /var/service/
```

Opcionalmente también podría instalar el paquete `xfce4-plugins` el cual le brindará al usuario una amplia gama de plugins para el panel, notificaciones o herramientas del sistema.

#### 6.3.7 Budgie Desktop

El escritorio budgie está basado en Gnome 3 y es desarrollado por el [projecto Solus](http://solus-project.com). Para instalar el escritorio proceder del siguiente modo:

```
# xbps-install budgie-desktop gnome-terminal dbus gdm
# ln -s /etc/sv/{gdm, dbus} /var/service/
```

#### 6.3.8 GNOME Desktop

Para instalar el [escritorio](https://www.gnome.org) proceder del siguiente modo:

```
# xbps-install gnome dbus gdm
# ln -s /etc/sv/{gdm, dbus} /var/service/
```

#### 6.3.9 PLASMA Desktop

Para instalar el [escritorio](https://kde.org/) proceder del siguiente modo:

```
# xbps-install kde5 dbus
# ln -s /etc/sv/{sddm, dbus} /var/service/
```

Opcionalmente también puede instalar el paquete `kde-5-baseapp` el cual le proveerá de un editor de texto plano, un gestor de archivos y un emulador de consola

#### 6.3.10 Lumina Desktop

El [escritorio Lumina](https://lumina-desktop.org/faq/) tiene la particularidad de caracterizarse por no requerir ninguno de los marcos de implementación de escritorio de uso común (dbus, policykit, consolekit, systemd, hald, etc.) Para instalar el escritorio proceder del siguiente modo:

```
# xbps-install lumina slim
# ln -s /etc/sv/slim /var/service/
```

### 6.4 Instalar un gestor de inicio

Void provee distintos *Display Managers* o Gestor de Inicio para poder iniciar sesión en el escritorio que hayamos instalado de manera gráfica.
Algunos escritorios tienen sus DM el cual lo instala de manera automática, sin embargo, es posible reemplazarlo por otro que sea del agrado del usuario. A continución se mencionarán los más comunes

#### 6.4.1 GDM

Para instalarlo y activarlo proceder del siguiente modo:

```
# xbps-install gdm
# ln -s /etc/sv/gdm /var/service/
```

#### 6.4.2 LightDM

Para instalarlo y activarlo proceder del siguiente modo:

```
# xbps-install lightdm lightdm-gtk-greeter
# ln -s /etc/sv/lightdm /var/service/
```

#### 6.4.3 LXDM

Para instalarlo y activarlo proceder del siguiente modo:

```
# xbps-install lxdm
# ln -s /etc/sv/lxdm /var/service/
```

#### 6.4.4 SDDM

Para instalarlo y activarlo proceder del siguiente modo:

```
# xbps-install sddm
# ln -s /etc/sv/sddm /var/service/
```

#### 6.4.5 SLIM

Para instalarlo y activarlo proceder del siguiente modo:

```
# xbps-install slim
# ln -s /etc/sv/slim /var/service/
```

### 6.5 Inicio manual a través del comando **startx**

Para iniciar sesión a través del comando *startx* es necesario tener instalado el paquete `xinit` y tenerlo configurado correctamente. Para ello, primeramente será necesario crear un fichero llamado xinitrc y guardarlo en nuestro directorio *home* con la característica de oculto.

	$ touch ~/.xinitrc

Ahora, dependiendo del escritorio se haya instalado, habrá que añadir la linea correspondiente para poder iniciar X11

```
exec mate-session	# Para iniciar Mate-Desktop
exec startxfce4		# Para iniciar XFCE
exec startlxde		# Para iniciar LXDE
exec startkde		# Para iniciar KDE-Plasma
exec gnome-session	# Para iniciar Gnome
exec cinnamon-session	# Para iniciar Cinnamon
exec startlxqt		# Para iniciar LXQT
```
### 6.6 Autologin e inicio automático de X11

Crear un servicio de autologin para runit

	# cp -R /etc/sv/agetty-tty1 /etc/sv/agetty-autologin-tty1

El nombre del servicio que se vaya a crear es necesario que termine con el nombre válido de alguna de las consolas virtuales activadas. De lo contrario el servicio no funcionará.

Ahora hay que editar el siguiente fichero `/etc/sv/agetty-autologin-tty1/conf` para añadir lo siguiente:

```
GETTY_ARGS="--autologin USUARIO --noclear"
BAUD_RATE=38400
TERM_NAME=linux
```

Si se inició sesión en la consola virtual uno (tty1), ahora es un buen momento para cambiar a otra para continuar con la configuración.

Desactivar el servicio de la  tty1 y activar el servicio para el autologin:

```
# rm /var/service/agetty-tty1
# ln -s /etc/sv/agetty-autologin-tty1 /var/service
```

Ahora, cada vez que el sistema inicie, el autologin a la consola virtual uno será de forma automática pero no en X11, por lo tanto, para conseguirlo añadir en el archivo de perfil de su shell en uso (bash de manera predeterminada) lo siguiente:

```
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	exec startx
 fi
```

### 6.7 Configuración de teclado

Para establecer de forma permanente la distribución de nuestro teclado en X11, es necesario agregar un archivo de configuración en el que se defina la clase de entrada preferida estableciendo la opción *XkbLayout*. Para ello, será necesario crear el siguiente directorio: `/etc/X11/xorg.conf.d/10-keyboard-user.conf`

```
Section "InputClass"
	Identifier		"system-keyboard"
	MatchDriver		"libinput"
	MatchIsKeyboard		"on"
	Option			"XkbLayout"	"latam" 		# Para la distribución de español latinoamericano. Si se desea la distribución para español España, reemplazar *latam* por *es*
	Option			"XkbOption"	"grp:alt_shift_toggle"	# Alternar distribución de teclado en caso de tener definido dos opciones
```

**NOTA:** Si no sabe qué tipo de distribución de teclado tiene, revisar los siguientes ejemplos:
1. [Distribución de teclado en español latinoamericano](https://tecnovortex.com/wp-content/uploads/2010/05/kb-latinoamericano.png)
2. [Distribución de teclado en español España](https://tecnovortex.com/wp-content/uploads/2010/05/kb-spanish-1024x341.png)

### 6.8 Panel táctil (opcional)

Para habilitar el pánel táctil (touchpad) de las computadoras portátiles basta con añadir la configuración al mismo directorio en el que se definió la configuración del teclado, con la diferencia de que el fichero tendrá un nombre similar a `15-touchpad.conf` al que se le añadirá lo siguiente:

```
Section "InputClass"
	Driver "libinput"
	MatchIsTouchpad "on"
	Option "Tapping"		"on"		# Activar comportamientos al hacer clic
	Option "NaturalScrolling"	"true"		# Desplazamiento natural (inverso)
	Option "ScrollMethod"		"foo"		# Método utilizado para el scroll: edge para desplazamiento de borde (vertical) y twofinger para hacerlo con dos dedos
	Option "DisableWhileTyping"	"true"		# Desactivat touchpad mientras se escribe 
```

-----

## 7. Ajustar brillo de pantalla

Después de haber instalado Void, lo más probable es que el brillo de la pantalla sea demasiado alto. Para arreglarlo, a continuación se indicará cómo solucionar ese tipo de problemas.

### 7.1 Brillo de pantalla

Para cambiar el brillo de la pantalla existen varias utilidades, entre las más comunes se encuentran *xbacklight, brighnessctl, brillo, light*, sin embargo, el programa que se recomendará en esta sección será [light](https://github.com/haikarainen/light) debido a que entre sus diversas funciones, también nos permitirá realizar los ajustes de intensidad de brillo de pantalla tanto en X11, como en modo totalmente CLI y además, también es posible utilizar este program sin ninguna restricción en la versión de Void Musl.

### 7.2 Instalación

Para instalar el programa basta con lo siguiente:

```
# xbps-install light
```

### 7.3 Uso de *light*

Para efectos de uso concretos sólo se usarán tres comandos de ajuste del brillo: disminuir, aumentar y definir. Ejemplos:

```
light -A 5		# Incrementa la intensidad de brillo de la pantalla en intervalos de 5%
light -U 5		# Reduce la intensidad de brillo de la pantalla en intervalos de 5%
light -S 80		# Ajusta la intensidad del brillo de la pantalla al 80%
```

Para ver las otras opciones que soporta *light* consulta su [manual](https://github.com/haikarainen/light)

Una vez se conoce los comandos básicos, lo que que falta es definir los atajos de teclado que se utilizarán para realizar los cambios del brillo.

-----

## 8 Fuentes

* Haikarainen. (2020). Light. Sitio web de Github: https://github.com/haikarainen/light
* Void Linux. (2021). DOAS(1). Sitio web de Manual Page Search Parameters: https://man.voidlinux.org/doas
* Void Linux. (2020). DOAS.CONF(5). Sitio web de Manual Page Search Parameters: https://man.voidlinux.org/doas.conf.5
* Void Linux. (2020). SUDO(8). Sitio web de Manual Page Search Parameters: https://man.voidlinux.org/sudo
* Void Linux. (2020). SUDOERS(5). Sitio web de Manual Page Search Parameters: https://man.voidlinux.org/sudoers.5
* Void Linux. (2020). USERADD(8). Sitio web de Manual Page Search Parameters: https://man.voidlinux.org/useradd

