#!/bin/bash
pass=$(userpass.txt basic)
clear
tput setaf 6 ; echo "Insira o Host da Operadora,Caso não for utilizar somente de enter " ; tput sgr0
read -p "Host?: " -e -i google.com HOST

clear

# OpenVPN instalador para Debian, Ubuntu e CentOS

# Esse script irá trabalhar no Debian, Ubuntu, CentOS e provavelmente outros distros # das mesmas famílias, embora nenhum suporte é oferecido para eles.
# mas irá funcionar se você simplesmente deseja configurar uma VPN no 
# seu Debian/Ubuntu/CentOS. Ele foi projetado para ser tão
# discreto e universal quanto possível.



# Detect Debian users running the script with "sh" instead of bash
if readlink /proc/$$/exe | grep -qs "dash"; then
	echo "This script needs to be run with bash, not sh"
	exit 1
fi

if [[ "$EUID" -ne 0 ]]; then
	echo "Sorry, you need to run this as root"
	exit 2
fi

if [[ ! -e /dev/net/tun ]]; then
	echo "TUN is not available"
	exit 3
fi

if grep -qs "CentOS release 5" "/etc/redhat-release"; then
	echo "CentOS 5 is too old and not supported"
	exit 4
fi
if [[ -e /etc/debian_version ]]; then
	OS=debian
	GROUPNAME=nogroup
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	GROUPNAME=nobody
	RCLOCAL='/etc/rc.d/rc.local'
else
	echo "Looks like you aren't running this installer on a Debian, Ubuntu or CentOS system"
	exit 5
fi

newclient () {
	# Generates the custom client.ovpn
	cp /etc/openvpn/client-common.txt ~/$1.ovpn
	echo "<ca>" >> ~/$1.ovpn
	cat /etc/openvpn/easy-rsa/pki/ca.crt >> ~/$1.ovpn
	echo "</ca>" >> ~/$1.ovpn
	echo "<cert>" >> ~/$1.ovpn
	cat /etc/openvpn/easy-rsa/pki/issued/$1.crt >> ~/$1.ovpn
	echo "</cert>" >> ~/$1.ovpn
	echo "<key>" >> ~/$1.ovpn
	cat /etc/openvpn/easy-rsa/pki/private/$1.key >> ~/$1.ovpn
	echo "</key>" >> ~/$1.ovpn
	echo "<tls-auth>" >> ~/$1.ovpn
	cat /etc/openvpn/ta.key >> ~/$1.ovpn
	echo "</tls-auth>" >> ~/$1.ovpn
}

