#!/bin/bash
#Scripiter Penguin
#
    tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Atualizando modulos " ; tput sgr0 ; echo ""
    wget -q http://cloud.anasor.com/vpsmanager/updates/4.3.4-16/squidconf.sh -O /bin/squidconf
	chmod +x /bin/squidconf
	dos2unix /bin/squidconf
	
	exit

