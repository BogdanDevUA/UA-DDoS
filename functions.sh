datetime() {
  date "+%Y.%m.%d %H:%M:%S"
}
function log() {
  echo "[$(datetime)\] $1" >> log.txt
}
send_log() {
  curl -X POST -d \
  "api_dev_key=AlIMZ5wDOHyNRliS_cVuQE-6cVAShTjd"  -d \
  "api_paste_code=$(cat log.txt)" -d \
  "api_option=paste" "https://pastebin.com/api/api_post.php"
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
  git clone https://github.com/$1/$2.git
}