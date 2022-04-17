#!/usr/bin/env bash

git pull --rebase --recurse-submodules
sh ./autogen.sh
./configure
make
