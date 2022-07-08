#!/usr/bin/env bash

git pull --rebase --recurse-submodules
make CMAKE_BUILD_TYPE="RelWithDebInfo" CMAKE_INSTALL_PREFIX="/home/vg/.local/"
