#!/bin/bash
# robleslf

echo "##############################"
echo "##   BIENVENIDO A NUMERÍN   ##"
echo "##############################"
echo ""
echo "El juego de acertar un número y hasta que no lo aciertes no te vas!"
echo "Voy a pensar en un número entero del 1 al 100."
echo ""

numero_secreto=$(( RANDOM % 100 + 1 ))
evento_adivinado=false

while [ "$evento_adivinado" = false ]; do
	read -p "Adivina el número en el que estoy pensando: " numero_usuario

	if ! [[ "$numero_usuario" =~ ^[0-9][0-9]?$|^100$ ]]; then
		echo "Tiene que ser un número del 1 al 100."
		continue
	fi

	if [[ "$numero_usuario" -lt "$numero_secreto" ]]; then
		echo "No, es un número mayor."
		echo ""
	elif [[ "$numero_usuario" -gt "$numero_secreto" ]]; then
		echo "No, es un número menor."
		echo ""
	else
		echo "¡Premiooo!"
		evento_adivinado=true
	fi
done


cat << 'EOF'
 ___________
                             .---'::'        `---.
                            (::::::'              )
                            |`-----._______.-----'|
                            |              :::::::|
                           .|               ::::::!-.
                           \|               :::::/|/
                            |               ::::::|
                            | 1er PREMIO NUMERÍN :|
                            |         1897    ::::|
                            |               ::::::|
                            |              .::::::|
                            J              :::::::F
                             \            :::::::/
                              `.        .:::::::' 
                                `-._  .::::::-'
____________________________________|  """|"_________________________________________
                                    |  :::|
                                    F   ::J
                                   /     ::\                                        
                              __.-'      :::`-.__
                             (_           ::::::_)
                               `"""---------"""'
EOF
