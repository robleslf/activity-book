#!/bin/bash

if [ $EUID -ne 0 ]; then
	echo "Este script necesita permisos de superusuario para ejecutarse: sudo $0"
	exit 1
fi

read -p "¿Cuántos ejercicios quieres crear? " numero

read -p "Escribe el nombre de usuario al que le quieres dar los permisos de ejecución: " usuario

for (( i=1; i <= $numero; i++ )); do
	if [ $i -lt 10 ]; then
		fichero="00${i}_ejercicio.sh"
	else
		fichero="0${i}_ejercicio.sh"
	fi

	echo "Creando $fichero"
	touch $fichero

	echo "Añadiendo shebang a $fichero"
	echo '#!/bin/bash' > $fichero

	echo "Dando permisos de ejecución a $fichero"
	chmod u+x $fichero

	echo $(whoami)
	chown "$usuario:$usuario" "$fichero"

	echo "---"
	echo "$fichero creado con éxito."
	echo "________________________________________________"
done

echo "Todos los ficheros fueron creados con éxito."

exit 0

