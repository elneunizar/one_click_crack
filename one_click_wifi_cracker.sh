#!/bin/bash

#declare an variabel for interface
declare -a interfaces
#declare an array variabel for monitor interface
declare -a mon_ints
#read a list of interface 
#let i=0
readarray -t interfaces < <(/usr/bin/airmon | grep "-" | cut -f 1) 

#enable monitor interface
#echo ${interfaces[@]}
for i in ${interfaces[@]}; do
	#echo $i
	airmon-ng start $i &>/dev/null
done

#choose an monitor interface
readarray -t mon_ints < <(iwconfig 2> /dev/null | egrep "\wmon | Monitor" | cut -d " " -f1)
echo ${mon_ints[@]}

