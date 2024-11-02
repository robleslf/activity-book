#!/bin/bash
# robleslf
# Script que pide dos números y calcula el mayor

echo "Dime un número: "
read num1

echo "Dime otro número: "
read num2

if [[ $num1 -gt $num2 ]]; then
	echo "$num1 es mayor que $num2"
elif [[ $num1 -lt $num2 ]]; then
	echo "$num2 es mayor que $num1"
else
	echo "Ambos números son iguales"
fi
