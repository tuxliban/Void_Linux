# Plantillas que no están disponibles en el repositorio oficial de Void Linux.

Para instalar estos paquetes proceder del siguiente modo:

1. Clonar el repositorio oficial de paquetes de Void:

```
$ git clone git://github.com/void-linux/void-packages.git
$ cd void-packages
$ ./xbps-src binary-bootstrap
```

2. Crear un directorio con el nombre del correspondiente paquete a instalar:

```
$ mkdir srcpkgs/foo
```

3. Copiar la plantilla al directorio que ha creado

```
$ cp /path/<template> ~/path/void-packages/srcpkgs/foo/
```

4. Construir el binario usando **xbps-src**

```
$ ./xbps-src pkg foo
```

5. Para instalar el paquete una vez ha sido empaquetado, proceder del siguiente modo:

```
# xbps-install --repository hostdir/binpkgs foo
```

6. Alternativamente podrá instalar el paquete usando el comando **xi** que viene incluído en el paquete **xtools**. Si no lo tiene, instálelo

```
# xbps-install xtools
# xi foo
```
