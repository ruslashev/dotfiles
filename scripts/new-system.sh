#!/bin/bash

set -e

cd ~/dotfiles/scripts/

echo '=== 1/9: packages.sh'
./packages.sh

echo '=== 2/9: zshrc.sh'
./zshrc.sh

echo '=== 3/9: set-links.sh'
./set-links.sh

echo '=== 4/9: git.sh'
./git.sh

echo '=== 5/9: alacritty.sh'
./alacritty.sh

echo '=== 6/9: rust.sh'
./rust.sh

echo '=== 7/9: rust-update.sh'
./rust-update.sh

echo '=== 8/9: monaco.sh'
./monaco.sh

echo '=== 9/9: vim.sh'
./vim.sh

