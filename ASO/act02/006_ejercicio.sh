#!/bin/bash
# robleslf

if [ "$EUID" -ne 0 ]; then
	echo "Este script debe ejecutarse con sudo."
	exit 1
fi

if [ "$#" -eq 0 ]; then
	echo "Este script necesita que se ejecute con los usuarios que desea \
borrar como parámetros"
	echo "Ejemplo: $0 usuario1 usuario2"
	exit 2
fi

for usuario in "$@"; do
	if id "$usuario" &> /dev/null; then
		echo "Se va a proceder a borrar el usuario $usuario..."
		echo "Buscando directorio /home del usuario..."
		if [ -e /home/"$usuario" ]; then
			echo "Localizado directorio /home, procediendo a\
 borrarlo..."
			rm -r /home/"$usuario"
			echo "Directorio /home/$usuario borrado con éxito"
			echo "Eliminado usuario del sistema..."
			deluser "$usuario"
			echo "El usuario $usuario fue eliminado del sistema con éxito"
			echo "____________________________________" 
		else
			echo "No se pudo localizar el directorio /home del usuario $usuario, es posible que deba borrarlo manualmente"
			echo "Eliminando usuario del sistema..."
			deluser "$usuario"
			echo "_____________________________________"
			
		fi
	else
		echo "El usuario $usuario no existe en el sistema."
		echo "________________________________________"
	fi
done
