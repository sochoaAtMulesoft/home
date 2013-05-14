#!/bin/bash 

# dump everything to the CLI
set -x

# cleaning the tmp folder
mkdir -p $HOME/opt/tmp
rm -Rf $HOME/opt/tmp/*

cd $HOME/opt/tmp
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.3.tar.bz2
tar -jxf vim-7.3.tar.bz2
cd vim73/
./configure --prefix=$HOME/opt \
            --enable-pythoninterp \
            --enable-gui=no
            --without-x \
            --enable-multibyte \
            --with-tlib=ncurses \
            --enable-rubyinterp \
            --with-ruby-command=/usr/bin/ruby \
            --with-features=huge
make
make install
