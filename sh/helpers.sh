#!/bin/bash
#vim :set ft=bash:
download_cert() {
  local _HOST="${1}"
  local _PORT="${2:-443}"
  local CERTS="$(echo -n |                                       \
    openssl s_client                                             \
        -connect $_HOST:$_PORT                                   \
        -servername $_HOST                                       \
        | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p')"
  echo "$CERTS" | openssl x509 -in /dev/stdin -noout -text
}

ports(){
  sudo lsof -nP -iTCP \
    | awk '/LISTEN/{$4=$6=$7=""; print $0}' \
    | column -t -s' '
}
alias ports='ports'
