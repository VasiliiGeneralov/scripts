#!/usr/bin/env bash

if [[ $(infocmp alacritty) -ne 0 ]]; then
  tic -xe alacritty,alacritty-direct extra/alacritty.info
fi

cp target/release/alacritty /usr/local/bin
cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
desktop-file-install extra/linux/Alacritty.desktop
update-desktop-database

mkdir -p /usr/local/share/man/man1
gzip -c extra/alacritty.man | tee /usr/local/share/man/man1/alacritty.1.gz > /dev/null
gzip -c extra/alacritty-msg.man | tee /usr/local/share/man/man1/alacritty-msg.1.gz > /dev/null
