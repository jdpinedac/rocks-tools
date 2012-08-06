#!/bin/bash

declare -a TEMP

TEMP=`rocks run host "ipmitool sdr type Temperature" | grep CPU | grep degrees | sed -e 's/.* \([0-9]*\) degrees C$/\1/'`

TOTAL_TMP=0
NUM=0

for tmp in ${TEMP[*]}
do
    TOTAL_TMP=`expr $TOTAL_TMP + $tmp`
    NUM=`expr $NUM + 1`
done

TOTAL_TMP=`expr $TOTAL_TMP / $NUM`


echo "la temperatura promedio de $NUM procesadores es":
echo "$TOTAL_TMP Grados Centigrados"
