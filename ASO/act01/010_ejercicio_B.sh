#!/bin/bash
# robleslf

echo "###############################"
echo "###  BIENVENIDO A CALCULÍN   ##"
echo "###############################"

echo "Por favor, escoja una de las siguientes figuras:"
echo "Cuadrado (1)"
echo "Rectángulo (2)"
echo "Triángulo (3)"
read -p ":" figura

case $figura in
	1)
		echo "Ha escogido cuadrado"
		echo "Introduzca el valor del lado: " 
		read lado
		if [[ $lado =~ ^[0-9][0-9]*$ ]]; then
			area=$(($lado * $lado))
			echo "El área del cuadrado es $area."
		else
			echo "El lado debe ser un número positivo."
		fi
	;;
	2)
		echo "Ha escogido rectángulo"
		read -p "Introduzca la base del rectángulo: " base
		read -p "Introduzca la altura del rectángulo: " altura
		if [[ $base =~ ^[0-9][0-9]*$ && $altura =~ ^[0-9][09]*$ ]]; then
			area=$(($altura * $base))
			echo "El área de su rectángulo es $area."
		else
			echo "La base y la altura deben ser número enteros positivos."
		fi
	;;
	3)
		echo "Ha escogido triángulo."
		read -p "Introduzca la base del triángulo: " base
		read -p "Introduzca la altura del triángulo: " altura
		if [[ $base =~ ^[0-9][0-9]*$ && $altura =~ ^[0-9][0-9]*$ ]]; then
			area=$(($base * $altura / 2))
			echo "El área de su triángulo es $area."
		else
			echo "Por favor, introduzca números enteros positivos."
		fi
	;;
	*)
		echo "Por favor, seleccione 1, 2 o 3"
	;;
esac
