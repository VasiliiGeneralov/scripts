#!/usr/bin/env bash

git pull --rebase --recurse-submodules
sudo apt install\
  libevent-dev\
  ncurses-dev\
  build-essential\
  bison\
  pkg-config\
  autoconf\
  automake
sh autogen.sh
./configure
make && sudo make install
