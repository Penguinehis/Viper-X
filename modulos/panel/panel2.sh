#!/bin/bash
#Scripiter Penguin
#
IP=$(wget -q -qO- https://bigbolgames.com)
clear
menu ()
{

clear 
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Viper X 1.11" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' "Panel Auto Start" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Ativar ou desativar o auto boot do painel" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|2|"; tput setaf 6 ; printf '%s' "OpenVPN Com Validade" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Criar usuarios OpenVPN com Validade (PS: Nescessario instalar o OpenVPn Primeiro)" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|3|"; tput setaf 6 ; printf '%s' "Userpass.conf Generator" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Cria o arquivo userpass.conf usado no OpenVpn Proxy Autentication Nescessario se o proxy auth estiver ativo" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|4|"; tput setaf 6 ; printf '%s' "OpenVPN Com Proxy Auth" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Criar usuarios OpenVPN com Validade (PS: Nescessario instalar o OpenVPn Primeiro, gerar userpass.conf primeiro)" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "Nothen"; tput setaf 6 ; printf '%s' " ****************** Monitor de Recursos ****************" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "No description " ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|5|"; tput setaf 6 ; printf '%s' "Monitoramento de Uso de banda" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Nload Verifique o use de banda de sua VPS" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|6|"; tput setaf 6 ; printf '%s' "Monitoramento de Recursos em tempo real da VPS" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Htop Monitore em tempo real o uso de CPU e memoria ram de seu VPS" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "Nothen"; tput setaf 6 ; printf '%s' " ****************** Monitor de Recursos ****************" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "No description " ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|23|"; tput setaf 6 ; printf '%s' "Pagina anterior" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Mudar a pagina de comandos " ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|455896|"; tput setaf 6 ; printf '%s' "Desinstalar" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Remove o VPS manager e suas dependencias" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0| Sair " ; tput sgr0 ; echo ""
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Pagina 2/2" ; tput sgr0 ; echo ""
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "IP VPS: $IP" ; tput sgr0 ; echo ""
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada:" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) option1 ;;
	2) option2 ;;
    3) option3 ;;
	4) option4 ;;
    5) option5 ;;
	6) option6 ;;
	23) option23 ;;
	455896)option455896 ;;
esac
}

option1()
{
automaticboot
sleep 5
menu
}

option2()
{
vpntime
sleep 5
menu
}

option3()
{
userpassgenerator
menu
}

option4()
{
vpnauth
sleep 5
menu
}

option5()
{
nloadpanel
sleep 3
menu
}

option6()
{
hlemon
sleep 3
menu
}

option23()
{
panel
}

option455896()
{
uninstallvps
}

menu

