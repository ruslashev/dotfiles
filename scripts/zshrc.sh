#!/bin/bash

wget 'https://git.grml.org/?p=grml-etc-core.git;a=blob_plain;f=etc/zsh/zshrc;hb=HEAD' -O ~/.zshrc

sudo chsh -s /bin/zsh $USER

