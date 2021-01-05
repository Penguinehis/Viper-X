#!/bin/bash
#Scripiter Penguin
#

menu ()
{

clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "System Details" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Status" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Mostrara o Status da VPS e seus recursos" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0|"; tput setaf 6 ; printf '%s' " Sair" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Simplesmente voltara para o menu" ; tput sgr0 ;
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) sistemadetalhes ;;
	0) exit ;;
esac

}

sistemadetalhes(){
if [ -f /proc/cpuinfo ]
then
echo -e "\n\033[1;30mProcessador\033[0m"
modelo=$(cat /proc/cpuinfo |grep "model name" |uniq |awk -F : {'print $2'})
cpucores=$(cat /proc/cpuinfo |grep "cpu cores" |uniq |awk -F : {'print $2'})
cache=$(cat /proc/cpuinfo |grep "cache size" |uniq |awk -F : {'print $2'})
echo -e "\033[1;32mModelo:\033[0m$modelo"
echo -e "\033[1;32mNucleos:\033[0m$cpucores"
echo -e "\033[1;32mMemoria Cache:\033[0m$cache"
echo -e "\033[1;32mArquitetura: \033[0m$(uname -p)"
else
echo -e "\033[1;30mProcessador\033[0m"
echo "Não foi possivel encontrar /proc/cpuinfo"
fi
if [ -f /etc/lsb-release ]
then
echo -e "\n\033[1;30mSistema Operacional\033[0m"
name=$(cat /etc/lsb-release |grep DESCRIPTION |awk -F = {'print $2'})
codename=$(cat /etc/lsb-release |grep CODENAME |awk -F = {'print $2'})
echo -e "\033[1;32mNome: \033[0m$name"
echo -e "\033[1;32mCodeName: \033[0m$codename"
echo -e "\033[1;32mKernel: \033[0m$(uname -s)"
echo -e "\033[1;32mKernel Release: \033[0m$(uname -r)"
if [ -f /etc/os-release ]
then
devlike=$(cat /etc/os-release |grep LIKE |awk -F = {'print $2'})
echo -e "\033[1;32mDerivado do Antecedente OS: \033[0m$devlike"
fi
else
echo -e "\n\033[1;30mSistema Operacional\033[0m"
echo "Não foi possivel encontrar /etc/lsb-release"
fi
if free 1>/dev/null 2>/dev/null
then
echo -e "\n\033[1;30mMemoria RAM\033[0m"
echo -e "\033[1;32mTotal: \033[0m$(free -m |grep -i mem |awk {'print $2'}) MB | $(( $(free -m |grep -i mem |awk {'print $2'}) / 1024 )) GB"
echo -e "\033[1;32mEm Uso: \033[0m$(free -m |grep -i mem |awk {'print $3'}) MB | $(( $(free -m |grep -i mem |awk {'print $3'}) / 1024 )) GB"
echo -e "\033[1;32mLivre: \033[0m$(free -m |grep -i mem |awk {'print $4'}) MB | $(( $(free -m |grep -i mem |awk {'print $4'}) / 1024 )) GB"
echo -e "\n\033[1;30mSwap\033[0m"
echo -e "\033[1;32mTotal: \033[0m$(free -m |grep -i swap |awk {'print $2'}) MB | $(( $(free -m |grep -i swap |awk {'print $2'}) / 1024 )) GB"
echo -e "\033[1;32mEm Uso: \033[0m$(free -m |grep -i swap |awk {'print $3'}) MB | $(( $(free -m |grep -i swap |awk {'print $3'}) / 1024 )) GB"
echo -e "\033[1;32mLivre: \033[0m$(free -m |grep -i swap |awk {'print $4'}) MB | $(( $(free -m |grep -i swap |awk {'print $4'}) / 1024 )) GB"
else
echo -e "\n\033[1;30mMemoria RAM\033[0m"
echo "Não foi possivel obter informações sobre a memoria RAM"
fi
sleep 10
exit
}

menu

