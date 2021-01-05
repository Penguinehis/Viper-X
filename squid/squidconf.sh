#!/bin/bash
#Scripiter Penguin
#

menu ()
{
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Proxy Users 2.0" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Criar novo usuario ou editar usuario existente" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Iniciara a edicao / criacao do novo usuario" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|2|"; tput setaf 6 ; printf '%s' " Limpar todos os usuarios do proxy autenticado" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Remover todos usuarios e criar um novo" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0|"; tput setaf 6 ; printf '%s' " Sair" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Simplesmente voltara para o menu" ; tput sgr0 ;
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) squiduser ;;
	2) squidclean ;;
	0) exit ;;
esac

}
squidclean()
{
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Insira o novo usuario padrao do sistema Squid Autenticado" ; tput sgr0 ; echo ""
read squid
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a senha para o mesmo" ; tput sgr0 ; echo ""
htpasswd -c /etc/squid3/passwd $squid
service squid restart
clear 
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Todos usuarios removidos apenas o usuario $squid está operando atualmente" ; tput sgr0 ; echo ""
sleep 5
}
squiduser()
{
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Insira o novo/antigo usuario do Squid Autenticado" ; tput sgr0 ; echo ""
read squid
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a senha para o mesmo" ; tput sgr0 ; echo ""
htpasswd -m /etc/squid3/passwd $squid
service squid restart
clear 
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Usuario $squid adicionado/editado com sucesso" ; tput sgr0 ; echo ""
sleep 5
}

menu