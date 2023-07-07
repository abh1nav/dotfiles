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

# Tmux setup
echo Setting up tmux
cd ~
ln -s ~/.dotfiles/.tmux.conf

# Vim setup
echo Vim setup
ln -s ~/.dotfiles/.vimrc
mkdir ~/.vim
cd ~/.vim
ln -s ~/.dotfiles/.vim/autoload
ln -s ~/.dotfiles/.vim/colors
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
echo Installing vim-fugitive \(For git branch display\)
git clone https://github.com/tpope/vim-fugitive.git
echo Installing Bbye \(Close buffers without deleting the window\)
git clone https://github.com/moll/vim-bbye.git

# Install tools based on OS
if [[ $(uname) == "Darwin" ]]; then
    source ./setup-mac.sh
# elif command -v apt > /dev/null; then
#     source ./setup-deb.sh
else
    echo 'skipping tools install'
fi

# Fonts
echo Look in the fonts directory to install patched powerline fonts for powerline to work properly.
echo Also, setup iTerms profile to point to the patched version of Droid Sans Mono.
