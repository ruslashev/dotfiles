#!/bin/zsh

mkdir -p ~/.vim/
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/undo

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s $(pwd)/../vim/colors/solarized.vim ~/.vim/colors/solarized.vim

vim -c PlugInstall ~/.vimrc

