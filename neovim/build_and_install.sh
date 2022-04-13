#!/usr/bin/env bash

git pull --rebase --recurse-submodules
sudo make CMAKE_BUILD_TYPE=Release && sudo make install
