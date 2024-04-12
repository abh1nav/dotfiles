#!/bin/sh

# Working directory
cd $HOME

# Reset
echo Delete any existing files
rm -Rf .oh-my-zsh \
        .myzsh \
        .vim \
        .vimrc \
        .zshrc \
        .nvm \
        .config/starship.toml \
        .config/nvim \
        .tmux.conf \
        .tmux

# Link .zshrc
echo Linking zshrc
ln -s $HOME/.dotfiles/.zshrc
touch .localzshrc

# Install oh-my-zsh and starship - zshrc allows you to pick between the two
## Clone oh-my-zsh and link theme
echo Setup oh-my-zsh
git clone https://github.com/robbyrussell/oh-my-zsh .oh-my-zsh
cd .oh-my-zsh/themes
ln -s ~/.dotfiles/.oh-my-zsh/themes/vibrantink.zsh-theme
## Link starship
echo Linking starship.toml
mkdir -p $HOME/.config
cd $HOME/.config
ln -s $HOME/.dotfiles/starship.toml

# Link nvim config
cd $HOME/.config
rm -Rf nvim
ln -s $HOME/.dotfiles/nvim

# Link tmux config and install Tmux Plugin Manager
cd $HOME
ln -s $HOME/.dotfiles/.tmux.conf
mkdir -p $HOME/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# Install nvm
cd $HOME
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Fonts
echo Look in the fonts directory to install the RobotoMonoNerd font.
echo Look in the iterm-themes directory to install the iTerm theme.
