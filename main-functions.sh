function load() {
  git clone https://github.com/$1/$2.git
}

function install() {
  if [[ ! -f $2 ]]; then
    say "${cyan}Installing $2 ..."
    load $1 $2
    if [[ $3 ]] && test -s "$2/Dockerfile"; then
      # Building
      docker build $2 -t $3
    else
      echo -e "${red}Dockerfile is empty! $reset_fore"
    fi
    say "${green}$2 installed!"
    sleep "2"
  fi
}