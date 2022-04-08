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
red="\x1b[31m"

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
  if [[ ! -f $2 ]]; then
    say "${cyan}Installing $2 ..."
    load $1 $2
    if [[ $3 ]] && test -s "$2/Dockerfile"; then
      # Building
      sudo docker build $2 -t $3
    else
      echo -e "${red}Dockerfile is empty! $reset_fore"
    fi
    say "${green}$2 installed!"
    sleep "2"
  fi
}

# Ukraine
echo -e "$blue_back$yellow   UA   $clr"
echo -e "$yellow_back$blue  DDoS  $clr"
sleep "3"

say "${green}Installing started"
# Start
sleep "1"

mkdir apps
# Making dir for downloaded apps
cd apps

sudo pip3 install --upgrade pip > /dev/null
# Upgrading pip in /dev/nul for without logs

pkgdir="../UA-DDoS/packages/"

if [[ $1 ]]; then
  case $1 in
    spam)
      config=${pkgdir}spam/config.txt
      functions=${pkgdir}spam/functions.sh
      ;;
    *)
      if [[ -f $1 ]]; then
        config=../$1
      else
        echo "None package $1 :)"
      fi
      # Custom config
  esac
else
  config="${pkgdir}standart/config.txt"
  functions="${pkgdir}standart/functions.sh"
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

. ../UA-DDoS/main-functions.sh
. $functions

if [[ $(uname) == "Linux" ]]; then
  sudo cp $functions ../../etc/profile.d
  sudo cp ../UA-DDoS/main-functions.sh ../../etc/profile.d
  # Integration autorun file for functions
else
  echo -e "${red}Your OS is not ${yellow}Linux! \n${red}Autorun not supported! $reset_fore"
fi

cd ..