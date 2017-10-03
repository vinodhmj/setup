#!/bin/bash

sudo apt-get install -y curl

# Install emacs
sudo apt-get update
sudo apt-get install -y emacs

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
if [ -f '.emacs' ]; then
    mv .emacs .emacs.old
fi


git clone https://github.com/vinodhmj/dotfiles.git
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .
ln -sf dotfiles/.Xmodmap

git clone https://github.com/vinodhmj/projects.git
