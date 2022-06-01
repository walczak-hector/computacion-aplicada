#!/bin/bash 

# Se informa al usuario como obtener ayuda

echo "Para obtener ayuda ejecutar `basename $0` -h"

# Se informa al usuario el funcionamiento del script

if [ "$1" == "-h" ] && [ -z "$2" ]; then
	echo "El script realizara un backup del directorio y todo su contenido."
  echo "Para realizar un backup, ingrese la ubicacion del directorio de origen y como segundo el directorio donde se guardara"
  echo "Aclaracion, el script solo funcionara si se ingresan directorios como argumentos"
	exit
fi

# El primer argumento corresponde al directorio de origen y el segundo al destino

# Se verifica que los argumentos no esten vacios

if [ -z "$1" ] || [ -z "$2" ] 
then
	echo "No se ingresaron todos los argumentos"
	exit 2
fi

# Se verifica que se se hayan ingresado unicamente 2 argumentos

if [ ! -z "$3" ] 
then
	echo "Se ingresaron argumentos extras"
	exit 2
fi

# Se verifica que los argumentos sean directorios

if [ ! -d "$1" ]; then
	echo "$1 no es un directorio valido"
	exit 2
fi

if [ ! -d "$2" ]; then
	echo "$2 no es un directorio valido"
	exit 2
fi


#Realizamos el backup del directorio

X=`basename $1`
FECHA=$(date +%Y%m%d)
DESTINO="$2/${X}_bkp_$FECHA.tar.gz"
tar -cpzf $DESTINO $1
