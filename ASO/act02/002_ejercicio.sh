#!/bin/bash
# robleslf

for archivo in /tmp/archivo_*.tmp; do
	rm -f "$archivo"
	echo "El archivo $archivo se borró correctamente."
done

if [ $? == 0 ]; then
	echo "Todos los archivos se borraron con éxito."
else
	echo "Uno o varios archivos no se pudieron borrar."
	echo $'\a'
fi
