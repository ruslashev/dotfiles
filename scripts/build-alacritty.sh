#!/bin/bash

rustup override set stable
rustup update stable

mkdir -p ~/build
cd ~/build
rm -rf alacritty

git clone https://github.com/jwilm/alacritty.git
cd alacritty
git checkout -b good 52fecd7

cargo build --release

sudo cp target/release/alacritty /usr/local/bin
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/alacritty.desktop
sudo update-desktop-database
