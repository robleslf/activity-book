#!/bin/bash
# robleslf
if [ "$EUID" -ne 0  ]; then
	echo "Este script debe ejecutarse usando sudo."
	exit 1
fi

if [ "$#" -eq 0 ]; then
	echo "Faltan argumentos, debe escribir los usuarios que quiere crear después del nombre del programa."
	echo "Ejemplo: $0 usuario1 [usuario2 ...]"
	exit 2
fi

for usuario in "$@"; do

	if id $usuario &> /dev/null; then
		echo "El usuario $usuario ya existe."
		echo "______________________________"
	else
		echo "El usuario $usuario no existe"
		echo "Creando usuario..."
		useradd -m -s /bin/bash $usuario
		echo "Generando constraseña..."
		echo "$usuario:$usuario" | chpasswd
		chage -d 0 "$usuario"
  		# passwd -e $usuario
    		# la línea de arriba la puso el profesor en vez de la de chage -d de encima de esta
		echo "Usuario creado con éxito"
		echo "______________________________"
	fi
done
