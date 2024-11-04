#!/bin/bash
# robleslf

if [ "$#" -eq 0 ]; then
    echo "Faltan argumentos con los nombres de los usuarios"
    exit 1
fi

directorio_copias="$HOME/copias_de_seguridad"

mkdir -p "$directorio_copias"

for usuario in "$@"; do
    if id "$usuario" &> /dev/null; then
        directorio_copia_usuario="$directorio_copias/${usuario}_$(date +'%Y%m%d_%H%M%S')"
        mkdir -p "$directorio_copia_usuario"
        echo "___________________________________________"
	echo "Iniciando copia de seguridad para el usuario $usuario"
	echo ""
	echo "La copia de seguridad se guardará en $directorio_copia_usuario"
        echo "Iniciando copia de seguridad para $usuario..."
        echo "---"
        if [ -d "/home/$usuario" ]; then
            echo "Directorio /home/$usuario localizado"
            echo "Copiando el directorio /home/$usuario en $directorio_copia_usuario..."
            cp -r "/home/$usuario" "$directorio_copia_usuario/"
            echo "Directorio /home/$usuario copiado"
        else
            echo "No se pudo localizar el directorio /home del usuario $usuario."
            echo "Es posible que tenga un directorio home diferente al nombre de usuario."
            echo "Continuando sin copiar el directorio home"
            echo "---"
        fi

        fichero_datos="$directorio_copia_usuario/${usuario}_info_$(date +"%Y%m%d_%H%M%S").txt"
        echo "Creando fichero de información de usuario en $fichero_datos..."
        {
            echo "Nombre de usuario: $usuario"
            echo "UID: $(id -u $usuario)"
            echo "GID: $(id -g $usuario)"
            echo "Grupos: $(id -Gn $usuario)"
            echo "Directorio home: $(getent passwd "$usuario" | cut -d: -f6)"
            echo "Shell: $(getent passwd "$usuario" | cut -d: -f7)"
        } > "$fichero_datos"
        
        echo "Información de usuario guardada en $fichero_datos"
	
	echo "Comprimiendo copia de seguridad..."
	tar -czf "${directorio_copia_usuario}.tar.gz" -C "$directorio_copias" "$(basename "$directorio_copia_usuario")"
	
	rm -rf "$directorio_copia_usuario"
	echo "Copia del usuario $usuario finalizada"
	echo "______________________________________"
    else 
        echo "El usuario $usuario no existe en el sistema."
	echo "______________________________________"
    fi
done


