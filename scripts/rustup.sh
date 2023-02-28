#!/bin/bash

if ! which rustup ; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
fi

export PATH=$PATH:~/.cargo/bin

rustup component add clippy rust-src

