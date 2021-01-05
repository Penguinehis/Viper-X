#!/bin/bash
#Scripiter Penguin
#

menu ()
{

clear
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "UserTemporario" ; tput sgr0 ; echo ""
tput setaf 2 ; tput bold ; printf '%s' "|1|"; tput setaf 6 ; printf '%s' " Criar" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Iniciara a criacao de um usuario temporario" ; tput sgr0 ;
tput setaf 2 ; tput bold ; printf '%s' "|0|"; tput setaf 6 ; printf '%s' " Sair" ; tput setaf 4 ; printf '%s' " = " ; tput setaf 7 ; echo "Simplesmente voltara para o menu" ; tput sgr0 ;
echo ""
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Digite a opcao desejada" ; tput sgr0 ; echo ""
read  opcao

case $opcao in
	1) criarusuarioteste ;;
	0) exit ;;
esac

}

criarusuarioteste()
{
mkdir /etc/usuariosteste 1>/dev/null 2>/dev/null
echo -e "   Usuarios teste"
for testus in $(ls /etc/usuariosteste |sort |sed 's/.sh//g')
do
echo "$testus"
done
printf "\n"
printf "Nome do novo usuario: "; read nome
printf "Senha do usuario: "; read pass
echo -e "\nUse s = segundos, m = minutos, h = horas e d = dias EX: 14s ."
printf "Quanto tempo usuario $nome deve durar: ";read tempoin
tempo=$(echo "$tempoin" |sed 's/ //g')
useradd -M -s /bin/false $nome
(echo $pass;echo $pass) |passwd $nome 1>/dev/null 2>/dev/null
echo "#!/bin/bash
sleep $tempo
kill"' $(ps -u '"$nome |awk '{print"' $1'"}') 1>/dev/null 2>/dev/null
userdel --force $nome
rm -rf /etc/usuariosteste/$nome.sh
exit" > /etc/usuariosteste/$nome.sh
echo -e "Usuario: $nome
Senha: $pass
Validade: $tempo\n
Apos o tempo expirar o usuario sera deletado e todos serão desconectados."
bash /etc/usuariosteste/$nome.sh &
exit
}

menu

