#!/bin/bash
# robleslf

echo "Dime un comando: "; read comando

if command -v $comando > /dev/null; then
	echo "$comando es un comando existente."
	ruta=`command -v $comando`
	echo "Está disponible en $ruta"
else
	echo "El comando $comando no existe, te lo has inventado"
fi
