#!/bin/bash


validador=0

while [[ $validador -eq 0 ]]; do
	read -p "Dime un número mayor o igual a 1: " numero
	if [[ $numero =~ ^[+]?[1-9][0-9]*$ ]]; then
		validador=1
	else
		echo "Debe ser un número superior a 1."
	fi
done

while [[ $numero -ge 1 ]]; do
	echo $numero
	numero=$(($numero - 1))
done
