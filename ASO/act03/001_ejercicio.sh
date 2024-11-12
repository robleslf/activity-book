#!/bin/bash

interruptor=0

while [[ $interruptor -eq 0 ]]; do
	read -p "Número 1: " num1
	read -p "Número 2: " num2
	read -p "Número 3: " num3

	if [[ $num1 =~ [-+]?[0-9]+$ && $num2 =~ [-+]?[0-9]+$ && $num3 =~ [-+]?[0-9]+$ ]]; then
		if [[ $num1 -gt $num2 ]]; then
			grande=$num1
			pequeno=$num2
		else
			grande=$num2
			pequeno=$num1
		fi

	if [[ $num3 -gt $grande ]]; then
		mediano=$grande
		grande=$num3
	elif [[ $num3 -lt $pequeno ]]; then
		mediano=$pequeno
		pequeno=$num3
	else
		mediano=$num3
	fi
		interruptor=1
	else
		echo "Deben ser números enteros"
	fi
done

echo "_______________________________________________"

if [[ $grande == $pequeno  ]]; then
	echo "Número más alto: Los tres números son iguales, que son el $grande, y por ende son todos el más alto."
elif [[ $grande == $mediano && $grande != $pequeno  ]]; then
	echo "Número más alto: $grande, que coincide con los dos más altos."
	echo "Número más pequeño: $pequeno."
elif [[ $mediano == $pequeno && $grande != $pequeno ]]; then
	echo "Número más alto: $grande."
	echo "Número más pequeño: $pequeno, que coincide con los dos más bajos."
else
	echo "Número más alto: $grande."
	echo "Número mediano: $mediano."
	echo "Número más bajo: $pequeno."

fi

echo "_______________________________________________"

