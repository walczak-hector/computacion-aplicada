#!/bin/bash

esLaborable(){
VAR = 2022/09/20
DIA=`date -d $VAR +%u`
DIA2=`date -d $VAR +%d/%m`
FERIADO=`cat feriados.txt | grep -w $DIA2`
echo "$FERIADO"
if [ $DIA = 6 ];then
	echo "No es laborable"
elif [ $DIA = 7 ];then
	echo "No es laborable"
elif [ $DIA = 0 ];then
	echo "No es laborable"
elif [ "$FERIADO" ];then
	echo "Es feriado, no es laborable"
else
	echo "Es laborable"
fi
}

esLaborable
