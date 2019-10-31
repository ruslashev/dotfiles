#!/bin/bash

git config --global core.excludesfile ~/dotfiles/gitignore

binary=$(find -L /usr -name diff-highlight -type f 2> /dev/null | head -n 1)

git config --global core.pager $binary

cat <<HERE >> ~/.gitconfig
[color "diff"]
	commit = blue
	meta = yellow
	frag = cyan
	old = red
	new = green
	whitespace = red reverse

[color "diff-highlight"]
	oldNormal = red
	oldHighlight = red 52
	newNormal = green
	newHighlight = green 22

HERE
