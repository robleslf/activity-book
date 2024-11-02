#!/bin/bash
# robleslf

echo "Dime un nombre de grupo: "
read grupo

if getent group "$grupo" > /dev/null; then
	echo "$grupo existe."	
	usuarios=`cat /etc/group | grep sudo | cut -f4 -d:`
	echo "Sus usuarios son:"
	echo "$usuarios"
else
	echo "Ese grupo no existe."
fi

