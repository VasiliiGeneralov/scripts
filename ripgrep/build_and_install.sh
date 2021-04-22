#!/usr/bin/env bash

git fetch $(git remote show | head -n 1)
git pull --rebase --recurse-submodules
rustup override set stable
rustup update stable
unset CC && export CC=$(which clang-12) && echo $CC
unset CXX && export CXX=$(which clang++-12) && echo $CXX
export PCRE2_SYS_STATIC=1
cargo build --release --features 'pcre2'
cargo test --all
target/release/rg --version
sudo cp -v target/release/rg /usr/local/bin/
