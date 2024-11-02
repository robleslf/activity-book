#!/bin/bash
#robleslf

read -p "Dime un nombre de usuario: " usuario

if id "$usuario" &>/dev/null; then
	echo "El usuario $usuario existe."
else
	echo "A mí me da que te lo has inventado"
fi
