#!/usr/bin/env bash

git pull --rebase --recurse-submodules
rustup override set stable && rustup update stable
cargo build --release --no-default-features --features=x11
