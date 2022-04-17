#!/usr/bin/env bash

git pull --rebase --recurse-submodules
rustup override set stable && rustup update stable
cargo test --all && cargo build --release
