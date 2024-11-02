#!/bin/bash
# robleslf
# script que pide al usuario la ruta de un fichero y comprueba
# si tiene permisos de lectura

read -p "Dime la ruta del fichero: " fichero

if [[ -r $fichero ]]; then
	echo "El fichero tiene permisos de lectura."
else
	echo "El fichero NO tiene permisos de lectura."
fi


