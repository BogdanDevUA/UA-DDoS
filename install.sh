#!/bin/bash
#!/usr/bin/env bash
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
}

function load() {
  git clone https://github.com/$1/$2.git
}

function install() {
  say "${cyan}Installing $2 ..."
  load $1 $2
  if [[ $3 && $4 && $3=--build ]]; then
    docker build $2 -t $4
  fi
  say "${green}$2 installed!"
  sleep "2"
}

cd ..

echo -e "${blue_back}${yellow}+       +$clr"
echo -e "${yellow} UA-${blue}DDoS $clr"
echo -e "${yellow_back}${blue}+       +$clr"
sleep "3"

say "${green}Installing started"
sleep "1"

mkdir apps
cd apps

pip install --upgrade pip > /dev/null

install opengs uashield --build uashield
install MHProDev MHDDoS --build mhddos
install palahsu DDoS-Ripper
install mkdirlove SPAM-EMAIL

sleep "2"

say "${green}Installed packages: ${cyan}uashield, MHDDoS, DDoS-Ripper, SPAM-EMAIL"
echo -e "${blue}Glory ${yellow}Ukraine!"

cd ..
cd UA-DDoS