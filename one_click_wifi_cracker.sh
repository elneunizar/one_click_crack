#!/bin/bash
#read a list of interface 
declare -a interfaces
#let i=0
readarray -t interfaces < <(/usr/bin/airmon | grep "-" | cut -f 1) 
#choose an interface
echo ${interfaces[@]}
for i in ${interfaces[@]}; do
	#echo $i
	airmon-ng start $i >& /dev/null

	#choose an monitor interface
	declare -a mon_ints
	readarray -t mon_ints < <(iwconfig | egrep "\wmon | Monitor" | cut -d " " -f1) >& /dev/null
	echo ${mon_ints[@]}
	#mon_int=$(iwconfig | egrep "\wmon | Monitor" | cut -d " " -f1) >& /dev/null
	echo $mon_int
	#For every process of aircrack
done
