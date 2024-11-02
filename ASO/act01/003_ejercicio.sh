#!/bin/bash
# robleslf
# script que pide al usuario una ruta de fichero y comprueba que existe o no

read -p "Escriba la ruta del fichero que busca: " fichero

if [[ -e $fichero  ]]; then
	echo "El fichero existe"
else
	echo "Qué va, ese fichero no existe."
fi
