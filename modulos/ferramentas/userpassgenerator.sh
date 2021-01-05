#!/bin/bash
#by penguin
menu ()
{

clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "UserPassGenerator" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Gerar" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Gera o Arquivo userpass.conf usado no OPENVPN AUTH" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0|"; tput setaf 6 ; printf '%s' " Sair" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Simplesmente voltara para o menu" ; tput sgr0 ;
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) gerar ;;
	0) exit ;;
esac

}

gerar()
{
clear
cd $USER
mkdir ovpnauth
clear
cd ovpnauth
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Insira o Login do Squid Autentication" ; tput sgr0 ; echo ""
read login
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Insira a Senha do Squid Autentication" ; tput sgr0 ; echo ""
read senha
echo ""
echo $login
echo $senha 
printf "$login
$senha" > userpass.conf
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Arquivo Gerado com Sucesso" ; tput sgr0 ; echo ""
sleep 4
exit
}

menu