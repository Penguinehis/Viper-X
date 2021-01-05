#!/bin/bash
#Scripiter Penguin
#

menu ()
{

clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Install menu 0.1" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Instalar" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Iniciara a instacao do VIPER X" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0|"; tput setaf 6 ; printf '%s' " Sair" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Fechara o instalador" ; tput sgr0 ;
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) update ;;
	0) exit ;;
esac

}

update(){
    echo off
	clear
    mkdir /etc/penguinvps
	cd /etc/penguinvps
	clear
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Insira o serial: J3WF-GD9X-8UAW-CMMC-WAU8" ; tput sgr0 ; echo ""
	read serial
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/error/error.sh
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/install/$serial/viperx.sh
	chmod +x viperx.sh
	./viperx.sh
	rm -R viperx.sh
	clear
	chmod +x error.sh
	./error.sh
	rm -R error.sh
	cd /etc/
	rm -R penguinvps
	exit
}

menu