#!/bin/sh
## Buscar en el directorio actual de forma no recursiva
find ~/.local/share/Trash/files/ -maxdepth 1 | wc -l
