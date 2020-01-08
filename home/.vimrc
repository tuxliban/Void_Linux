" Archivo de configuración personalizado para Vim
" Útima edición 30/06/2019

syntax on			" Resaltar sintaxis
set number			" Líneas numeradas
set history=100			" Guardar historial de comandos
set undolevels=500		" Niveles para deshacer cambios
set nocompatible		" Pone los valores por defecto de Vim, en lugar de los de Vi. Pone varias opciones de configuración interesantes
set incsearch			" Búsqueda incremental a medida que se busca
set hlsearch			" Resaltar búsqueda
set showmode			" Mostrar el modo actual en uso
"filetype plugin indent on	" Habilita la detección de tipo de archivos para complementos y opciones de sangría
"filetype on
filetype plugin on
filetype indent on
set laststatus=2		" Mostrar siempre la línea de estado

" Formato pesonalizado para la línea de estado
set statusline=%f\ %l\|%c\ %m%=%p%%\ (%Y%R)

set wildmenu			" Mejora la finalizacion de la linea de comandos
set wrap			" Habilita el ajuste de lineas
"set cursorline			" Resaltar linea actual
