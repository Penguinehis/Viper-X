#!/bin/bash
#Scripiter Penguin
#

menu ()
{

clear 
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Automatic BOOT" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' "Install" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Ativa o Auto Start do Painel ao logar" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|2|"; tput setaf 6 ; printf '%s' "Remove" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Desativa o autostart do Painel ao logar" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0| Voltar para o menu " ; tput sgr0 ; echo ""
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada:" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) option1 ;;
	2) option2 ;;
	0) panel2 ;;
esac
}

option1()
{
clear
cd $USER
echo "panel" >> .bash_login
clear 
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Auto BOOT Ativado" ; tput sgr0 ; echo ""
exit
}

option2()
{
clear
cd $USER
rm -R .bash_login
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Auto BOOT Desativado" ; tput sgr0 ; echo ""
exit
}

menu

