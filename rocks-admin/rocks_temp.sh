#!/bin/bash

#array for storing the data

declare -a TEMP

#get and parse the data

TEMP=`rocks run host "ipmitool sdr type Temperature" | grep CPU | grep degrees | sed -e 's/.* \([0-9]*\) degrees C$/\1/'`

#some useful variables for the average calculus.

TOTAL_TMP=0
NUM=0

#you know what this loop does, aren't you?

for tmp in ${TEMP[*]}
do
    TOTAL_TMP=`expr $TOTAL_TMP + $tmp`
    NUM=`expr $NUM + 1`
done

#as you can expect, this calculate the average 
#of the temperature on every node in the cluster

TOTAL_TMP=`expr $TOTAL_TMP / $NUM`



echo "the average temperature of $NUM cores is":
echo "$TOTAL_TMP C degrees"

#just like magic, isn't it?
