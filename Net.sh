#!/bin/bash 

#########################################################################
# ./Internet.sh								#
# +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ #
#   Script que liga|desliga wifi através de parâmetros		 	#
#									#
# CRIAÇÃO: 04/09/2020 							#
#########################################################################
HELP='
NAME
        Net.sh

SYNOPSIS:
        Net.sh [parameter]

DESCRIPTION:
        Script that turns Wifi on and off on already saved networks.

        -e      Wifi connection

        -d      Turn off wifi 

        -h      View help in prompt.

EXIT STATUS:
        0       if Ok;
        1       if wifi never be conected;

[BUG] 
	The command works only if any network is already "connected",that is,
	it connects to already saved networks.

AUTHOR
       Written by Fernando 7iger ----- <https://github.com/f7iger>
'

WIFI=$(nmcli radio wifi)
DISATIVADO=$(nmcli radio wifi |grep disabled) 
ATIVADO=$(nmcli radio wifi |grep enabled) 


ligar_wifi (){
MSG0="+++++Wifi is on!+++++"
MSG1="+++++Wifi is off!+++++"
	case $1 in 
	 	-e) 
			if [ $WIFI = $DISATIVADO ] 
			then 
				echo "$MSG0"
				nmcli radio wifi on 
				exit 0 
			fi #fim do fi 
			;;
		-d) 
			if [ $WIFI = $ATIVADO ]
			then 
				echo "$MSG1"  
				nmcli radio wifi off 
				exit 0 
			fi 
			;;
		-h) 
			echo "$HELP"
			exit 0
	esac
}
ligar_wifi $1

