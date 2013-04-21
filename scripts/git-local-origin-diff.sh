#!/bin/bash

set -x
for i in $(find $HOME -maxdepth 3 -name ".git")
do
    dir="$(dirname $i)"
    cd $dir
    git branch -v | grep remote
    git fetch --all
done
set +x
