#!/bin/sh

# Working directory
cd $HOME

# Reset
echo Delete any existing files
rm -Rf .oh-my-zsh .myzsh .tmux.conf .vim .vimrc .zshrc .nvm

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

# Install nvm
cd ~
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh |  bash

# Install nvchad
cd ~
mkdir -p ~/.config
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# Fonts
echo Look in the fonts directory to install patched powerline fonts for powerline to work properly.
echo Also, setup iTerms profile to point to the patched version of Droid Sans Mono.
