#!/bin/bash
#robleslf
# DEBE EJECUTARSE CON sudo!!!

for grupo in "$@"; do
	groupadd $grupo
done

# $@ "de uno en uno"
# $# "número de argumentos"
# $* "todos"
