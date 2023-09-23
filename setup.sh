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

# Fonts
echo Look in the fonts directory to install patched powerline fonts for powerline to work properly.
echo Also, setup iTerms profile to point to the patched version of Droid Sans Mono.
