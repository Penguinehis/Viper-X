#!/bin/bash
#Scripiter Penguin
#

menu ()
{

clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "UPDATE Manager" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Install" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Iniciara o update do VPS Manager" ; tput sgr0 ;
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
    rm -R /bin/updatepackinstall
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/updater/updatepackinstall.sh -O /bin/updatepackinstall
	chmod +x /bin/updatepackinstall
	updatepackinstall
	clear
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Update concluido" ; tput sgr0 ; echo ""
	exit
}

menu

