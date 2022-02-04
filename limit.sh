#!/bin/bash

srututu=0
read -p "napisz ile razy robic (w sekundach) " x
while [ $srututu -le $x ];
do
slabe="${RANDOM:0:2}"
if [ -d wondershaper ]; then
	echo CHOKE
	echo $slabe
	wondershaper -a eno1 -d $slabe -u $slabe
	sleep 1
	wondershaper -c -a eno1
	srututu=$(( $srututu + 1 ))
else
	wget "https://raw.githubusercontent.com/DorkYBru/Limiter-Neta-na-zdalne/main/installwondershaper.sh"
	bash installwondershaper.sh.1
		fi
		done