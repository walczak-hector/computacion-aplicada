#!/bin/bash 
TIEMPO=`date +"%H:%M:%S"`

# Se informa al usuario como obtener ayuda

if [ -z "$1" ] && [ -z "$2" ]; then
	echo "Para obtener ayuda ejecutar `basename $0` -h"
	exit 2
fi

# Se informa al usuario el funcionamiento del script

if [ "$1" == "-h" ] && [ -z "$2" ]; then
	echo "El script realizara un backup del directorio y todo su contenido."
	echo "Para realizar un backup, ingrese la ubicacion del directorio de origen y como segundo el directorio donde se guardara"
	echo "Aclaracion, el script solo funcionara si se ingresan directorios como argumentos"
	exit
fi

# El primer argumento corresponde al directorio de origen y el segundo al destino

# Se verifica que los argumentos no esten vacios
echo "$TIEMPO - Verificando que los argumentos no esten vacios"

if [ -z "$1" ]; then
	echo "$TIEMPO No se ingreso el directorio de origen"
	exit 2
fi

if [ -z "$2" ]; then
	echo "$TIEMPO No se ingreso el directorio destino"
	exit 2
fi

# Se verifica que se se hayan ingresado unicamente 2 argumentos
echo "$TIEMPO - verificando que se se hayan ingresado unicamente 2 argumentos"

if [ ! -z "$3" ]; then
	echo "$TIEMPO Se ingresaron argumentos extras"
	exit 2
fi

# Se verifica que los argumentos sean directorios
echo "$TIEMPO - Verificando que los argumentos sean directorios"

if [ ! -d "$1" ]; then
	echo "$TIEMPO $1 no es un directorio valido"
	exit 2
fi

if [ ! -d "$2" ]; then
	echo "$TIEMPO $2 no es un directorio valido"
	exit 2
fi


#Realizamos el backup del directorio
echo "$TIEMPO - Comenzando el proceso de backup"

X=`basename $1`
FECHA=$(date +%Y%m%d)
DESTINO="$2/${X}_bkp_$FECHA.tar.gz"
echo "$TIEMPO - "tar -cpzf $DESTINO $1 > /u03/log.log

#Informamos si se realizo el backup correctamente o no

STATUS=`echo "$?"`

if [ $STATUS -eq 0 ]; then
	echo "$TIEMPO - Se ha realizado el backup de ${X} satisfactoriamente" 
else
	echo "$TIEMPO - No se pudo realizar el backup de ${X}"
fi
