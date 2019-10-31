#!/bin/bash

git config --global core.excludesfile ~/dotfiles/gitignore

binary=$(find -L /usr -name diff-highlight -type f 2> /dev/null | head -n 1)

sudo chmod +x $binary

cat <<HERE >> ~/.gitconfig
[pager]
	log = $binary | less
	show = $binary | less
	diff = $binary | less

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
