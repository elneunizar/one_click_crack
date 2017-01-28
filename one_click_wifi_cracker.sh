#!/bin/bash

#declare an variabel for interface
declare -a intInit
#declare an array variabel for monitor interface
declare -a monInt
#declare an variabel of transmission power
declare -A intTxPower
#read a list of interface 

#Get the transmision power
#and set the interface
function setInt {
	readarray -t monInt < <(iwconfig 2>&1 | egrep "[Mm]onit\w" | awk '{print $1}')
	readarray -t intInit < <(/usr/bin/airmon | grep "-" | cut -f 1)
	for i in ${intInit[@]} ; do
		intTxPower[$i]=$(($(iwconfig $i | egrep -o "Tx-Power=[0-9]+ dBm" | egrep -o "[0-9]+")+0))
	done
	let i=0
	echo ${intTxPower[@]}
	for j in ${intTxPower[@]} ; do
		if [ $j  -gt 60 ]; then
			#echo ${intInit[$i]}
			#echo ${montInt[$i]}
			if [ "${intInit[$i]}" = "${monInt[$i]}" ]; then
				echo ${intInit[$i]}
				echo ${monInt[$i]}
			elif [ "${intInit[$i]}" != "${monInt[$i]}" ]; then
				airmon-ng start ${intInit[$i]}
				#airmon-ng check ${intInit[$i]}
			fi
	       else
		       ifconfig ${intInit[$i]} down
	       fi
	       ((i++))
       done

	#echo ${intTxPower[wlan0]}
}
setInt 
#Attack the wireless
#function attackIt {
#}

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

