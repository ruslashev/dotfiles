#!/bin/bash

rustup override set stable
rustup update stable

rustup component add clippy rust-src

baseurl='https://github.com/rust-analyzer/rust-analyzer/releases/latest/download'
binary='rust-analyzer-x86_64-unknown-linux-gnu.gz'
tempdir=$(mktemp -d)

mkdir -p ~/bin
cd ~/bin || exit
curl -L "$baseurl/$binary" -o "$tempdir/$binary"
gzip -d "$tempdir/$binary" -c > ~/bin/rust-analyzer
chmod +x ~/bin/rust-analyzer

