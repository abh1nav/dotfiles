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

# Install nvchad
git clone https://github.com/NvChad/NvChad $HOME/.config/nvim --depth 1

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Link nvim customizations
cd $HOME/.config/nvim/lua
rm -Rf custom
ln -s $HOME/.dotfiles/nvim/lua/custom

# Fonts
echo Look in the fonts directory to install the RobotoMonoNerd font.
echo Setup Warp to use the RobotoMonoNerd font.
