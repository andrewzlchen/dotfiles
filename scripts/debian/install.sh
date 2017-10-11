#!/bin/bash

apt-get update
apt-get install vim
apt-get install tmux
apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
ln ~/dotfiles/.vimrc ~/.vimrc
