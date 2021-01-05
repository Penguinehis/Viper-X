#!/bin/bash
#Scripiter Penguin
#
IP=$(wget -q -qO- viperx.anasor.com)
clear
menu ()
{

clear 
tput setaf 5 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Viper X 1.11" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Create user" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Crie um Usuario Para sua VPS (Login Apenas via SSH Tunnel)" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|2|"; tput setaf 6 ; printf '%s' " User Temp" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "crie um usuario temporario mais facilmente com este modulo" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|3|"; tput setaf 6 ; printf '%s' " Mudar Limite do usuario" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo " Altere quantos logins o usuario pode ter ao mesmo tempo" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|4|"; tput setaf 6 ; printf '%s' " Alterar a senha do Login" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Altere a senha do Login SSH Tunnel" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|5|"; tput setaf 6 ; printf '%s' " Remover Login" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Remova o login de sua VPS" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|6|"; tput setaf 6 ; printf '%s' " Change Date" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Muda a data de vencimento do Login SSH Tunnel" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|7|"; tput setaf 6 ; printf '%s' " Limpar Expirados" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Limpe os logins que expiraram" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|8|"; tput setaf 6 ; printf '%s' " User Backup" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Efetuar Backup dos Usuarios" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|9|"; tput setaf 6 ; printf '%s' " SSH Monitor" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "monitore os logins de sua VPS atualmente ativos" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|10|"; tput setaf 6 ; printf '%s' " Panel Sshlimiter" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Ativar ou desativar o SSH limiter" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|11|"; tput setaf 6 ; printf '%s' " Proxy Panel" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Alternar entre Proxy Auth e Proxy Single" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|12|"; tput setaf 6 ; printf '%s' " User Squid Auth" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Crie um usuario novo / altere sua senha para o ProxyAuth" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|13|"; tput setaf 6 ; printf '%s' " Firewall Torrent Block" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Bloqueie o Torrent Via Firewall (Uso excessivo dos recursos)" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|14|"; tput setaf 6 ; printf '%s' " Banner Set" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Insira um banner mais facilmente usando este modulo" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|15|"; tput setaf 6 ; printf '%s' " System Details" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Verificar os detalhes e uso de recursos da sua VPS" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|16|"; tput setaf 6 ; printf '%s' " Speed Test" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Verifique a velocidade de sua conexcao usando este modulo" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|17|"; tput setaf 6 ; printf '%s' " Versao" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Verificar a versao do seu VPS Manager" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|18|"; tput setaf 6 ; printf '%s' " Updater Manager" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Faça o Update de seu manager e seus modulos" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|19|"; tput setaf 6 ; printf '%s' " BadVPN Setup"; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Instalador do badvpn automatico " ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|20|"; tput setaf 6 ; printf '%s' " OpenVPNSetup"; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Instalador e Painel do OpenVPN" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|21|"; tput setaf 6 ; printf '%s' " TCPTweaker" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "No Description" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|22|"; tput setaf 6 ; printf '%s' " Webmin Installer" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Installador / Remover do painel WEBMIN " ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|23|"; tput setaf 6 ; printf '%s' " Proxima Pagina" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Mudar a pagina de comandos " ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|100|"; tput setaf 6 ; printf '%s' " RebootVPS" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Reiniciar a VPS"; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0| Sair " ; tput sgr0 ; echo ""
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Pagina 1/2" ; tput sgr0 ; echo ""
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "IP VPS: $IP" ; tput sgr0 ; echo ""
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada:" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) option17 ;;
	2) option12 ;;
	3) option15 ;; 
	4) option16 ;;
	5) option20 ;;
	6) option19 ;;
	7) option18 ;;
	8) option4 ;;
	9) option21 ;;
	10) option6 ;;
	11) option5 ;;
	12) option14 ;;
	13) option9 ;;
	14) option11 ;;
	15) option10 ;;
	16) option13 ;;
	17) option8 ;;
	18) option7 ;;
	19) option1 ;;
	20) option2 ;;
	21) option3 ;;
	22) option22 ;;	
	23) option23 ;;	
	100) option666 ;;	
	0) exit ;;
esac
}

option1()
{
badvpnsetup
sleep 10
menu
}

option2()
{
openvpnsetup
sleep 10
menu
}

option3()
{
tcptweaker
sleep 10
menu
}

option4()
{
userbackup
sleep 10
menu
}

option5()
{
echo " "
proxypanel
sleep 5
menu
}

option6()
{
echo " "
limiter
sleep 3
menu
}

option7()
{
echo " "
updatepack
sleep 3
menu
}

option8()
{
echo " "
versao
sleep 3
menu
}

option9()
{
echo " "
firewallblock
sleep 3
menu
}

option10()
{
echo " "
systemdetails
sleep 10
menu
}

option11()
{
echo " "
banner
sleep 3
menu
}

option12()
{
echo " "
usuarioteste
sleep 3
menu
}

option13()
{
echo " "
speedtest
sleep 10
menu
}

option14()
{
echo " "
squidconf
sleep 10
menu
}

option15()
{
echo " "
alterarlimite
sleep 3
menu
}

option16()
{
echo " "
alterarsenha
sleep 3
menu
}

option17()
{
echo " "
criarusuario
sleep 3
menu
}

option18()
{
echo " "
expcleaner
sleep 3
menu
}

option19()
{
echo " "
mudardata
sleep 3
menu
}

option20()
{
echo " "
remover
sleep 3
menu
}

option21()
{
echo " "
sshmonitor
sleep 12
menu
}

option22()
{
echo " "
webmininstall
sleep 10
menu
}

option23()
{
panel2
}

option666()
{
shutdown -r 0
}

menu

