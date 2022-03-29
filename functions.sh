datetime() {
  date "+%Y.%m.%d %H:%M:%S"
}
function log() {
  echo "[$(datetime)] $1" >> log.txt
}
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
  log $(git clone https://github.com/$1/$2.git)
}