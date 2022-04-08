#!/usr/bin/env bash

git pull --rebase --recurse-submodules
make CMAKE_BUILD_TYPE=Release && sudo make install
