#!/bin/bash
#robleslf
# DEBE EJECUTARSE CON sudo!!!

# esto entra fijo:
if [ $# -eq 0 ]; then
	echo "Faltan parámetros: $0 grupo1 grupo2..."
 	exit 1
fi

for grupo in "$@"; do
	groupadd $grupo
done

# $@ "de uno en uno"
# $# "número de argumentos"
# $* "todos"
