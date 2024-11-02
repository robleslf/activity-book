#!/bin/bash
# robleslf
# script que muestre nombre y id de usuario, y su grupo

echo "Nombre de usuario: $USER"
echo "Id de usuario: $(id -u)"
echo "Grupo principal al que pertenece: $(id -g)"

