#!/bin/bash
#Scripiter Penguin
#

menu ()
{

clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "SSH Limiter Panel" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Enable" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Habilitara o SSH Limiter" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|2|"; tput setaf 6 ; printf '%s' " Disable" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Desabilitara o SSH Limiter" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0|"; tput setaf 6 ; printf '%s' " Sair" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Simplesmente voltara para o menu" ; tput sgr0 ;
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) limiteron ;;
	2) limiteroff ;;
	0) exit ;;
esac

}

limiteron()
{
clear
screen -d -m sshlimiter
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Limiter ONLINE" ; tput sgr0 ; echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Para verificar usuarios online use o comando" ; tput sgr0 ; echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "sshmonitor" ; tput sgr0 ; echo ""
exit
}

limiteroff()
{
clear
echo "Verificando Screens ONLINE"
screen -list
echo "Por Favor Insira o ID do Screen que deseja parar (Normalmente Tem apenas 1)"
read sistem
screen -X -S $sistem quit
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Limiter OFFILINE" ; tput sgr0 ; echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Para verificar usuarios online use o comando" ; tput sgr0 ; echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "sshmonitor" ; tput sgr0 ; echo ""
}
menu

