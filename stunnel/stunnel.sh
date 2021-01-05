#!/bin/bash
#Scripiter Penguin
#

# Color Codes

#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37

menu()
{
black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
browno='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
lightgray='\033[0;37m'
darkgray='\033[1;30m'
lightred='\033[1;31m'
lightgreen='\033[1;32m'
yellow='\033[1;33m'
lightblue='\033[1;34m'
lightpurple='\033[1;35m'
lightcyan='\033[1;36m'
white='\033[1;37m'
port2=$(lsof -i -P -n | grep LISTEN | grep stunnel | sed -n -e '1{s/^.*://p}')
check2=$(lsof -i -P -n | grep LISTEN | grep stunnel | sed -n -e '1{s/^.*://p}')
clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "SSL TUNNEL" ; tput sgr0 ; echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf "${red}Portas abertas: " ; echo $port2 | sed -n 's_([^ ]*__p' ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Instalar" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Instalar o SSL Tunnel" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|2|"; tput setaf 6 ; printf '%s' " Mudar porta" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Mudar a porta do SSL Tunnel" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|3|"; tput setaf 6 ; printf '%s' " Desinstalar" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Desinstalara o SSL Tunnel" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0|"; tput setaf 6 ; printf '%s' " Voltar para o menu" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Simplesmente voltara para o menu" ; tput sgr0 ;
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) install ;;
	2) change ;;
	3) remove ;;
	0) exit ;;
esac

}
install()
{
printf "Por favor digite a ${red}porta ${white} para o Stunnel: "
read port
if [ -z "$port" ]; then
echo "Porta vazia "
sleep 2
install
else
if [[ "$check2" == *"$port"* ]]; then
printf "${green}Stunnel Ja esta Instalado nesta Porta: ${red}" ; echo -e $check2 | sed -n 's_([^ ]*__p' ; printf "${white}"
sleep 3
install 
else
clear
printf "${green}Stunnel será instalado na porta ${red}$port ${white}"
sleep 3
apt-get update 
apt-get install stunnel -y
clear 
printf "${green}Iniciando Configuracao do Stunnel${white}"
sleep 2
clear 
cd /etc/stunnel
if [ -e "stunnel.conf" ]; then
mv stunnel.conf stunnel.conf.bak
fi
echo -e "cert = /etc/stunnel/cert.pem \n client = no \n socket = a:SO_REUSEADDR=1 \n socket = l:TCP_NODELAY=1 \n socket = r:TCP_NODELAY=1 \n [stunnel] \n connect = 127.0.0.1:22 \n accept = $port" >> /etc/stunnel/stunnel.conf
sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/stunnel4
wget -q https://bigbolgames.com/viperx/cert.dragon
mv cert.dragon cert.pem
service stunnel4 restart 
clear
check3=$(lsof -i -P -n | grep LISTEN | grep stunnel | sed -n -e '1{s/^.*://p}')
if [[ "$check3" == *"$port"* ]]; then
clear
printf "${green}Stunnel Instalado na Porta: ${red}" ; echo $check3 | sed -n 's_([^ ]*__p' ; printf "${white}"
cd $USER
sleep 5
menu
else
clear
printf "${red}Stunnel Nao instalado revertendo modificacoes${white}"
sleep 5
apt-get purge stunnel4 -y 
rm -R -f /etc/stunnel
rm -R -f /etc/default/stunnel4
clear 
printf "${red}Stunnel REMOVIDO${white}"
cd $USER
sleep 3
menu
fi 
fi
fi
}

change()
{
clear
check2=$(lsof -i -P -n | grep LISTEN | grep stunnel | sed -n -e '1{s/^.*://p}')
printf "Por favor digite a ${red}porta ${white} para o Stunnel: "
read port
if [ -z "$port" ]; then
clear
echo "Porta vazia "
sleep 2
change
else
if [[ "$check2" == *"$port"* ]]; then
clear
printf "${green}Stunnel Ja esta Instalado nesta Porta: ${red}" ; echo -e $check2 | sed -n 's_([^ ]*__p' ; printf "${white}"
sleep 3
change 
else
cd /etc/stunnel
if [ -e "stunnel.conf.bak" ]; then
rm -R -f stunnel.conf.bak
fi
mv stunnel.conf stunnel.conf.bak
echo -e "cert = /etc/stunnel/cert.pem \n client = no \n socket = a:SO_REUSEADDR=1 \n socket = l:TCP_NODELAY=1 \n socket = r:TCP_NODELAY=1 \n [stunnel] \n connect = 127.0.0.1:22 \n accept = $port" >> /etc/stunnel/stunnel.conf
service stunnel4 restart
check3=$(lsof -i -P -n | grep LISTEN | grep stunnel | sed -n -e '1{s/^.*://p}')
if [[ "$check3" == *"$port"* ]]; then
clear
printf "${green}Porta Stunnel Alterada para${red} : " ; echo -e $check3 | sed -n 's_([^ ]*__p' ; printf "${white}"
sleep 5
menu
else
rm -R -f stunnel.conf 
mv stunnel.conf.bak stunnel.conf
check4=$(lsof -i -P -n | grep LISTEN | grep stunnel | sed -n -e '1{s/^.*://p}')
clear
printf "${green}Erro ao alterar a porta, Revertida para : ${red} " ; echo -e $check4 | sed -n 's_([^ ]*__p' ; printf "${white}"
sleep 5
menu
fi
fi
fi
}
remove()
{
printf "${red} DESEJA REALMENTE REMOVER O SSL TUNNEL? digite 0129 : "
read rmd
if [[ "$rmd" == *"0129"* ]]; then
printf "${red} ULTIMA CHANCE DE CANCELAR em 10 SEGUNDOS SERA REMOVIDO DE CTRL + C SE DESEJA CANCELAR"
sleep 11
clear
service stunnel4 stop
apt-get remove stunnel4 -y
apt-get purge stunnel4 -y 
rm -R -f /etc/stunnel
rm -R -f /etc/default/stunnel4
else 
printf "${red} REMOCAO CANCELADA"
sleep 5
menu
fi
}
menu