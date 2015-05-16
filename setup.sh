#!/bin/sh

# Working directory
cd ~

# Reset
echo Delete any existing files
rm -Rf .oh-my-zsh .myzsh .tmux.conf .vim .vimrc .zshrc

# Clone oh-my-zsh and link theme
echo Setup oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh .oh-my-zsh
cd .oh-my-zsh/themes
ln -s ~/.dotfiles/.oh-my-zsh/themes/vibrantink.zsh-theme

# Link .zshrc
echo Linking zshrc
cd ~
ln -s ~/.dotfiles/.zshrc
touch .localzshrc

# Vim setup
echo Vim setup
mkdir ~/.vim
cd ~/.vim
ln -s ~/.dotfiles/autoload
ln -s ~/.dotfiles/colors
mkdir bundle
echo Installing vim plugins
cd bundle
echo Installing NERDTree
git clone https://github.com/scrooloose/nerdtree.git
echo Installing CtrlP
git clone https://github.com/kien/ctrlp.vim.git
echo Installing Airline
git clone https://github.com/bling/vim-airline.git
echo Installing vim-go
git clone https://github.com/fatih/vim-go.git

# Tmux setup
echo Setting up tmux
cd ~
ln -s ~/.dotfiles/.tmux.conf
