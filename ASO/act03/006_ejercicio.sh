#!/bin/bash

interruptor_menu=1
separador() {
	echo "______________________"
}

while [[ $interruptor_menu -eq 1 ]]; do
	echo "Elija una opción: "
	echo "(1) Mostrar fecha"
	echo "(2) Mostrar los usuarios conectados"
	echo "(3) Mostrar el directorio de trabajo"
	echo "(4) Listar el contenido del directorio de trabajo"
	echo "(q) Salir"
	read -p ":" eleccion

	case $eleccion in
		1)
			separador
			date
			separador
		;;
		2)
			separador
			who
			separador
		;;
		3)
			separador
			pwd
			separador
		;;
		4)
			separador
			ls -l .
			separador
		;;
		[qQ]|[qQ][uU][iI][tT])
			interruptor_menu=0
		;;
	esac
done

separador

echo "Gracias, hasta la próxima"
