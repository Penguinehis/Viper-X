#!/bin/bash
#Scripiter Penguin
#

menu ()
{
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Banner Editor" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Inserir" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Iniciara o modulo de edicao do banner" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0|"; tput setaf 6 ; printf '%s' " Sair" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Simplesmente voltara para o menu" ; tput sgr0 ;
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) banner ;;
	0) exit ;;
esac

}

banner(){
sshd_config_bak=$(cat /etc/ssh/sshd_config |grep -v "Banner")
echo "$sshd_config_bak" > /etc/ssh/sshd_config
echo "Banner /etc/bannerssh" >> /etc/ssh/sshd_config
service ssh restart 1>/dev/null 2>/dev/null
service sshd restart 1>/dev/null 2>/dev/null
if [ -f /etc/bannerssh ]
then
banner=$(cat /etc/bannerssh)
else
banner="Não há um banner no momento"
fi
echo -e "\033[1;32mBanner atual\n\n\033[1;37m$banner\n\033[0m"
echo "Qual banner deseja adicionar (ctrl + c para sair )"
read -p ": " bannerssh
echo "$bannerssh" > /etc/bannerssh
service ssh restart 1> /dev/null 2>/dev/null
service sshd restart 1>/dev/null 2>/dev/null
}

menu

