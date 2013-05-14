#!/bin/bash 

# dump everything to the CLI
set -x

# cleaning the tmp folder
mkdir -p $HOME/opt/tmp
rm -Rf $HOME/opt/tmp/*

cd $HOME/opt/tmp
hg clone https://vim.googlecode.com/hg/ vim
cd vim/
./configure --prefix=$HOME/opt \
              --without-x \
              --disable-nls \
              --enable-multibyte \
              --with-tlib=ncurses \
              --enable-pythoninterp \
              --enable-rubyinterp \
              --with-ruby-command=/usr/bin/ruby \
              --with-features=huge
make
make install
