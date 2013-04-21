#!/bin/bash

# dump everything to the CLI
set -x

cwd=$(pwd)
sudo mkdir -p /opt/zonar
cd /tmp
sudo rm -f /tmp/Python-2.7.3.tgz
wget http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tgz
tar -zxf Python-2.7.3.tgz
cd Python-2.7.3
./configure --prefix=/opt/zonar && make && sudo make install
cd $cwd
rm -Rf /tmp/Python-2.7.3*
/opt/zonar/bin/python -c "import sys"
