#!/bin/zsh

mkdir ~/.vim/
mkdir ~/.vim/colors
mkdir ~/.vim/undo

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cp ~/dotfiles/vim/colors/solarized.vim ~/.vim/colors

vim -c PlugInstall ~/.vimrc

