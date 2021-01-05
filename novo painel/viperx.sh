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
port1=$(lsof -i -P -n | grep LISTEN | grep stunnel | sed -n -e '1{s/^.*://p}')
port2=$(lsof -i -P -n | grep LISTEN | grep squid* | sed -n -e '1{s/^.*://p}')
port3=$(lsof -i -P -n | grep LISTEN | grep stunnel | sed -n -e '1{s/^.*://p}')
port4=$(lsof -i -P -n | grep LISTEN | grep stunnel | sed -n -e '1{s/^.*://p}')
tput setaf 5 ; tput setab 4 ; tput bold ; printf '%30s%s%-10s\n' "Viper X 1.0" ; tput sgr0 ; echo ""
tput setaf 2 ; printf "${green} Stunnel Port:${red} $port1 | sed -n 's_([^ ]*__p'${white}" ; printf "${green} Squid Port:${red} $port2 | sed -n 's_([^ ]*__p'${white}"