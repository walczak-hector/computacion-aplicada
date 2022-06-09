#!/bin/bash

#Se imprime el texto y lo ingresado se lo asigna a la variable VAR
echo "Ingrese el dia a verificar en formato ANSI (YYYY/MM/DD)"
read VAR

#Se invoca al script esLaborable con VAR como argumento
./esLaborable.sh $VAR
