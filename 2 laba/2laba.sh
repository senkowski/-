#!/bin/bash
#install all dependeces
git clone https://github.com/andrejv/maxima
cd maxima
sudo apt-get update
sudo apt-get install autotools-dev #Update infrastructure for config.{guess,sub} files
sudo apt-get install automake #Tool for generating GNU Standards-compliant Makefiles
sudo apt-get install texinfo #Documentation system for presentation on the web and printing
#lisp install
sudo apt-get install common-lisp-controller #Common Lisp source and compiler manager
apt-get install npm #package manager for Node.js
npm install bootstrap 
#project build
sudo ./bootstrap
sudo ./configure
sudo make
sudo make check
sudo make install
maxima
