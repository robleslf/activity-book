#!/bin/bash
# robleslf

if [ ! -f "usuarios.txt" ]; then
	echo "No se pudo encontrar el fichero \"usuarios.txt\"."
	exit 1
fi

if [ "$EUID" -ne 0 ]; then
	echo "Debes ejecutar este script con permisos de superusuario: sudo $0"
	exit 2
fi

while IFS='|' read -r usuario uid; do
	usuario=$(echo "$usuario" | xargs)
	uid=$(echo "$uid" | xargs)

	if id "$usuario" &>/dev/null; then
		echo "El usuario $usuario ya existe."
	else
		useradd -u "$uid" -m "$usuario"
		echo "$usuario:""$usuario" | chpasswd

		chage -d 0 "$usuario"

		echo "###############"
		echo "Usuario creado: "
		printf "\tUsername: $usuario\n"
		printf "\tID: $uid\n"
		echo "------"
		echo "Necesario cambio de contraseña al iniciar sesión"
		echo "###############"
	fi
done < usuarios.txt


