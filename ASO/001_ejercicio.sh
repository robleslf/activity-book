#!/bin/bash
# robleslf
# Script que muestra el nombre de usuario, su ID y su grupo prinipal

primer_enunciado="Nombre de usuario: "
segundo_enunciado="ID: "
tercer_enunciado="Grupo: "
user_id=`id -u`
grupo_id=$(id -g)
grupo_con_enunciado=`echo "# ${tercer_enunciado}${grupo_id} #"`


for (( i=0; i<${#primer_enunciado}; i++ )); do
	echo -n "#"
done

for (( i=0; i<${#USER}; i++ )); do
	echo -n "#"
done

echo -n "####"

echo

echo "# ${primer_enunciado}${USER} #"

for (( i=0; i<${#primer_enunciado}; i++ )); do
	echo -n "#"
done

for (( i=0; i<${#USER}; i++ )); do
	echo -n "#"
done

echo -n "####"

echo

echo


for (( i=0; i<${#user_id}; i++ )); do
	echo -n "#"
done

for (( i=0; i<${#segundo_enunciado}; i++ )); do
	echo -n "#"
done

echo -n "####"

echo

echo "# ${segundo_enunciado}${user_id} #"

for (( i=0; i<${#user_id}; i++ )); do
	echo -n "#"
done

for (( i=0; i<${#segundo_enunciado}; i++ )); do
	echo -n "#"
done

echo "####"


echo


for (( i=0; i<${#grupo_con_enunciado}; i++ )); do
	echo -n "#"
done

echo

echo "${grupo_con_enunciado}"


for (( i=0; i<${#grupo_con_enunciado}; i++)); do
	echo -n "#"
done

echo
