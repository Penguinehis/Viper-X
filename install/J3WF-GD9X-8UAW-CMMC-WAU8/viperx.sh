#!/bin/bash
clear
echo ""
echo ""
echo ""
echo ""
tput setaf 6 ; echo "||          ||  ||  ||------   ||||||||  ||------    " ; tput sgr0
tput setaf 6 ; echo " ||        ||       ||      /  ||        ||      /   " ; tput sgr0
tput setaf 6 ; echo "  ||      ||    ||  ||------   ||||||||  ||------    " ; tput sgr0
tput setaf 6 ; echo "   ||    ||     ||  ||         ||        ||     ||   " ; tput sgr0
tput setaf 6 ; echo "    ||  ||      ||  ||         ||        ||      ||  " ; tput sgr0
tput setaf 6 ; echo "      ||        ||  ||         ||||||||  ||       || " ; tput sgr0
echo ""
tput setaf 5 ; echo "    XX    XX        X  XXXX   XXXXXXXX" ; tput sgr0
tput setaf 5 ; echo "     XX  XX        X  XX XX   X    X X" ; tput sgr0
tput setaf 5 ; echo "       XX         X  XX  XX   X   X  X" ; tput sgr0
tput setaf 5 ; echo "     XX  XX      X       XX   X  X   X" ; tput sgr0
tput setaf 5 ; echo "    XX    XX    X        XX   X X    X" ; tput sgr0
tput setaf 5 ; echo "   XX      XX  X         XX O XXXXXXXX" ; tput sgr0
echo ""
tput setaf 6 ; echo "ViperX 1.0 Installer is Loading Please Wait" ; tput sgr0
tput setaf 6 ; echo "By Penguin" ; tput sgr0
sleep 4
clear
echo ""
echo "● Este conjunto de scripts irá"
echo "● Instalar e configurar o proxy squid nas portas 80" ; echo ""
echo "● Configurar o OpenSSH para rodar nas portas 22 e 443"
echo "● Instalar os modulos e conjuntos de nosso Manager" ; tput sgr0
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
tput setaf 2 ; tput bold ; echo "	Termos de Uso" ; tput sgr0
echo ""
echo "Ao utilizar o 'Viper X' você concorda com os seguintes termos de uso:"
echo ""
echo "1. Você pode:"
echo "a. Instalar e usar o 'ViperX' no(s) seu(s) servidor(es)."
echo "b. Criar, gerenciar e remover um número ilimitado de usuários através desse conjunto de scripts."
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
echo "2. Você não pode:"
echo "a. Editar, modificar, compartilhar ou redistribuir (gratuitamente ou comercialmente)"
echo "esse conjunto de scripts"
echo "b. Modificar ou editar o conjunto de scripts para fazer você parecer o desenvolvedor dos scripts."
echo ""
echo "3. Você aceita que:"
echo "a. O valor pago por esse conjunto de scripts inclui apenas suporte em sua instalação e configuração,"
echo "Qualquer quebra do contrato ou mudança no script, é sujeito a perda total do suporte,"
echo "b. O usuário desse conjunto de scripts é o único resposável por qualquer tipo de implicação"
echo "ética ou legal causada pelo uso desse conjunto de scripts para qualquer tipo de finalidade."
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
echo "4. Você concorda que o desenvolvedor não se responsabilizará pelos:"
echo "a. Problemas causados pelo uso dos scripts distribuídos sem autorização."
echo "b. Problemas causados por conflitos entre este conjunto de scripts e scripts de outros desenvolvedores."
echo "c. Problemas causados por edições ou modificações do código do script sem autorização."
echo "d. Problemas do sistema causados por programas de terceiro ou modificações/experimentações do usuário."
echo "e. Problemas causados por modificações no sistema do servidor."
echo "f. Problemas causados pelo usuário não seguir as instruções da documentação do conjunto de scripts."
echo "g. Problemas ocorridos durante o uso dos scripts para obter lucro comercial."
echo "h. Problemas que possam ocorrer ao usar o conjunto de scripts em sistemas que não estão na lista de sistemas testados."
echo ""
tput setaf 3 ; tput bold ; read -n 1 -s -p "Aperte qualquer tecla para continuar..." ; echo "" ; echo "" ; tput sgr0
IP=$(wget -q -qO- https://bigbolgames.com)
read -p "Para continuar confirme o IP deste servidor: " -e -i $IP ipdovps
if [ -z "$ipdovps" ]
then
	tput setaf 7 ; tput setab 1 ; tput bold ; echo "" ; echo "" ; echo " Você não digitou o IP deste servidor. Tente novamente. " ; echo "" ; echo "" ; tput sgr0
	exit 1
fi
if [ -f "/root/usuarios.db" ]
then
tput setaf 6 ; tput bold ;	echo ""
	echo "Uma base de dados de usuários ('usuarios.db') foi encontrada!"
	echo "Deseja mantê-la (preservando o limite de conexões simultâneas dos usuários)"
	echo "ou criar uma nova base de dados?"
	tput setaf 6 ; tput bold ;	echo ""
	echo "[1] Manter Base de Dados Atual"
	echo "[2] Criar uma Nova Base de Dados"
	echo "" ; tput sgr0
	read -p "Opção?: " -e -i 1 optiondb
else
	awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
fi
echo ""
read -p "Deseja ativar a compressão SSH (pode aumentar o consumo de RAM)? [s/n]) " -e -i n sshcompression
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; echo "" ; echo "Aguarde a configuração automática" ; echo "" ; tput sgr0
sleep 3
apt-get update -y
apt-get upgrade -y
rm /etc/dragoncore/criarusuario /etc/dragoncore/expcleaner /etc/dragoncore/sshlimiter /etc/dragoncore/addhost /etc/dragoncore/listar /etc/dragoncore/sshmonitor /etc/dragoncore/ajuda > /dev/null
rm /root/ExpCleaner.sh /root/CriarUsuario.sh /root/sshlimiter.sh > /dev/null
apt-get install squid -y
apt-get install bc -y
apt-get install screen -y
apt-get install nano -y
apt-get install unzip -y
apt-get install dos2unix -y
apt-get install wget -y
apt-get install curl -y
apt-get install apache2-utils -y
killall apache2
apt-get purge apache2 -y
if [ -f "/usr/sbin/ufw" ] ; then
	ufw allow 443/tcp ; ufw allow 80/tcp
fi
if [ -d "/etc/squid3/" ]
then
    cd /etc/squid3/
    mv squid.conf squid.confbak
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/squid/squid.conf
	cd /$USER
	grep -v "^Port 443" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
	echo "Port 443" >> /etc/ssh/sshd_config
	echo "Banner /etc/bannerssh" >> /etc/ssh/sshd_config
	cd /etc/
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/banner/bannerssh
	cd /$USER
	grep -v "^PasswordAuthentication yes" /etc/ssh/sshd_config > /tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
	echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
	service ssh restart
	service squid3 restart
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Instalando Modulos Por Favor Aguarde " ; tput sgr0 ; echo ""
    wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/squid/squidconf.sh -O /etc/dragoncore/squidconf
	chmod +x /etc/dragoncore/squidconf
	dos2unix /etc/dragoncore/squidconf
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Squid Auth Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/alterarsenha.sh -O /etc/dragoncore/alterarsenha
	chmod +x /etc/dragoncore/alterarsenha
	dos2unix /etc/dragoncore/alterarsenha
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Change Password Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/criarusuario2.sh -O /etc/dragoncore/criarusuario
	chmod +x /etc/dragoncore/criarusuario
	dos2unix /etc/dragoncore/criarusuario
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Create user Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/expcleaner2.sh -O /etc/dragoncore/expcleaner
	chmod +x /etc/dragoncore/expcleaner
	dos2unix /etc/dragoncore/expcleaner
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Clear Expired Users Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/mudardata.sh -O /etc/dragoncore/mudardata
	chmod +x /etc/dragoncore/mudardata
	dos2unix /etc/dragoncore/mudardata
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Change Date Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/remover.sh -O /etc/dragoncore/remover
	chmod +x /etc/dragoncore/remover
	dos2unix /etc/dragoncore/remover
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Remove Users Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/sshlimiter2.sh -O /etc/dragoncore/sshlimiter
	chmod +x /etc/dragoncore/sshlimiter
	dos2unix /etc/dragoncore/sshlimiter
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo SSh Limiter Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/alterarlimite.sh -O /etc/dragoncore/alterarlimite
	chmod +x /etc/dragoncore/alterarlimite
	dos2unix /etc/dragoncore/alterarlimite
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Change Limit Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/panel.sh -O /etc/dragoncore/panel
	chmod +x /etc/dragoncore/panel
	dos2unix /etc/dragoncore/panel
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Panel Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/sshmonitor2.sh -O /etc/dragoncore/sshmonitor
	chmod +x /etc/dragoncore/sshmonitor
	dos2unix /etc/dragoncore/sshmonitor
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo SSH Monitor Installed " ; tput sgr0 ; echo ""
	mkdir /etc/penguin > /dev/null
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/py/speedtest.sh -O /etc/dragoncore/speedtest
	chmod +x /etc/dragoncore/speedtest
	dos2unix /etc/dragoncore/speedtest
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Speed Test Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/py/speedtest.py
	mv speedtest.py /etc/penguin
	chmod +x /etc/penguin/speedtest.py
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Speed Test Python Configured " ; tput sgr0 ; echo ""
    wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/usuarioteste.sh -O /etc/dragoncore/usuarioteste
	chmod +x /etc/dragoncore/usuarioteste
	dos2unix /etc/dragoncore/usuarioteste
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo User Temp Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/banner.sh -O /etc/dragoncore/banner
	chmod +x /etc/dragoncore/banner
	dos2unix /etc/dragoncore/banner
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Banner Set Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/systemdetails.sh -O /etc/dragoncore/systemdetails
	chmod +x /etc/dragoncore/systemdetails
	dos2unix /etc/dragoncore/systemdetails
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo System Details Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/updatepack.sh -O /etc/dragoncore/updatepack
	chmod +x /etc/dragoncore/updatepack
	dos2unix /etc/dragoncore/updatepack
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Update Manager Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/firewallblock.sh -O /etc/dragoncore/firewallblock
	chmod +x /etc/dragoncore/firewallblock
	dos2unix /etc/dragoncore/firewallblock
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Torrent Firewall Block Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/versao.sh -O /etc/dragoncore/versao
	chmod +x /etc/dragoncore/versao
	dos2unix /etc/dragoncore/versao
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Version Manager Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/limiter.sh -O /etc/dragoncore/limiter
	chmod +x /etc/dragoncore/limiter
	dos2unix /etc/dragoncore/limiter
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Panel Limiter Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/proxypanel.sh -O /etc/dragoncore/proxypanel
	chmod +x /etc/dragoncore/proxypanel
	dos2unix /etc/dragoncore/proxypanel
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Proxy Auth Change Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/badvpnsetup.sh -O /etc/dragoncore/badvpnsetup
	chmod +x /etc/dragoncore/badvpnsetup
	dos2unix /etc/dragoncore/badvpnsetup
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo BadVPNSetup Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/openvpnsetup.sh -O /etc/dragoncore/openvpnsetup
	chmod +x /etc/dragoncore/openvpnsetup
	dos2unix /etc/dragoncore/openvpnsetup
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo OpenVPN Setup Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/tcptweaker.sh -O /etc/dragoncore/tcptweaker
	chmod +x /etc/dragoncore/tcptweaker
	dos2unix /etc/dragoncore/tcptweaker
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo TCP Twaker Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/userbackup.sh -O /etc/dragoncore/userbackup
	chmod +x /etc/dragoncore/userbackup
	dos2unix /etc/dragoncore/userbackup
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo User Backup Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/webmininstall.sh -O /etc/dragoncore/webmininstall
	chmod +x /etc/dragoncore/webmininstall
	dos2unix /etc/dragoncore/webmininstall
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo WEBMIN Installer Online " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/panel2.sh -O /etc/dragoncore/panel2
	chmod +x /etc/dragoncore/panel2
	dos2unix /etc/dragoncore/panel2
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Page 2 Panel Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/automaticboot.sh -O /etc/dragoncore/automaticboot
	chmod +x /etc/dragoncore/automaticboot
	dos2unix /etc/dragoncore/automaticboot
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Automatic BOOT Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/uninstallvps.sh -O /etc/dragoncore/uninstallvps
	chmod +x /etc/dragoncore/uninstallvps
	dos2unix /etc/dragoncore/uninstallvps
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo de desinstalacao de nosso vps manager instalado com sucesso" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/vpntime.sh -O /etc/dragoncore/vpntime
	chmod +x /etc/dragoncore/vpntime
	dos2unix /etc/dragoncore/vpntime
	cd /$USER 
	mkdir arquivosopenvpn
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo de OpenVPn Com Validade Instalado" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/vpnauth.sh -O /etc/dragoncore/vpnauth
	chmod +x /etc/dragoncore/vpnauth
	dos2unix /etc/dragoncore/vpnauth
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo de OpenVPn Com Validade e Proxy Auth Instalado" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/userpassgenerator.sh -O /etc/dragoncore/userpassgenerator
	chmod +x /etc/dragoncore/userpassgenerator
	dos2unix /etc/dragoncore/userpassgenerator
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo UserPass.conf Generator Instalado" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/nloadpanel.sh -O /etc/dragoncore/nloadpanel
	chmod +x /etc/dragoncore/nloadpanel
	dos2unix /etc/dragoncore/nloadpanel
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Nload Panel Instalado" ; tput sgr0 ; echo ""
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo UserPass.conf Generator Instalado" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/hlemon.sh -O /etc/dragoncore/hlemon
	chmod +x /etc/dragoncore/hlemon
	dos2unix /etc/dragoncore/hlemon
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo HTOP Panel Instalado" ; tput sgr0 ; echo ""
	panel
	clear
    wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/viperx.sh -O /etc/dragoncore/viperx
	chmod +x /etc/dragoncore/viperx
	dos2unix /etc/dragoncore/viperx
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo ViperX Instalado " ; tput sgr0 ; echo ""
	echo ""
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Por favor insira a senha para o usuario padrao do Proxy Auth " ; tput sgr0 ; echo ""
	htpasswd -c /etc/squid3/passwd squid
	clear
fi
if [ -d "/etc/squid/" ]
then
    cd /etc/squid/
    mv squid.conf squid.confbak
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/squid2/squid.conf
	cd /$USER
	grep -v "^Port 443" /etc/ssh/sshd_config > /tmp/ssh && mv /tmp/ssh /etc/ssh/sshd_config
	echo "Port 443" >> /etc/ssh/sshd_config
	grep -v "^PasswordAuthentication yes" /etc/ssh/sshd_config > /tmp/passlogin && mv /tmp/passlogin /etc/ssh/sshd_config
	echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
	echo "Banner /etc/bannerssh" >> /etc/ssh/sshd_config
	cd /etc/
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/banner/bannerssh
	service ssh restart
	service squid restart
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Instalando Modulos Por Favor Aguarde " ; tput sgr0 ; echo ""
    wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/squid2/squidconf.sh -O /etc/dragoncore/squidconf
	chmod +x /etc/dragoncore/squidconf
	dos2unix /etc/dragoncore/squidconf
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Squid Auth Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/alterarsenha.sh -O /etc/dragoncore/alterarsenha
	chmod +x /etc/dragoncore/alterarsenha
	dos2unix /etc/dragoncore/alterarsenha
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Change Password Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/criarusuario2.sh -O /etc/dragoncore/criarusuario
	chmod +x /etc/dragoncore/criarusuario
	dos2unix /etc/dragoncore/criarusuario
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Create user Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/expcleaner2.sh -O /etc/dragoncore/expcleaner
	chmod +x /etc/dragoncore/expcleaner
	dos2unix /etc/dragoncore/expcleaner
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Clear Expired Users Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/mudardata.sh -O /etc/dragoncore/mudardata
	chmod +x /etc/dragoncore/mudardata
	dos2unix /etc/dragoncore/mudardata
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Change Date Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/remover.sh -O /etc/dragoncore/remover
	chmod +x /etc/dragoncore/remover
	dos2unix /etc/dragoncore/remover
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Remove Users Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/sshlimiter2.sh -O /etc/dragoncore/sshlimiter
	chmod +x /etc/dragoncore/sshlimiter
	dos2unix /etc/dragoncore/sshlimiter
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo SSh Limiter Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/alterarlimite.sh -O /etc/dragoncore/alterarlimite
	chmod +x /etc/dragoncore/alterarlimite
	dos2unix /etc/dragoncore/alterarlimite
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Change Limit Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/panel.sh -O /etc/dragoncore/panel
	chmod +x /etc/dragoncore/panel
	dos2unix /etc/dragoncore/panel
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Panel Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/sshmonitor2.sh -O /etc/dragoncore/sshmonitor
	chmod +x /etc/dragoncore/sshmonitor
	dos2unix /etc/dragoncore/sshmonitor
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo SSH Monitor Installed " ; tput sgr0 ; echo ""
	mkdir /etc/penguin > /dev/null
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/py/speedtest.sh -O /etc/dragoncore/speedtest
	chmod +x /etc/dragoncore/speedtest
	dos2unix /etc/dragoncore/speedtest
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Speed Test Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/py/speedtest.py
	mv speedtest.py /etc/penguin
	chmod +x /etc/penguin/speedtest.py
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Speed Test Python Configured " ; tput sgr0 ; echo ""
    wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/usuarioteste.sh -O /etc/dragoncore/usuarioteste
	chmod +x /etc/dragoncore/usuarioteste
	dos2unix /etc/dragoncore/usuarioteste
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo User Temp Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/banner.sh -O /etc/dragoncore/banner
	chmod +x /etc/dragoncore/banner
	dos2unix /etc/dragoncore/banner
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Banner Set Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/systemdetails.sh -O /etc/dragoncore/systemdetails
	chmod +x /etc/dragoncore/systemdetails
	dos2unix /etc/dragoncore/systemdetails
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo System Details Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/updatepack2.sh -O /etc/dragoncore/updatepack
	chmod +x /etc/dragoncore/updatepack
	dos2unix /etc/dragoncore/updatepack
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Update Manager Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/firewallblock.sh -O /etc/dragoncore/firewallblock
	chmod +x /etc/dragoncore/firewallblock
	dos2unix /etc/dragoncore/firewallblock
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Torrent Firewall Block Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/versao.sh -O /etc/dragoncore/versao
	chmod +x /etc/dragoncore/versao
	dos2unix /etc/dragoncore/versao
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Version Manager Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/limiter.sh -O /etc/dragoncore/limiter
	chmod +x /etc/dragoncore/limiter
	dos2unix /etc/dragoncore/limiter
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Panel Limiter Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/proxypanel2.sh -O /etc/dragoncore/proxypanel
	chmod +x /etc/dragoncore/proxypanel
	dos2unix /etc/dragoncore/proxypanel
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Proxy Auth Change Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/badvpnsetup.sh -O /etc/dragoncore/badvpnsetup
	chmod +x /etc/dragoncore/badvpnsetup
	dos2unix /etc/dragoncore/badvpnsetup
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo BadVPNSetup Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/openvpnsetup.sh -O /etc/dragoncore/openvpnsetup
	chmod +x /etc/dragoncore/openvpnsetup
	dos2unix /etc/dragoncore/openvpnsetup
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo OpenVPN Setup Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/tcptweaker.sh -O /etc/dragoncore/tcptweaker
	chmod +x /etc/dragoncore/tcptweaker
	dos2unix /etc/dragoncore/tcptweaker
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo TCP Twaker Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/userbackup.sh -O /etc/dragoncore/userbackup
	chmod +x /etc/dragoncore/userbackup
	dos2unix /etc/dragoncore/userbackup
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo User Backup Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/webmininstall.sh -O /etc/dragoncore/webmininstall
	chmod +x /etc/dragoncore/webmininstall
	dos2unix /etc/dragoncore/webmininstall
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo WEBMIN Installer Online " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/panel2.sh -O /etc/dragoncore/panel2
	chmod +x /etc/dragoncore/panel2
	dos2unix /etc/dragoncore/panel2
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Page 2 Panel Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/automaticboot.sh -O /etc/dragoncore/automaticboot
	chmod +x /etc/dragoncore/automaticboot
	dos2unix /etc/dragoncore/automaticboot
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Automatic BOOT Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/uninstallvps.sh -O /etc/dragoncore/uninstallvps
	chmod +x /etc/dragoncore/uninstallvps
	dos2unix /etc/dragoncore/uninstallvps
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo de desinstalacao de nosso vps manager instalado com sucesso" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/vpntime.sh -O /etc/dragoncore/vpntime
	chmod +x /etc/dragoncore/vpntime
	dos2unix /etc/dragoncore/vpntime
	cd /$USER 
	mkdir arquivosopenvpn
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo de OpenVPn Com Validade Instalado" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/vpnauth.sh -O /etc/dragoncore/vpnauth
	chmod +x /etc/dragoncore/vpnauth
	dos2unix /etc/dragoncore/vpnauth
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo de OpenVPn Com Validade e Proxy Auth Instalado" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/userpassgenerator.sh -O /etc/dragoncore/userpassgenerator
	chmod +x /etc/dragoncore/userpassgenerator
	dos2unix /etc/dragoncore/userpassgenerator
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo UserPass.conf Generator Instalado" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/nloadpanel.sh -O /etc/dragoncore/nloadpanel
	chmod +x /etc/dragoncore/nloadpanel
	dos2unix /etc/dragoncore/nloadpanel
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Nload Panel Instalado" ; tput sgr0 ; echo ""
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo UserPass.conf Generator Instalado" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/hlemon.sh -O /etc/dragoncore/hlemon
	chmod +x /etc/dragoncore/hlemon
	dos2unix /etc/dragoncore/hlemon
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo HTOP Panel Instalado" ; tput sgr0 ; echo ""
	clear
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/viperx.sh -O /etc/dragoncore/viperx
	chmod +x /etc/dragoncore/viperx
	dos2unix /etc/dragoncore/viperx
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo ViperX Instalado " ; tput sgr0 ; echo ""
	clear
	echo ""
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Por favor insira a senha para o usuario padrao do Proxy Auth " ; tput sgr0 ; echo ""
	htpasswd -c /etc/squid/local squid
	clear
fi
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; echo "Para Logar em seu proxy use o login squid e a senha que configurou na instalação" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "Caso deseje desativar o Proxy auth por favor acesse a opção 5 no painel do VPS Manager" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "O SSH limiter por padrao vem desabilitado, para abilitar ele selecione a opção 6 no painel" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "Proxy Squid Instalado e rodando nas portas: 80" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "OpenSSH rodando nas portas 22 e 443" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "Scripts para gerenciamento de usuário instalados" ; tput sgr0
tput setaf 7 ; tput setab 4 ; tput bold ; echo "Para acessar o painel de gerenciamento use o comando: panel" ; tput sgr0
echo ""
if [[ "$optiondb" = '2' ]]; then
	awk -F : '$3 >= 500 { print $1 " 1" }' /etc/passwd | grep -v '^nobody' > /root/usuarios.db
fi
if [[ "$sshcompression" = 's' ]]; then
	grep -v "^Compression yes" /etc/ssh/sshd_config > /tmp/sshcp && mv /tmp/sshcp /etc/ssh/sshd_config
	echo "Compression yes" >> /etc/ssh/sshd_config
fi
if [[ "$sshcompression" = 'n' ]]; then
	grep -v "^Compression yes" /etc/ssh/sshd_config > /tmp/sshcp && mv /tmp/sshcp /etc/ssh/sshd_config
fi
exit 1