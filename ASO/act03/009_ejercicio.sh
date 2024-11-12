#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Faltan argumentos."
	exit 1
fi

if [ -e $1 ]; then
	if [ -f $1 ]; then
		echo "$1 es un archivo ordinario existente."
	elif [ -d $1 ]; then
		echo "$1 es un directorio existente."
	else
		echo "El archivo existe, pero no es ni fichero ordinario ni directorio."
	fi
else
	echo "$1 no existe."
fi
