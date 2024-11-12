#!/bin/bash

separador(){
	echo "____________________________"
}

for (( i=1; i<6; i++ )); do
	validador=0
	while [[ $validador -eq 0 ]]; do
		read -p "Numero $i: " variable_temporal

		eval "num$i=${variable_temporal}"

		if [[ ${variable_temporal} =~ ^[-+]?[0-9]+$ ]]; then
			validador=1
		else
			echo "Por favor, escoja un número válido."
		fi
	done
done

suma_total=0

echo "Los números elegidos son: "
for (( i=1; i<6; i++ )); do
	eval "numero_imprimir=\${num$i}"
	echo $numero_imprimir
	suma_total=$((suma_total + numero_imprimir))
done

media=$((suma_total / 5))

separador

echo "La media aritmética es $media"

echo "Números por encima de la media: "
for (( i=1; i<6; i++ )); do
	eval   "numero_actual=\${num$i}"
	if [[ $numero_actual -gt $media ]]; then
		echo $numero_actual
	fi
done

