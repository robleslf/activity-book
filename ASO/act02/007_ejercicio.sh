#!/bin/bash

if [ "$#" -eq 0 ]; then
	echo "Faltan argumentos con los nombres de los usuarios"
	exit 1
fi

directorio_copias="$HOME/copias_de_seguridad"

mkdir -p "$directorio_copias"

for usuario in "$@"; do
	if id $usuario &> /dev/null; then
		directorio_copia_usuario="$directorio_copias/${usuario}_$(date +'%Y%m%d_%H%M%S')"
		echo "La copia se seguridad se guardara en $directorio_copia_usuario"
		echo "Iniciando copia de seguridad para $usuario..."
		echo "---"
		echo "Localizando directorio /home de $usuario"
		if [ -e "/home/$usuario" ]; then
			echo "Directorio /home localizado"
			echo "Copiando directorio /home en $directorio_copias..."
			echo "---"
			cp "home/$usuario" "$directorio_copia_usuario"
			echo "Directorio /home copiado"
		else
			echo "No se pudo localizar el directorio /home \
del usuario $usuario, es posible que tenga otro nombre diferente al nombre de usuario."
			echo "Se continuará la copia sin copiar el directorio /home"
			echo "---"
		fi
		echo "Creando fichero de información de usuario..."
		fichero_datos=$directorio_copia_usuario/${usuario}_$(date +"%Y%m%d_%H%M%S").txt
		touch "$fichero_datos"
		cat "Nombre de usuario: $usuario" > "$fichero_datos"
		cat "UID: $(id -u $usuario)" >> "$fichero_datos"
		echo "GID: $(id -g $usuario)" >> "$backup_file"
        	echo "Grupos: $(id -Gn $usuario)" >> "$backup_file"
        	echo "Directorio home: $(getent passwd "$usuario" | cut -d: -f6)" >> "$backup_file"
	        echo "Shell: $(getent passwd "$usuario" | cut -d: -f7)" >> "$backup_file"
	else 
		echo "El usuario $usuario no existe en el sistema."
	fi
done
