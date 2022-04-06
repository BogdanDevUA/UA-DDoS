#!/bin/bash
#!/usr/bin/env bash

# === COLORS ==============
reset_fore="\x1b[37m"
reset_back="\x1b[49m"
green="\x1b[32m"
cyan="\x1b[36m"
yellow="\x1b[33m"
blue="\x1b[34m"
yellow_back="\x1b[43m"
blue_back="\x1b[44m"

clr=$reset_fore$reset_back
# =========================

function say() {
  clear
  echo -e $1$reset_fore
  echo ""
}

function load() {
  # Git Clonner
  git clone https://github.com/$1/$2.git
}

function install() {
  say "${cyan}Installing $2 ..."
  load $1 $2
  if [[ $3 ]]; then
    # Building
    docker build $2 -t $3
  fi
  say "${green}$2 installed!"
  sleep "2"
}

# Ukraine
echo -e "${blue_back}${yellow}+       +$clr"
echo -e "${yellow} UA-${blue}DDoS $clr"
echo -e "${yellow_back}${blue}+       +$clr"
sleep "3"

say "${green}Installing started"
# Start
sleep "1"

mkdir apps
# Making dir for downloaded apps
cd apps

sudo pip3 install --upgrade pip > /dev/null
# Upgrading pip in /dev/nul for without logs

if [[ $1 ]]; then
  config=../../$1
  # Custom config
else
  config="../basic_config.txt"
fi
installed=
while IFS= read -r line; do 
  eval "line=$line"
  len=${#line}
  if [[ $len ]]; then
    install ${line[@]}
    installed="$installed${line[1]} "
  fi
done < $config

sleep "2"

say "${green}Installed packages: ${cyan}$installed"
echo -e "${blue}Glory ${yellow}Ukraine!$reset_fore"
# Ending

cd ../UA-DDoS
. functions.sh && cp functions.sh ../../etc/profile.d
# Integration autorun file for functions
cd ..