#!/bin/bash
#Scripiter Penguin
#
	tput setaf 6 ; echo "Instalando Viper 5.0"
    wget -q http://vipernk.anasor.com/squid/squidconf.sh -O /bin/squidconf
	chmod +x /bin/squidconf
	dos2unix /bin/squidconf
	tput setaf 6 ; echo "Configurando o Squidconf"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/sh/alterarsenha.sh -O /bin/alterarsenha
	chmod +x /bin/alterarsenha
	dos2unix /bin/alterarsenha
	tput setaf 6 ; echo "Configurando o alterarsenha"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/sh/criarusuario2.sh -O /bin/criarusuario
	chmod +x /bin/criarusuario
	dos2unix /bin/criarusuario
	tput setaf 6 ; echo "Configurando o criarusuario"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/sh/expcleaner2.sh -O /bin/expcleaner
	chmod +x /bin/expcleaner
	dos2unix /bin/expcleaner
	tput setaf 6 ; echo "Configurando o expcleaner"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/sh/mudardata.sh -O /bin/mudardata
	chmod +x /bin/mudardata
	dos2unix /bin/mudardata
	tput setaf 6 ; echo "Configurando o mudardata"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/sh/remover.sh -O /bin/remover
	chmod +x /bin/remover
	dos2unix /bin/remover
	tput setaf 6 ; echo "Configurando o remover"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/sh/sshlimiter2.sh -O /bin/sshlimiter
	chmod +x /bin/sshlimiter
	dos2unix /bin/sshlimiter
	tput setaf 6 ; echo "Configurando o sshlimiter"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/sh/alterarlimite.sh -O /bin/alterarlimite
	chmod +x /bin/alterarlimite
	dos2unix /bin/altearlimite
	tput setaf 6 ; echo "Configurando o alterarlimite"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/panels/panel5.sh -O /bin/panel5
	chmod +x /bin/panel5
	dos2unix /bin/panel5
	tput setaf 6 ; echo "Configurando o panel Viper 5.0"
	wget -q http://vipernk.anasor.com/panels/panel.sh -O /bin/panel
	chmod +x /bin/panel
	dos2unix /bin/panel
	tput setaf 6 ; echo "Configurando o panel Viper 5.0"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/sh/sshmonitor2.sh -O /bin/sshmonitor
	chmod +x /bin/sshmonitor
	dos2unix /bin/sshmonitor
	tput setaf 6 ; echo "Configurando o sshmonitor"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	mkdir /etc/penguin > /dev/null
	wget -q http://vipernk.anasor.com/py/speedtest.sh -O /bin/speedtest
	chmod +x /bin/speedtest
	dos2unix /bin/speedtest
	tput setaf 6 ; echo "Configurando o speedtest"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/py/speedtest.py
	mv speedtest.py /etc/penguin
	chmod +x /etc/penguin/speedtest.py
	tput setaf 6 ; echo "Configurando o speedtest.py"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
    wget -q http://vipernk.anasor.com/sh/usuarioteste.sh -O /bin/usuarioteste
	chmod +x /bin/usuarioteste
	dos2unix /bin/usuarioteste
	tput setaf 6 ; echo "Configurando o usuarioteste"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/sh/banner.sh -O /bin/banner
	chmod +x /bin/banner
	dos2unix /bin/banner
	tput setaf 6 ; echo "Configurando o banner"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/sh/systemdetails.sh -O /bin/systemdetails
	chmod +x /bin/systemdetails
	dos2unix /bin/systemdetails
	tput setaf 6 ; echo "Configurando o systemdetails"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/sh/updatepack-beta.sh -O /bin/updatepack-beta
	chmod +x /bin/updatepack-beta
	dos2unix /bin/updatepack-beta
	tput setaf 6 ; echo "Configurando o updatepack-beta"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/sh/firewallblock.sh -O /bin/firewallblock
	chmod +x /bin/firewallblock
	dos2unix /bin/firewallblock
	tput setaf 6 ; echo "Configurando o firewallblock"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/sh/versao.sh -O /bin/versao
	chmod +x /bin/versao
	dos2unix /bin/versao
	tput setaf 6 ; echo "Configurando o version Viper 5.0"
	tput setaf 6 ; echo "Instalado com sucesso"
	clear
	wget -q http://vipernk.anasor.com/sh/limiter.sh -O /bin/limiter
	chmod +x /bin/limiter
	dos2unix /bin/limiter
	tput setaf 6 ; echo "Limiter Panel"
	clear
	wget -q http://vipernk.anasor.com/sh/proxypanel.sh -O /bin/proxypanel
	chmod +x /bin/proxypanel
	dos2unix /bin/proxypanel
	tput setaf 6 ; echo "Proxy Auth panel Installed"
	clear
	wget -q http://vipernk.anasor.com/sh/badvpnsetup.sh -O /bin/badvpnsetup
	chmod +x /bin/badvpnsetup
	dos2unix /bin/badvpnsetup
	tput setaf 6 ; echo "BadVPNSetup Installed"
	clear
	wget -q http://vipernk.anasor.com/sh/openvpnsetup.sh -O /bin/openvpnsetup
	chmod +x /bin/openvpnsetup
	dos2unix /bin/openvpnsetup
	tput setaf 6 ; echo "OpenVPN Setup Installed"
	clear
	wget -q http://vipernk.anasor.com/sh/tcptweaker.sh -O /bin/tcptweaker
	chmod +x /bin/tcptweaker
	dos2unix /bin/tcptweaker
	tput setaf 6 ; echo "TCPTwaker Installed"
	clear
	wget -q http://vipernk.anasor.com/sh/userbackup.sh -O /bin/userbackup
	chmod +x /bin/userbackup
	dos2unix /bin/userbackup
	tput setaf 6 ; echo "Userbackup Installed"
	wget -q http://vipernk.anasor.com/panels/automaticboot.sh -O /bin/automaticboot
	chmod +x /bin/automaticboot
	dos2unix /bin/automaticboot
	tput setaf 6 ; echo "automaticboot Installed"
	clear
	echo Instalando UPDATES
	tput setaf 6 ; echo "Concluido"
	panel
	exit

