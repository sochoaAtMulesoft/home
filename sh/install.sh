#!/bin/bash -e
# vim: set ft=bash:

test -z "$DEBUG" || set -x

link_file() {
  local _FILE="$1"
  local _TO_DIR="$2"
  echo "$(pwd)/$_FILE => ${_TO_DIR}/$_FILE"
  ln -s -f "$(pwd)/$_FILE" "${_TO_DIR}"
}

# vim/* => ~/.vim/
for f in vim/* ; do b="$(basename $f)"; ( pushd vim &>/dev/null; link_file "$b" "$HOME/.vim" ); done;

# *.sh => ~/
for f in sh/*.sh ; do echo $f | grep -iq "install" && continue; b="$(basename $f)"; ( pushd sh &>/dev/null; link_file "$b" "$HOME" ); done;

if [[ $SHELL == */zsh ]]; then
  if [[ -f ~/.zshrc ]] && [[ ! -L ~/.zshrc ]]; then
    echo "Backing up ~/.zshrc"
    mv ~/.zshrc ~/.zshrc.bak-$(date +"%Y%m%d%H%M%S")
  fi
  ln -sf $(pwd)/zshrc ~/.zshrc
fi
