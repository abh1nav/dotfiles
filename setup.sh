#!/bin/sh

# Working directory
cd $HOME

# Reset
echo Delete any existing files
rm -Rf .oh-my-zsh \
        .myzsh \
        .tmux.conf \
        .vim \
        .vimrc \
        .zshrc \
        .nvm \
        .config/starship.toml \
        .config/nvim \
        .tmux

# Make sure .config exists
mkdir -p $HOME/.config

# Link .zshrc
echo Linking zshrc
ln -s $HOME/.dotfiles/.zshrc
touch .localzshrc

# Link starship
echo Linking starship.toml
cd $HOME/.config
ln -s $HOME/.dotfiles/starship.toml

# Install nvm
cd $HOME
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Link nvim config
cd $HOME/.config
rm -Rf nvim
ln -s $HOME/.dotfiles/nvim

# Link tmux config and install Tmux Plugin Manager
cd $HOME
ln -s $HOME/.dotfiles/.tmux.conf
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Fonts
echo Look in the fonts directory to install the RobotoMonoNerd font.

