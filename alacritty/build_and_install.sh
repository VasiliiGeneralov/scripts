#!/usr/bin/env bash

git fetch $(git remote show | head -n 1)
git pull --rebase --recurse-submodules
rustup override set stable
rustup update stable
unset CC && export CC=$(which clang-12) && echo $CC
unset CXX && export CXX=$(which clang++-12) && echo $CXX
sudo apt install\
  cmake\
  pkg-config\
  libfreetype6-dev\
  libfontconfig1-dev\
  libxcb-xfixes0-dev\
  libxkbcommon-dev\
  python3
cargo build --release
infocmp alacritty
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
sudo mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | sudo tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
git log --oneline -1
alacritty --version
