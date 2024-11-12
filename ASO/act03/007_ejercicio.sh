#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Faltan argumentos."
	exit 1
fi

if ! [ -d $1 ]; then
	echo "Directorio no válido."
	exit 2
fi

bytes=$(du -sb ${1} | awk '{print $1}')
kbytes=$(echo "scale=2; $bytes / 1024" | bc)
mbytes=$(echo "scale=2; $kbytes /1024" | bc)


echo "________________________________"
echo "Directorio: $1"
echo
echo "Tamaño en bytes: $bytes B"
echo "Tamaño en Kilobytes: $kbytes KB"
echo "Tamaño en Megabytes: $mbytes MB"


