#!/bin/bash
#!/usr/bin/env bash

datetime() {
  date "+%Y.%m.%d %H:%M:%S"
}

function log() {
  echo "[$(datetime)] $1" >> ./log.txt
}

reset_fore="\x1b[37m"
reset_back="\x1b[49m"
green="\x1b[32m"
cyan="\x1b[36m"
yellow="\x1b[33m"
blue="\x1b[34m"
yellow_back="\x1b[43m"
blue_back="\x1b[44m"

clr=$reset_fore$reset_back

function say() {
  clear
  echo -e $1$reset_fore
  echo ""
  log $1
}

function load() {
  log $(git clone https://github.com/$1/$2.git)
}

function install() {
  say "${cyan}Installing $2 ..."
  load $1 $2
}

function installed() {
  say "${green}$1 installed!"
  sleep "2"
}

cd ..
rm -rf my_name.txt
rm -rf log.txt

echo $(uname -a) >> my_name.txt

echo -e "${blue_back}${yellow}+       +$clr"
echo -e "${yellow} UA-${blue}DDoS $clr"
echo -e "${yellow_back}${blue}+       +$clr"
sleep "3"

say "${green}Installing started"
sleep "1"

mkdir apps
cd apps

log $(pip install --upgrade pip)

install opengs uashield
docker build uashield -t uashield
installed uashield
install MHProDev MHDDoS
docker build MHDDoS -t mhddos
installed MHDDoS
install palahsu DDoS-Ripper
installed DDoS-Ripper
install mkdirlove SPAM-EMAIL
installed SPAM-EMAIL

sleep "2"

say "${green}Installed packages: ${cyan}uashield, MHDDoS, DDoS-Ripper, SPAM-EMAIL"
echo -e "${blue}Glory ${yellow}Ukraine!"

cd ..
cd UA-DDoS