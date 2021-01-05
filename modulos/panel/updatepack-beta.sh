#!/bin/bash
#Scripiter Penguin
#

menu ()
{

clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Viper Updater" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Install" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Iniciara a atualização / Reparo do Script Viper" ; tput sgr0 ;
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
	wget -q http://vipernk.anasor.com/sh/updatepackinstall.sh -O /bin/updatepackinstall
	chmod +x /bin/updatepackinstall
	updatepackinstall
	echo "Verificando Updates"
	echo "Verficado iniciando Updater"
	echo "Concluido"
	exit
}

menu

