#!/bin/bash
#Scripiter Penguin
#

menu ()
{

clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "SSH Limiter Panel" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Enable" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Habilitara o FirewallBlock" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|2|"; tput setaf 6 ; printf '%s' " Disable" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Desabilitara o FirewallBlock" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|3|"; tput setaf 6 ; printf '%s' " Dependencias" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "ira Instalar as dependencias se nescessario" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0|"; tput setaf 6 ; printf '%s' " Sair" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Simplesmente voltara para o menu" ; tput sgr0 ;
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) firewallblock ;;
	2) resetfirewall ;;
	3) dependencias ;; 
	0) exit ;;
esac

}

dependencias()
{
apt-get install iptables -y
}

firewallblock()
{
read -p "Digite o ip do vps: " ip
echo Configurando...
sleep 1
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t filter -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -d $ip --dport 443 -m state --state NEW -j ACCEPT
iptables -A OUTPUT -p tcp -d $ip --dport 80 -m state --state NEW -j ACCEPT
iptables -A OUTPUT -p tcp -d $ip --dport 1194 -m state --state NEW -j ACCEPT
iptables -A OUTPUT -p tcp --dport 53 -m state --state NEW -j ACCEPT
iptables -A OUTPUT -p udp --dport 53 -m state --state NEW -j ACCEPT
iptables -A OUTPUT -p tcp --dport 67 -m state --state NEW -j ACCEPT
iptables -A OUTPUT -p udp --dport 67 -m state --state NEW -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -p tcp --dport 1194 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 1194 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp --dport 1194 -j ACCEPT
iptables -A FORWARD -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p icmp --icmp-type echo-request -j DROP
iptables -A INPUT -p tcp --dport 10000 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 10000 -j ACCEPT
echo -e "\033[1;37mFirewall modificado
Portas 443 22 1194 80
Bloqueio ICMP
Bloqueio Torrent\033[0m"
}

resetfirewall(){
iptables -F
iptables -X
iptables -t mangle -F
iptables -t mangle -X
iptables -t nat -F
iptables -t nat -X
iptables -t filter -F
iptables -t filter -X
echo "Regras resetadas"
}
menu

