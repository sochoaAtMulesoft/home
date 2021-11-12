#!/bin/bash -e
# vim: set ft=bash:

test -z "$DEBUG" || set -x

link_file() {
  local _FILE="$1"
  mkdir -p ~/.vim
  pushd vim &>/dev/null                      \
    && echo "$(pwd)/$_FILE => ~/.vim/$_FILE" \
    && ln -s -f "$(pwd)/$_FILE" ~/.vim/      \
    && popd &>/dev/null
}

for f in vim/* ; do 
  b="$(basename $f)"; 
  ( link_file "$b" ); 
done;

test -z "$DEBUG" || set +x
