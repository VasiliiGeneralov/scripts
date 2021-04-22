#!/usr/bin/env bash

git fetch $(git remote show | head -n 1)
git pull --rebase --recurse-submodules
unset CC && export CC=$(which clang-12) && echo $CC
unset CXX && export CXX=$(which clang++-12) && echo $CXX
./autogen.sh
./configure && make
sudo make install
