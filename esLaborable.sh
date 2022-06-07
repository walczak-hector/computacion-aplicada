#!/bin/bash

esLaborable(){

#Asignamos a la variable dia el numero de la semana 0-7 del argumento ingresado)
DIA=`date -d $1 +%u`

#Asignamos a la variable el mes y el dia del argumento ingresado
DIA2=`date -d $1 +%d/%m`

#Buscamos el dia en la lista de feriados
FERIADO=`cat feriados.txt | grep -w $DIA2`

#Se verifica que el dia no sea sabado
if [ $DIA = 6 ];then
	echo "Sabado. No es laborable"

#Se verifica que no sea domingo	
elif [ $DIA = 7 ];then
	echo "Domingo. No es laborable"
elif [ $DIA = 0 ];then
	echo "Domingo. No es laborable"

#Se verifica que no sea feriado nacional
elif [ "$FERIADO" ];then
	echo "Es feriado nacional. No es laborable"

#Se informa que los dias que no sean fines de semana y feriados son laborables
else
	echo "Es laborable"
fi
}

#Se invoca a la funcion
esLaborable $1
