#!/bin/bash
# vim: set ft=bash:

trim_beginning() {
  awk 'NF {p=1} p' "$1"
}

trim_beginning     \
  | tac            \
  | trim_beginning \
  | tac
