#!/bin/bash
# robleslf
# script que pide al usuario un número y verifica si es par o impar

read -p "Introduzca un número: " numero

resto=$(( numero % 2 ))

if [ $resto == 0 ]; then
	echo "$numero es un número par."
else
	echo "$numero es un número impar."
fi

