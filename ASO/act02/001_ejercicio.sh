#!/bin/bash
# robleslf

inodos_libres=`df -i /tmp | awk 'NR==2 {print $4}'`

echo "Hay $inodos_libres inodos libres en /tmp"

for inodo in $(seq 1 $inodos_libres); do
	touch /tmp/archivo_$inodo.tmp
	echo "Creado /tmp/archivo_$inodo.tmp"
done
