#!/bin/bash

if ! which rustup ; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

rustup override set stable
rustup update stable

rustup component add clippy rust-src

mkdir -p ~/bin
cd ~/bin || exit
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux \
    -o ~/bin/rust-analyzer
chmod +x ~/bin/rust-analyzer

