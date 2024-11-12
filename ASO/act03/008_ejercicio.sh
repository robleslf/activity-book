#!/bin/bash

aleatorio=$((RANDOM % 100))
intentos=10
separador(){
	echo "_____________________________"
}
echo "Adivina el número en 10 intentos."

while [[ $intentos -ne 0 ]]; do
	read -p "En qué número estoy pensando? → " numero
	separador
	if [[ $numero -gt $aleatorio ]]; then
		echo "Busco un número más pequeño que $numero."
	elif [[ $numero -lt $aleatorio ]]; then
		echo "Busco un número más grande que $numero."
	else
		echo "¡Bingo!"
		exit 0
	fi
	echo
	intentos=$((intentos - 1))
	echo "Intentos restantes: $intentos"
	echo
done

echo "Lo siento, se acabaron los intentos, has sido humillado por la máquina."
