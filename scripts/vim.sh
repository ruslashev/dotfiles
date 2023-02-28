#!/bin/bash

mkdir -p ~/.vim/
mkdir -p ~/.vim/colors
mkdir -p ~/.vim/undo

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/dotfiles/vim/colors/paramount_low_contrast.vim ~/.vim/colors/paramount_low_contrast.vim
ln -s ~/dotfiles/vim/coc-settings.json ~/.vim/coc-settings.json

vim -c PlugInstall ~/.vimrc

