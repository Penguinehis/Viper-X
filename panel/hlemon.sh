#!/bin/bash
#Scripiter Penguin
#

menu ()
{

clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "HTOP" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Install" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Instalara o HTOP monitor em tempo real dos recursos da VPS" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|2|"; tput setaf 6 ; printf '%s' " Htop" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "abrira o Htop" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0|"; tput setaf 6 ; printf '%s' " Sair" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Simplesmente voltara para o menu" ; tput sgr0 ;
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) install ;;
	2) mloak ;;
	0) exit ;;
esac

}

install()
{
apt-get install htop
menu
}

mloak()
{
htop
panel2
}

menu