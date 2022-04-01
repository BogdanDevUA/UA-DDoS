function uashield() {
  docker run uashield $*
}
function mhddos() {
  docker run mhddos $*
}
function ddos-ripper() {
  cd apps/DDoS-Ripper
  python3 DRipper.py $*
}
spam-email() {
  python3 apps/SPAM-EMAIL/spam-email-v2.py
}
function load() {
  git clone https://github.com/$1/$2.git
}