#!/usr/bin/env bash

git pull --rebase
rustup override set stable
rustup update stable
cargo build --release
cargo test
just man
sudo cp -v target/release/exa /usr/local/bin/
sudo mkdir -p /usr/local/share/man/man1
gzip -c target/man/exa.1 | sudo tee /usr/local/share/man/man1/exa.1.gz > /dev/null
