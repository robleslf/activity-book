#!/bin/bash

cat usuarios.txt | while read linea; do
  user=$(echo $linea | cut -d "|" -f 1)
  id=$(echo $linea | cut -d "|" -f 2)

  useradd -u $id -m $user
  echo "$user:$user" | chpasswd
  passwd -e $user
  
done  
