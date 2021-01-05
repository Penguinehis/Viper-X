#!/bin/bash
#Scripiter Penguin
#

menu ()
{

clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Webmin Install" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Install" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Iniciara a instalacao automatica do webmin" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|2|"; tput setaf 6 ; printf '%s' " Remove" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Iniciara a remocao automatica do webmin" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0|"; tput setaf 6 ; printf '%s' " Sair" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Simplesmente voltara para o menu" ; tput sgr0 ;
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) installwebmin ;;
	2) removewebmin ;;
	0) exit ;;
esac

}

installwebmin()
{
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Iniciando instalacao" ; tput sgr0 ; echo ""
mkdir webmininstall
cd webmininstall
wget http://prdownloads.sourceforge.net/webadmin/webmin_1.831_all.deb
dpkg -i webmin_1.831_all.deb
apt-get -f install
rm -R webmin_1.831_all.deb
cd $USER
rm -R webmininstall
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Instalacao Completa para acessar" ; tput sgr0 ; echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "O painel Webmin digite em seu navegador" ; tput sgr0 ; echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "https://IPDAVPS:10000" ; tput sgr0 ; echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Se der erro de seguranca no navegador so mandar" ; tput sgr0 ; echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Proceguir para pagina mesmo assim" ; tput sgr0 ; echo ""
}

removewebmin()
{
clear
apt-get purge webmin -y
apt-get autoremove -y
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Removido com sucesso" ; tput sgr0 ; echo ""
}

menu

