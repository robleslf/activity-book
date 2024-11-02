#!/bin/bash
# robleslf

read -p "Introduce el nombre del fichero con su ruta: " fichero

if [[ -w $fichero ]]; then
	echo "El fichero tiene permisos de escritura"
else
	echo "EL fichero NO tiene permisos de escritura"
fi 


if [[ $(whoami) == "root" ]]; then
	echo "Usted es el root"
else
	echo "Usted no es el root, hombre; usted es $(whoami)"
fi
