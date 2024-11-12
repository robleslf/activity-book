#!/bin/bash

encendido=1

separador() {
	echo "_________________________________________________"
}

mostrar_bonito() {
	resultado="# $resultado #"
	for (( i=0; i<${#resultado}; i++ )); do
		echo -n "#"
	done

	echo
	echo "$resultado"

	for (( i=0; i<${#resultado}; i++ )); do
		echo -n "#"
	done
	echo
}

sumar() {
	resultado=$((num1 + num2))
	mostrar_bonito
}

restar() {
	resultado=$((num1 - num2))
	mostrar_bonito
}

multiplicar() {
	resultado=$((num1 * num2))
	mostrar_bonito
}

dividir() {
	resultado=$((num1 / num2))
	mostrar_bonito
}

while [[ $encendido == 1 ]]; do
	interruptor_menu=1
	while [[ $interruptor_menu -eq 1 ]];do
		echo "Elija una operación: "
		echo "(1) suma"
		echo "(2) resta"
		echo "(3) multiplicación"
		echo "(4) división"
		echo "(q) salir" 
		read -p ":" operacion
		separador
		if [[ $operacion -eq 1 ]]; then
			read -p "Elija el primer sumando: " num1
			read -p "Elija el segundo sumando: " num2
			sumar
			interruptor_menu=0
			separador
		elif [[ $operacion -eq 2 ]]; then
			read -p "Elija el minuendo: " num1
			read -p "Elija el sustraendo: " num2
			restar
			interruptor_menu=0
			separador
		elif [[ $operacion -eq 3 ]]; then
			read -p "Elija el primer multiplicando: " num1
			read -p "Elija el segundo multiplicando: " num2
			multiplicar
			interruptor_menu=0
			separador
		elif [[ $operacion -eq 4 ]]; then
			read -p "Elija el dividendo: " num1
			read -p "Elija el divisoro: " num2
			dividir
			interruptor_menu=0
			separador
		elif [[ $operacion == "q" ]]; then
			interruptor_menu=0
			encendido=0
			separador
			echo "Chao, gracias."
			separador
		else
			echo "Por favor, selecciones 1, 2, 3 o 4 en función de la operación que desee realizar."
			separador
		fi
	done
done
