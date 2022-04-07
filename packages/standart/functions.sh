function uashield() {
  sudo docker run uashield $*
}
function mhddos() {
  sudo docker run mhddos $*
}
function ddos-ripper() {
  cd apps/DDoS-Ripper
  python3 DRipper.py $*
}
spam-email() {
  python3 apps/SPAM-EMAIL/spam-email-v2.py
}