# Try to get our IP from the system and fallback to the Internet.
# I do this to make the script compatible with NATed servers (lowendspirit.com)
# and to avoid getting an IPv6.
IP=$(ip addr | grep 'inet' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | grep -o -E '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | head -1)
if [[ "$IP" = "" ]]; then
		IP=$(wget -4qO- "https://raw.githubusercontent.com/Penguinehis/Viper-X/main//")
fi

clear 
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "OpenVPN Auth Panel" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Install" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Instalar OpenVPN Server" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|2|"; tput setaf 6 ; printf '%s' " Create" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Criar Usuario" ; tput sgr0
tput setaf 2 ; tput bold ; printf '%s' "|3|"; tput setaf 6 ; printf '%s' " Remove" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Remover Usuario" ; tput sgr0 
tput setaf 2 ; tput bold ; printf '%s' "|4|"; tput setaf 6 ; printf '%s' " Uninstall" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Desinstalar OpenVPN Server" ; tput sgr0  ;
tput setaf 2 ; tput bold ; printf '%s' "|5|"; tput setaf 6 ; printf '%s' " Renew" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Renovar Usuario" ; tput sgr0 
tput setaf 2 ; tput bold ; printf '%s' "|0|"; tput setaf 6 ; printf '%s' " Sair" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Simplesmente voltara para o menu" ; tput sgr0 ;
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada" ; tput sgr0 ; echo ""
echo ""
read -p "Responda: " -e -i 2 resposta

if [[ "$resposta" = '1' ]]; then
clear
if [[ -e /etc/openvpn/server.conf ]]; then
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "OpenVPN Ja esta instalado!" ; tput sgr0 ; echo ""
exit	
fi
clear
		
	echo 'Bem vindo ao instalador OpenVPN'
	echo ""
	# OpenVPN instalador e criação do primeiro usuario
	echo "Responda as perguntas para iniciar a instalação"
	echo "Responda corretamente"
	echo ""
	echo "Primeiro precisaremos do ip de sua maquina,este ip está correto ?"
	echo "listening to."
	read -p "IP address: " -e -i $IP IP
	echo ""
	echo "Qual protocolo você deseja para as conexões OPENVPN ?"
	echo "   1) UDP"
	echo "   2) TCP (Recomendado)"
	read -p "Protocol [1-2]: " -e -i 2 PROTOCOL
	case $PROTOCOL in
		1) 
		PROTOCOL=udp
		;;
		2) 
		PROTOCOL=tcp
		;;
	esac
	echo ""
	echo "Qual porta você deseja usar ?"
	read -p "Port: " -e -i 1194 PORT
	echo ""
	echo "Qual DNS você deseja usar ?"
	echo "   1) Sistema(Recomendado)"
	echo "   2) Google"
	echo "   3) OpenDNS"
	echo "   4) NTT"
	echo "   5) Hurricane Electric"
	echo "   6) Verisign"
	read -p "DNS [1-6]: " -e -i 1 DNS
	echo ""
	echo "Agora,digite o nome de seu primeiro usuario"
	echo "Use somente o nome,sem caracteres especiais"
	read -p "Client name: " -e -i client CLIENT
	echo ""
	echo "Okay, você está pronto para executar o openvpn "
	read -n1 -r -p "Pressione uma tecla para continuar..."
	if [[ "$OS" = 'debian' ]]; then
		apt-get upgrade
		apt-get install openvpn iptables openssl ca-certificates -y
	else
		# Else, the distro is CentOS
		yum install epel-release -y
		yum install openvpn iptables openssl wget ca-certificates -y
	fi
	# An old version of easy-rsa was available by default in some openvpn packages
	if [[ -d /etc/openvpn/easy-rsa/ ]]; then
		rm -rf /etc/openvpn/easy-rsa/
	fi
	# Adquirindo easy-rsa
	wget -O ~/EasyRSA-3.0.1.tgz "https://github.com/OpenVPN/easy-rsa/releases/download/3.0.1/EasyRSA-3.0.1.tgz"
	tar xzf ~/EasyRSA-3.0.1.tgz -C ~/
	mv ~/EasyRSA-3.0.1/ /etc/openvpn/
	mv /etc/openvpn/EasyRSA-3.0.1/ /etc/openvpn/easy-rsa/
	chown -R root:root /etc/openvpn/easy-rsa/
	rm -rf ~/EasyRSA-3.0.1.tgz
	cd /etc/openvpn/easy-rsa/
	# Create the PKI, set up the CA, the DH params and the server + client certificates
	./easyrsa init-pki
	./easyrsa --batch build-ca nopass
	./easyrsa gen-dh
	./easyrsa build-server-full server nopass
	./easyrsa build-client-full $CLIENT nopass
	./easyrsa gen-crl
	# Move the stuff we need
	cp pki/ca.crt pki/private/ca.key pki/dh.pem pki/issued/server.crt pki/private/server.key /etc/openvpn/easy-rsa/pki/crl.pem /etc/openvpn
	# CRL is read with each client connection, when OpenVPN is dropped to nobody
	chown nobody:$GROUPNAME /etc/openvpn/crl.pem
	# Generando key for tls-auth
	openvpn --genkey --secret /etc/openvpn/ta.key
	# Generando server.conf
	echo "port $PORT
proto $PROTOCOL
dev tun
sndbuf 0
rcvbuf 0
ca ca.crt
cert server.crt
key server.key
dh dh.pem
tls-auth ta.key 0
topology subnet
server 10.8.0.0 255.255.255.0
ifconfig-pool-persist ipp.txt" > /etc/openvpn/server.conf
	echo 'push "redirect-gateway def1 bypass-dhcp"' >> /etc/openvpn/server.conf
	# DNS
	case $DNS in
		1) 
		# Obtain the resolvers from resolv.conf and use them for OpenVPN
		grep -v '#' /etc/resolv.conf | grep 'nameserver' | grep -E -o '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | while read line; do
			echo "push \"dhcp-option DNS $line\"" >> /etc/openvpn/server.conf
		done
		;;
		2) 
		echo 'push "dhcp-option DNS 8.8.8.8"' >> /etc/openvpn/server.conf
		echo 'push "dhcp-option DNS 8.8.4.4"' >> /etc/openvpn/server.conf
		;;
		3)
		echo 'push "dhcp-option DNS 208.67.222.222"' >> /etc/openvpn/server.conf
		echo 'push "dhcp-option DNS 208.67.220.220"' >> /etc/openvpn/server.conf
		;;
		4) 
		echo 'push "dhcp-option DNS 129.250.35.250"' >> /etc/openvpn/server.conf
		echo 'push "dhcp-option DNS 129.250.35.251"' >> /etc/openvpn/server.conf
		;;
		5) 
		echo 'push "dhcp-option DNS 74.82.42.42"' >> /etc/openvpn/server.conf
		;;
		6) 
		echo 'push "dhcp-option DNS 64.6.64.6"' >> /etc/openvpn/server.conf
		echo 'push "dhcp-option DNS 64.6.65.6"' >> /etc/openvpn/server.conf
		;;
	esac
	echo "keepalive 10 120
