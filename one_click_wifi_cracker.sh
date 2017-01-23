#!/bin/bash
#read a list of interface 
declare -a interfaces
#let i=0
readarray -t interfaces < <(/usr/bin/airmon | grep "-" | cut -f 1) 
#echo ${interfaces[@]}
#(( i=0 ))
#echo $i
#echo ${interfaces[i]}
#while (( ${#interfaces[*]} > i  )); do
#	echo ${interafaces[i]}
#	(( i++ ))
#done
#echo $i

#choose an interface
echo ${interfaces[@]}
for i in ${interfaces[@]}; do
	#echo $i
	airmon-ng start $i
done
