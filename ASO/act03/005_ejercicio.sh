#!/bin/bash

if [ $# -eq 0 ]; then
	echo "No se recibieron argumentos."
	exit 1
fi

if ! [[ $1 =~ ^[0-9][0-9]*$ ]]; then
	echo "El argumento es inválido."
	exit 2
fi

modulo_400=$(( $1 % 400 ))
modulo_4=$(( $1 % 4 ))
modulo_100=$(( $1 % 100 ))

if [[ $modulo_400 -eq 0  ]] || [[ $modulo_4 -eq 0 && $modulo_100 -ne 0 ]]; then
	echo "$1 es un año bisiesto!"
else
	echo "$1 no es un año bisiesto."
fi