cipher AES-256-CBC
comp-lzo
user nobody
group $GROUPNAME
persist-key
persist-tun
status openvpn-status.log
verb 3
crl-verify crl.pem" >> /etc/openvpn/server.conf
	# Enable net.ipv4.ip_forward for the system
	sed -i '/\<net.ipv4.ip_forward\>/c\net.ipv4.ip_forward=1' /etc/sysctl.conf
	if ! grep -q "\<net.ipv4.ip_forward\>" /etc/sysctl.conf; then
		echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf
	fi
	# Avoid an unneeded reboot
	echo 1 > /proc/sys/net/ipv4/ip_forward
	# Needed to use rc.local with some systemd distros
	if [[ "$OS" = 'debian' && ! -e $RCLOCAL ]]; then
		echo '#!/bin/sh -e
exit 0' > $RCLOCAL
	fi
	chmod +x $RCLOCAL
	# Set NAT for the VPN subnet
	iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j SNAT --to $IP
	sed -i "1 a\iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j SNAT --to $IP" $RCLOCAL
	if pgrep firewalld; then
		# We don't use --add-service=openvpn because that would only work with
		# the default port and protocol. Using both permanent and not permanent
		# rules to avoid a firewalld reload.
		firewall-cmd --zone=public --add-port=$PORT/$PROTOCOL
		firewall-cmd --zone=trusted --add-source=10.8.0.0/24
		firewall-cmd --permanent --zone=public --add-port=$PORT/$PROTOCOL
		firewall-cmd --permanent --zone=trusted --add-source=10.8.0.0/24
	fi
	if iptables -L -n | grep -qE 'REJECT|DROP'; then
		# If iptables has at least one REJECT rule, we asume this is needed.
		# Not the best approach but I can't think of other and this shouldn't
		# cause problems.
		iptables -I INPUT -p $PROTOCOL --dport $PORT -j ACCEPT
		iptables -I FORWARD -s 10.8.0.0/24 -j ACCEPT
          iptables -F
		iptables -I FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
		sed -i "1 a\iptables -I INPUT -p $PROTOCOL --dport $PORT -j ACCEPT" $RCLOCAL
		sed -i "1 a\iptables -I FORWARD -s 10.8.0.0/24 -j ACCEPT" $RCLOCAL
		sed -i "1 a\iptables -I FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT" $RCLOCAL
	fi
	# If SELinux is enabled and a custom port or TCP was selected, we need this
	if hash sestatus 2>/dev/null; then
		if sestatus | grep "Current mode" | grep -qs "enforcing"; then
			if [[ "$PORT" != '1194' || "$PROTOCOL" = 'tcp' ]]; then
				# semanage isn't available in CentOS 6 by default
				if ! hash semanage 2>/dev/null; then
					yum install policycoreutils-python -y
				fi
				semanage port -a -t openvpn_port_t -p $PROTOCOL $PORT
			fi
		fi
	fi
	# And finally, restart OpenVPN
	if [[ "$OS" = 'debian' ]]; then
		# Little hack to check for systemd
		if pgrep systemd-journal; then
			systemctl restart openvpn@server.service
		else
			/etc/init.d/openvpn restart
		fi
	else
		if pgrep systemd-journal; then
			systemctl restart openvpn@server.service
			systemctl enable openvpn@server.service
		else
			service openvpn restart
			chkconfig openvpn on
		fi
	fi
	# Try to detect a NATed connection and ask about it to potential LowEndSpirit users
	EXTERNALIP=$(wget -4qO- "http://vipernk.anasor.com/")
	if [[ "$IP" != "$EXTERNALIP" ]]; then
		echo ""
		echo "Looks like your server is behind a NAT!"
		echo ""
		echo "If your server is NATed (e.g. LowEndSpirit), I need to know the external IP"
		echo "If that's not the case, just ignore this and leave the next field blank"
		read -p "External IP: " -e USEREXTERNALIP
		if [[ "$USEREXTERNALIP" != "" ]]; then
			IP=$USEREXTERNALIP
		fi
	fi
	# client-common.txt is created so we have a template to add further users later
	echo "client
