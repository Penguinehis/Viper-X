#!/bin/bash
#Scripiter Penguin
#
clear
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Limpando modulos antigos " ; tput sgr0 ; echo ""
	sleep 3
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
	rm -R /bin/viperx
	clear
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Instalando Modulos Por Favor Aguarde " ; tput sgr0 ; echo ""
	sleep 2
    wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/squid2/squidconf.sh -O /bin/squidconf
	chmod +x /bin/squidconf
	dos2unix /bin/squidconf
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Squid Auth Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/alterarsenha.sh -O /bin/alterarsenha
	chmod +x /bin/alterarsenha
	dos2unix /bin/alterarsenha
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Change Password Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/criarusuario2.sh -O /bin/criarusuario
	chmod +x /bin/criarusuario
	dos2unix /bin/criarusuario
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Create user Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/expcleaner2.sh -O /bin/expcleaner
	chmod +x /bin/expcleaner
	dos2unix /bin/expcleaner
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Clear Expired Users Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/mudardata.sh -O /bin/mudardata
	chmod +x /bin/mudardata
	dos2unix /bin/mudardata
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Change Date Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/remover.sh -O /bin/remover
	chmod +x /bin/remover
	dos2unix /bin/remover
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Remove Users Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/sshlimiter2.sh -O /bin/sshlimiter
	chmod +x /bin/sshlimiter
	dos2unix /bin/sshlimiter
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo SSh Limiter Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/alterarlimite.sh -O /bin/alterarlimite
	chmod +x /bin/alterarlimite
	dos2unix /bin/alterarlimite
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Change Limit Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/panel.sh -O /bin/panel
	chmod +x /bin/panel
	dos2unix /bin/panel
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Panel Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/sshmonitor2.sh -O /bin/sshmonitor
	chmod +x /bin/sshmonitor
	dos2unix /bin/sshmonitor
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo SSH Monitor Installed " ; tput sgr0 ; echo ""
	mkdir /etc/penguin > /dev/null
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/py/speedtest.sh -O /bin/speedtest
	chmod +x /bin/speedtest
	dos2unix /bin/speedtest
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Speed Test Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/py/speedtest.py
	mv speedtest.py /etc/penguin
	chmod +x /etc/penguin/speedtest.py
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Speed Test Python Configured " ; tput sgr0 ; echo ""
    wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/usuarioteste.sh -O /bin/usuarioteste
	chmod +x /bin/usuarioteste
	dos2unix /bin/usuarioteste
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo User Temp Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/banner.sh -O /bin/banner
	chmod +x /bin/banner
	dos2unix /bin/banner
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Banner Set Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/systemdetails.sh -O /bin/systemdetails
	chmod +x /bin/systemdetails
	dos2unix /bin/systemdetails
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo System Details Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/updatepack2.sh -O /bin/updatepack
	chmod +x /bin/updatepack
	dos2unix /bin/updatepack
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Update Manager Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/firewallblock.sh -O /bin/firewallblock
	chmod +x /bin/firewallblock
	dos2unix /bin/firewallblock
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Torrent Firewall Block Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/versao.sh -O /bin/versao
	chmod +x /bin/versao
	dos2unix /bin/versao
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Version Manager Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/limiter.sh -O /bin/limiter
	chmod +x /bin/limiter
	dos2unix /bin/limiter
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Panel Limiter Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/proxypanel2.sh -O /bin/proxypanel
	chmod +x /bin/proxypanel
	dos2unix /bin/proxypanel
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Proxy Auth Change Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/badvpnsetup.sh -O /bin/badvpnsetup
	chmod +x /bin/badvpnsetup
	dos2unix /bin/badvpnsetup
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo BadVPNSetup Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/openvpnsetup.sh -O /bin/openvpnsetup
	chmod +x /bin/openvpnsetup
	dos2unix /bin/openvpnsetup
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo OpenVPN Setup Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/tcptweaker.sh -O /bin/tcptweaker
	chmod +x /bin/tcptweaker
	dos2unix /bin/tcptweaker
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo TCP Twaker Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/sh/userbackup.sh -O /bin/userbackup
	chmod +x /bin/userbackup
	dos2unix /bin/userbackup
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo User Backup Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/webmininstall.sh -O /bin/webmininstall
	chmod +x /bin/webmininstall
	dos2unix /bin/webmininstall
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo WEBMIN Installer Online " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/panel2.sh -O /bin/panel2
	chmod +x /bin/panel2
	dos2unix /bin/panel2
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Page 2 Panel Installed" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/automaticboot.sh -O /bin/automaticboot
	chmod +x /bin/automaticboot
	dos2unix /bin/automaticboot
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Automatic BOOT Installed " ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/uninstallvps.sh -O /bin/uninstallvps
	chmod +x /bin/uninstallvps
	dos2unix /bin/uninstallvps
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo de desinstalacao de nosso vps manager instalado com sucesso" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/vpntime.sh -O /bin/vpntime
	chmod +x /bin/vpntime
	dos2unix /bin/vpntime
	cd /$USER 
	mkdir arquivosopenvpn
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo de OpenVPn Com Validade Instalado" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/vpnauth.sh -O /bin/vpnauth
	chmod +x /bin/vpnauth
	dos2unix /bin/vpnauth
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo de OpenVPn Com Validade e Proxy Auth Instalado" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/userpassgenerator.sh -O /bin/userpassgenerator
	chmod +x /bin/userpassgenerator
	dos2unix /bin/userpassgenerator
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo UserPass.conf Generator Instalado" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/nloadpanel.sh -O /bin/nloadpanel
	chmod +x /bin/nloadpanel
	dos2unix /bin/nloadpanel
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo Nload Panel Instalado" ; tput sgr0 ; echo ""
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo UserPass.conf Generator Instalado" ; tput sgr0 ; echo ""
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/hlemon.sh -O /bin/hlemon
	chmod +x /bin/hlemon
	dos2unix /bin/hlemon
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo HTOP Panel Instalado" ; tput sgr0 ; echo ""
	clear
	wget -q https://raw.githubusercontent.com/Penguinehis/Viper-X/main/panel/viperx.sh -O /bin/viperx
	chmod +x /bin/viperx
	dos2unix /bin/viperx
	tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Modulo ViperX Instalado " ; tput sgr0 ; echo ""
	clear
	panel
	exit

