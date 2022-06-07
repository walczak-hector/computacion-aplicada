#!/bin/bash

esLaborable(){
DIA=`date -d $VAR +%u`
DIA2=`date -d $VAR +%d/%m`
FERIADO=`cat feriados.txt | grep -w $DIA2`
echo "$FERIADO"
if [ $DIA = 6 ]
then
	echo "No es laborable"
	exit
fi

if [ $DIA = 7 ]
then
	echo "No es laborable"
	exit
fi

if [ $DIA = 0 ]
then
	echo "No es laborable"
	exit
fi

if [ "$FERIADO" ]
then
	echo "No es laborable"
	exit
else
	echo "$DSEMANA $DATE Es laborable"
fi
}

esLaborable
