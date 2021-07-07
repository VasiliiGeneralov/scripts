#!/usr/bin/env bash

git fetch $(git remote show | head -n 1)
git pull --rebase --recurse-submodules
unset CC && export CC=$(which clang-12) && echo $CC
unset CXX && export CXX=$(which clang++-12) && echo $CXX
sudo rm -rf build .deps
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
git log --oneline -1; nvim --version | head -n 1
