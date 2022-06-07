#!/bin/bash

# El pidof devuelve el ID de un proceso que se esta ejecutando. 

PID=`pidof $1`

# Si se encontro el ID del proceso, se informa que se esta ejecutando. Caso contrario se informa que no se esta ejecutando.

if [  "$PID" ];then
	echo "$1 se esta ejecutando"
else
	echo "$1 no se esta ejecutando"
fi
