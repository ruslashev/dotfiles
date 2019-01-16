#!/bin/zsh

mkdir ~/.vim/
mkdir ~/.vim/colors
mkdir ~/.vim/undo

sudo apt -y install curl python3-pip ctags cmake

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp vim/colors/solarized.vim ~/.vim/colors

vim -c PlugInstall ~/.vimrc

