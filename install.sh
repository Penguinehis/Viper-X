#!/bin/bash
#Scripiter Penguin
#

menu ()
{

clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Installer 1.0" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Install" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Iniciara o instalador do Viper X" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0|"; tput setaf 6 ; printf '%s' " Sair" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Simplesmente voltara para o menu" ; tput sgr0 ;
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
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Insira o serial que lhe foi enviado" ; tput sgr0 ; echo ""
	read serial
	wget -q viperx.anasor.com/install/$serial/viperx.sh
	chmod 777 viperx.sh
	./viperx.sh
	rm -R viperx.sh
	cd /etc/
	rm -R penguinvps
	cd
	clear
	exit
}

menu