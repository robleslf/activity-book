#!/bin/bash
# robleslf
# Script que pide al usuario un número y verifique si es par o impar

echo "Bienvenido a Numerín, $(whoami)."

echo

echo " N   N  U   U  M   M  EEEEE  RRRR    III   N   N"
echo " NN  N  U   U  MM MM  E      R   R    I    NN  N"
echo " N N N  U   U  M M M  EEEE   RRRR     I    N N N"
echo " N  NN  U   U  M   M  E      R  R     I    N  NN"
echo " N   N  UUUUU  M   M  EEEEE  R   R   III   N   N"

echo

validador=true

while [ $validador == true ]; do
	read -p "Dime un número entero: " numero
	if [[ $numero =~ [-+]?[0-9]+$ ]]; then
		echo
		validador=false
	else
		echo "$numero no es un número válido..."
		echo
	fi
done

resto=$((numero % 2))

if [ $resto == 0 ]; then
	echo "$numero es un número par"
else
	echo "$numero es un número impar"
fi
