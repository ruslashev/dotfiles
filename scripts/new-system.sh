#!/bin/bash

set -e

cd ~/dotfiles/scripts/

echo '=== 1/11: packages.sh'
./packages.sh

echo '=== 2/11: pips.sh'
./pips.sh

echo '=== 3/11: zshrc.sh'
./zshrc.sh

echo '=== 4/11: set-links.sh'
./set-links.sh

echo '=== 5/11: git.sh'
./git.sh

echo '=== 6/11: alacritty.sh'
./alacritty.sh

echo '=== 7/11: rust.sh'
./rust.sh

echo '=== 8/11: rust-update.sh'
./rust-update.sh

echo '=== 9/11: monaco.sh'
./monaco.sh

echo '=== 10/11: build-alacritty.sh'
./build-alacritty.sh

echo '=== 11/11: vim.sh'
./vim.sh

