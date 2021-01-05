#!/bin/bash
#Scripiter Penguin
#

menu ()
{

clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Speed Test" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "1 / Iniciar teste da conecxao " ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "0 / Sair do Speed test " ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "Digite a opcao desejada: " ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) speedtest ;;
	0) exit ;;
esac

}

speedtest()
{
python /etc/penguin/speedtest.py

exit
}

menu

