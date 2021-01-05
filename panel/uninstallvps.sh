#!/bin/bash
#Scripiter Penguin
#

menu ()
{

clear 
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Remover VPS manager" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "[1]"; tput setaf 6 ; printf '%s' "Realmente remover" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Removera nosso VPS manager e todas suas dependencias" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "[0] Voltar para o menu " ; tput sgr0 ; echo ""
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada:" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) option1 ;;
	0) panel2 ;;
esac
}

option1()
{
	rm -R /bin/squidconf
	rm -R /bin/alterarsenha
	rm -R /bin/criarusuario
	rm -R /bin/expcleaner
	rm -R /bin/mudardata
	rm -R /bin/remover
	rm -R /bin/sshlimiter
	rm -R /bin/alterarlimite
	rm -R /bin/panel
	rm -R /bin/sshmonitor
	rm -R /bin/speedtest
	rm -R /etc/penguin/speedtest.py
	rm -R /bin/usuarioteste
	rm -R /bin/banner
	rm -R /bin/systemdetails
	rm -R /bin/updatepack
	rm -R /bin/firewallblock
	rm -R /bin/versao
	rm -R /bin/limiter
	rm -R /bin/proxypanel
	rm -R /bin/badvpnsetup
	rm -R /bin/openvpnsetup
	rm -R /bin/tcptweaker
	rm -R /bin/userbackup
	rm -R /bin/webmininstall
	rm -R /bin/panel2
	rm -R /bin/automaticboot
	apt-get purge squid -y
    apt-get purge screen -y
    apt-get purge dos2unix -y
    apt-get purge apache2-utils -y
	rm -R /bin/uninstallvps
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "VPS MANAGER DESINSTALADO" ; tput sgr0 ; echo ""
    exit
}


menu

