#!/bin/bash

install_log="$(pwd)/install.log"

sudo yum install mercurial

if [ ! -d "vim/src" ]; then 
    hg clone https://vim.googlecode.com/hg/ vim
else
    cd vim/src
    hg pull
    hg update
fi

cd vim/src

mkdir -p ~/opt

./configure --with-features=huge \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --enable-cscope \
            --enable-gui=no \
            --without-x \
            --prefix="${HOME}/opt"
            
make -j$(nproc)

make install


