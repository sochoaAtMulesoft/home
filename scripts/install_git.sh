#!/bin/bash

# dump everything to the CLI
set -x

# cleaning the tmp folder
mkdir -p $HOME/opt/tmp
rm -Rf $HOME/opt/tmp/*

cd $HOME/opt/tmp
wget https://github.com/git/git/archive/master.tar.gz -O git.tgz
tar -zxf git.tgz
cd git-master/
make prefix=$HOME/opt all
make install
