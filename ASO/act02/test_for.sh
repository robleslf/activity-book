#!/bin/bash

nombres=("Alicia" "Almudena" "Beatriz")

for nombre in ${nombres[@]}; do
	echo "$nombre!!!"
done


for i in {a..Z}; do
	echo "con la $i"
done

echo $'\a'
