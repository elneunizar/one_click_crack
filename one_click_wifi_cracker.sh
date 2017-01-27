#!/bin/bash

#declare an variabel for interface
declare -a interfaces
#declare an array variabel for monitor interface
declare -a mon_ints
#declare an variabel of transmission power
declare -A intTxPower
#read a list of interface 

#Get the transmision power
#and set the interface
function setInt {
	readarray -t monInt < <(iwconfig 2>&1 | egrep "[Mm]onit\w" | awk '{print $1}')
	readarray -t intInit < <(/usr/bin/airmon | grep "-" | cut -f 1)
	for i in ${intInit[@]}; do
		intTxPower[$i]=$(iwconfig $i | egrep -o "Tx-Power=[0-9]+ dBm" | egrep -o "[0-9]+")
	done
	let i=0
	for j in ${intTxPower[@]}; do
		if [ $j  > 60 ];
			if [ "${intInt[$((i++))]}" == "${monInt[$((i++))]}" ]; then
			       #i will done it with a function later
		       elif [ "${intInt[$((i++))]}" != "${monInt[$((i++))]}" ]; then
			       #i will done it with a function later
		       fi	       
	       fi
       done
	#echo ${intTxPower[wlan0]}
}
#Attack the wireless
function attackIt {
}

#for i in ${interfaces[@]}; do
#	echo ${intTxPower[i]}
#done

#enable monitor interface
#echo ${interfaces[@]}
#for i in ${interfaces[@]}; do
	#echo $i
#	airmon-ng start $i &>/dev/null
#done

#choose an monitor interface
#readarray -t mon_ints < <(iwconfig 2> /dev/null | egrep "\wmon | Monitor" | cut -d " " -f1)
#echo ${mon_ints[@]}
#if [ ${#mon_ints[@]} > 0 ]; then
#	echo ${mon_ints[@]}
#fi
### note ###
# belajar tentang wireless transmit power sebagai tolak ukur memilib interface #