dev tun
proto $PROTOCOL
sndbuf 0
rcvbuf 0
remote $IP $PORT
http-proxy-option CUSTOM-HEADER X-Online-Host  sdp.vivo.com.br
http-proxy $IP 80
resolv-retry infinite
nobind
persist-key
persist-tun
remote-cert-tls server
cipher AES-256-CBC
comp-lzo
setenv opt block-outside-dns
key-direction 1
verb 3" > /etc/openvpn/client-common.txt
	# Generates the custom client.ovpn
	newclient "$CLIENT"
	echo ""
	echo "O Certificado do usuário $CLIENT está disponível em ~/$CLIENT.ovpn"
	echo ""
	
elif [[ "$resposta" = '2' ]]; then
	clear
	echo ""
        echo "--------------------------------------------------"
	echo "Digite o nome do usuário OpenVPN que deseja criar:"
	echo "Evite caracteres especiais."
        echo "--------------------------------------------------"
	echo ""
	read -p "Nome do usuário: " CLIENT
	awk -F : ' { print $1 }' /etc/passwd > /tmp/users 
	if grep -Fxq "$CLIENT" /tmp/users
	then
                while true
                do
                	clear
			echo "----------------------------"
			echo "usuário OpenVPN já existe..."
			echo " "
			echo "Digite o nome do usuário OpenVPN que deseja criar:"
			echo "Evite caracteres especiais."
        		echo "--------------------------------------------------"
			read -p "Nome do usuário: " CLIENT
                        awk -F : ' { print $1 }' /etc/passwd > /tmp/users 
			if grep -Fxq "$CLIENT" /tmp/users
                        then
			        echo ""
			else
                                break
                        fi
		done
	fi
	cd /etc/openvpn/easy-rsa/
	./easyrsa build-client-full $CLIENT nopass
	# Generates the custom client.ovpn
	echo ""
	newclient "$CLIENT"
	echo ""
        arquivo=($CLIENT.ovpn)
        mv /root/$arquivo /root/ovpnauth
	useradd -M -s /bin/false -d /home/opencliente/ $CLIENT
	clear
        echo "-------------------------------------------"
	echo "Agora crie uma senha para este cliente."
	echo "Vale lembrar que como esta usando OpenVPN"
	echo "NÃO informe esta senha ao seu cliente,"
	echo "assim preservara o sistema de gerenciamento"
	echo "de validade. Digite qualquer coisa, afinal"
	echo "esta senha não será usada."
        echo "-------------------------------------------"
	echo " "
	read -p "Digite a senha para o cliente $CLIENT: " -e -i IdiiIIhgIi@[idiInbj2bjn senha
	usermod -p $(openssl passwd -1 $senha) $CLIENT
        clear
	echo "----------------------------------"
	echo "Agora vamos definir a validade...."
	echo "Escolha primeiro o Dia, depois MÊS"
	echo "E por fim o ANO de validade. Este "
	echo "script já pre determina a validade"
	echo "com 1 mês a frente então basta "
	echo "pressionar ENTER e confirmar a"
	echo "data ou modifique caso deseje....."
	echo "----------------------------------"
	DIAD=$(date +%d)  
	MESM=$(date +%m)
	ANOA=$(date +%Y)
	MESNOVO=$(($MESM+01))
	MESNOVOZ=`seq -f "%02g" $MESNOVO $MESNOVO`
	read -p "Digite o DIA com dois dígitos: " -e -i $DIAD dia
	echo " "
	read -p "Digite o MÊS com dois dígitos: " -e -i $MESNOVOZ mes
	echo " "
	read -p "Digite o ANO com quatro dígitos: " -e -i $ANOA ano
	usermod -e "$ano"-"$mes"-"$dia" "$CLIENT"
        clear
        validade=("$ano$mes$dia")
        echo "$CLIENT $validade">> /root/openclientes.db
	    echo "$CLIENT $validade">> /etc/penguin/backupOpenclientes.db
		cd /$USER
		cd /$USER/ovpnauth
		sed -e "s;http-proxy $IP 80;http-proxy $IP 80 userpass.conf basic;g" $CLIENT.ovpn > $CLIENT.ovpn2
		rm -R $CLIENT.ovpn
		mv $CLIENT.ovpn2 $CLIENT.ovpn
		cd /$USER
		cd /$USER
		cd /$USER/ovpnauth
		sed -e "s;http-proxy-option CUSTOM-HEADER X-Online-Host  sdp.vivo.com.br;http-proxy-option CUSTOM-HEADER X-Online-Host  $HOST;g" $CLIENT.ovpn > $CLIENT.ovpn2
		rm -R $CLIENT.ovpn
		mv $CLIENT.ovpn2 $CLIENT.ovpn
		cd /$USER
        echo "O Certificado do usuário $CLIENT está disponível em /root/ovpnauth/$CLIENT.ovpn"
        echo "Para verificar basta digitar: ls /root/ovpnauth/"
        echo "Para pegar este arquivo.ovpn use comandos ou aplicativos SFTP"
        echo " "
        echo "--------------------------------------------"
        echo "Usuário OpenVPN $CLIENT criado com sucesso"
	    echo "a validade do cliente $CLIENT é: $dia/$mes/$ano"
        echo "IP do servidor: $IP"
        echo "--------------------------------------------"
elif [[ "$resposta" = '3' ]]; then
	clear
	NUMBEROFCLIENTS=$(tail -n +2 /etc/openvpn/easy-rsa/pki/index.txt | grep -c "^V")
	if [[ "$NUMBEROFCLIENTS" = '0' ]]; then
		echo ""
		echo "Você não tem nenhum usuário existente no OpenVPN!"
		exit
	fi
	echo ""
	echo "Qual usuário deseja remover?"
	tail -n +2 /etc/openvpn/easy-rsa/pki/index.txt | grep "^V" | cut -d '=' -f 2 | nl -s ') '
	if [[ "$NUMBEROFCLIENTS" = '1' ]]; then
		read -p "Selecione um usuário [1]: " CLIENTNUMBER
	else
		read -p "Selecione um usuário [1-$NUMBEROFCLIENTS]: " CLIENTNUMBER
	fi
	CLIENT=$(tail -n +2 /etc/openvpn/easy-rsa/pki/index.txt | grep "^V" | cut -d '=' -f 2 | sed -n "$CLIENTNUMBER"p)
	cd /etc/openvpn/easy-rsa/
	./easyrsa --batch revoke $CLIENT
	./easyrsa gen-crl
	rm -rf pki/reqs/$CLIENT.req
	rm -rf pki/private/$CLIENT.key
	rm -rf pki/issued/$CLIENT.crt
	rm -rf /etc/openvpn/crl.pem
	cp /etc/openvpn/easy-rsa/pki/crl.pem /etc/openvpn/crl.pem
	# CRL is read with each client connection, when OpenVPN is dropped to nobody
	chown nobody:$GROUPNAME /etc/openvpn/crl.pem
	echo ""
        arquivo=$('$CLIENT'.ovpn)
        #Deletando Arquivo .ovpn
        arquivo=($CLIENT.ovpn)
        rm /root/ovpnauth/$arquivo
	userdel --force "$CLIENT"
        grep -v ^$CLIENT[[:space:]] /root/openclientes.db > /tmp/penguin ; cat /tmp/penguin > /root/openclientes.db
	grep -v ^$CLIENT[[:space:]] /etc/penguin/backupOpenclientes.db > /tmp/penguin ; cat /tmp/penguin > /etc/penguin/backupOpenclientes.db
        echo " "
	echo "Usuário $CLIENT removido"
	exit
elif [[ "$resposta" = '4' ]]; then
	clear
	#Esta parte é direto do script do phreaker56.xyz
	#Créditos a ele.
	echo "---------------------------------"
	read -p "Quer mesmo desinstalar o OpenVPN? [s/n]: " -e -i n REMOVE
	if [[ "$REMOVE" = 's' ]]; then
		PORT=$(grep '^port ' /etc/openvpn/server.conf | cut -d " " -f 2)
		if pgrep firewalld; then
			# Using both permanent and not permanent rules to avoid a firewalld reload.
			firewall-cmd --zone=public --remove-port=$PORT/tcp
			firewall-cmd --zone=trusted --remove-source=10.8.0.0/24
			firewall-cmd --permanent --zone=public --remove-port=$PORT/tcp
			firewall-cmd --permanent --zone=trusted --remove-source=10.8.0.0/24
		fi
		if iptables -L -n | grep -qE 'REJECT|DROP'; then
			sed -i "/iptables -I INPUT -p tcp --dport $PORT -j ACCEPT/d" $RCLOCAL
			sed -i "/iptables -I FORWARD -s 10.8.0.0\/24 -j ACCEPT/d" $RCLOCAL
			sed -i "/iptables -I FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT/d" $RCLOCAL
		fi
		sed -i '/iptables -t nat -A POSTROUTING -s 10.8.0.0\/24 -j SNAT --to /d' $RCLOCAL
		if hash sestatus 2>/dev/null; then
			if sestatus | grep "Current mode" | grep -qs "enforcing"; then
				if [[ "$PORT" != '1194' ]]; then
					semanage port -d -t openvpn_port_t -p tcp $PORT
				fi
			fi
		fi
		if [[ "$OS" = 'debian' ]]; then
			apt-get remove --purge -y openvpn openvpn-blacklist
		else
			yum remove openvpn -y
		fi
		rm -rf /etc/openvpn
		rm -rf /usr/share/doc/openvpn*
		echo ""
		echo "OpenVPN desinstalado com sucesso!"
	else
		echo ""
		echo "A desinstalação do OpenVPN foi cancelada!"
	fi
elif [[ "$resposta" = '5' ]]; then
        clear
        echo " "
	read -p "Nome do usuário OpenVPN para alterar a validade: " user
	if [[ -z $user ]]
	then
		echo ""
		tput setaf 7 ; tput setab 4 ; tput bold ; echo "Você digitou um nome de usuário vazio ou inválido!" ; tput sgr0
		echo ""
		exit 1
	else
		awk -F : ' { print $1 }' /etc/passwd > /tmp/users
		if grep -Fxq "$user" /tmp/users
		then
                	echo " "
        	else
                	clear
                	while true
                	do
				tput sgr0
				echo "----------------------------"
				echo "Usuário $user não existe..."
				echo " "
				echo "Digite o nome do usuário OpenVPN que deseja renovar:"
        			echo "---------------------------------------------------------"
				read -p "Nome do usuário: " user
                        	awk -F : ' { print $1 }' /etc/passwd > /tmp/users 
				if grep -Fxq "$user" /tmp/users
                        	then
			        	break
				else
                                	echo " "
                        	fi
			done
		fi
		clear
		echo "----------------------------------"
		echo "Agora vamos definir a validade...."
		echo "Escolha primeiro o Dia, depois MÊS"
		echo "E por fim o ANO de validade. Este "
		echo "script já pre determina a validade"
		echo "com 1 mês a frente então basta "
		echo "pressionar ENTER e confirmar a"
		echo "data ou modifique caso deseje....."
		echo "----------------------------------"
		DIAD=$(date +%d)  
		MESM=$(date +%m)
       		ANOA=$(date +%Y)
		MESNOVO=$(($MESM+01))
		MESNOVOZ=`seq -f "%02g" $MESNOVO $MESNOVO`
		read -p "Digite o DIA com dois dígitos: " -e -i $DIAD dia
		echo " "
		read -p "Digite o MÊS com dois dígitos: " -e -i $MESNOVOZ mes
		echo " "
		read -p "Digite o ANO com quatro dígitos: " -e -i $ANOA ano
		clear
		usermod -e "$ano"-"$mes"-"$dia" "$user"
		echo " "
        	echo " "
        	validade=("$ano$mes$dia")
        	grep -v ^$user[[:space:]] /root/openclientes.db > /tmp/mudar
		mv /tmp/mudar /root/openclientes.db
        	echo "$user $validade">> /root/openclientes.db
        	##mudanca
        	grep -v ^$user[[:space:]] etc/penguin/backupOpenclientes.db > /tmp/mudar
		mv /tmp/mudar etc/penguin/backupOpenclientes.db
		echo "$user $validade">> /etc/penguin/backupOpenclientes.db
		echo "-----------------------------------------------------------"
		echo "Validade do cliente $user alterada para: $dia/$mes/$ano"
        	echo "IP do Servidor: $IP"
		echo "-----------------------------------------------------------"

	fi
else
        clear
	echo "---------------"
	echo "opção invalida!"
	echo "---------------"
        clear
fi
