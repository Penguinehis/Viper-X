#!/bin/bash
#Scripiter Penguin
#

menu ()
{

clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Proxy Auth Panel" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Disable" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Desabilitara a autenticacao por Proxy" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|2|"; tput setaf 6 ; printf '%s' " Enable" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Habilitara a autenticacao por Proxy" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0|"; tput setaf 6 ; printf '%s' " Sair" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Simplesmente voltara para o menu" ; tput sgr0 ;
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) limiteron ;;
	2) limiteroff ;;
	3) reinstall ;;
	0) exit ;;
esac

}

limiteron()
{
IP=$(curl https://api.ipify.org/)
echo $IP
cd /etc/squid*
mv squid.confbak squid.conf1
mv squid.conf squid.confauth
mv squid.conf1 squid.conf
printf "#Bugado POR: PenguinEHIS\n
acl vps1 dstdomain -i 127.0.0.1\n
acl vps2 dstdomain -i localhost\n
acl vps3 dstdomain -i $IP\n
acl vps4 dstdomain -i .br\n
acl vps5 dstdomain -i .com\n
acl vps6 dstdomain -i .net\n
acl CONNECT method CONNECT\n
acl GET method GET\n
acl POST method POST\n
acl OPTIONS method OPTIONS\n
acl DELETE method DELETE\n
acl HEAD method HEAD\n
http_access allow vps1\n
http_access allow vps2\n
http_access allow vps3\n
http_access allow vps4\n
http_access allow vps5\n
http_access allow vps6\n
cache deny all\n
http_access deny all\n
http_port 80\n
http_port 3128\n
visible_hostname penguin\n
forwarded_for off\nvia off\n" > squid.conf
service squid restart
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Proxy Auth OFFILINE" ; tput sgr0 ; echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Nao e mais necessario autenticacao proxy" ; tput sgr0 ; echo ""
}

limiteroff()
{
clear
IP=$(curl https://api.ipify.org/)
echo $IP
cd /etc/squid*
mv squid.conf squid.confbak
mv squid.confauth squid.conf
service squid restart
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Proxy Auth Online" ; tput sgr0 ; echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Necessario autenticacao PROXY" ; tput sgr0 ; echo ""
}
menu
