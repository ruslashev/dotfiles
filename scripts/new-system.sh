#!/bin/bash

set -e

cd ~/dotfiles/scripts/

echo '=== 1/10: packages.sh'
./packages.sh

echo '=== 2/10: pips.sh'
./pips.sh

echo '=== 3/10: zshrc.sh'
./zshrc.sh

echo '=== 4/10: set-links.sh'
./set-links.sh

echo '=== 5/10: git.sh'
./git.sh

echo '=== 6/10: alacritty.sh'
./alacritty.sh

echo '=== 7/10: rust.sh'
./rust.sh

echo '=== 8/10: monaco.sh'
./monaco.sh

echo '=== 9/10: build-alacritty.sh'
./build-alacritty.sh

echo '=== 10/10: vim.sh'
./vim.sh

