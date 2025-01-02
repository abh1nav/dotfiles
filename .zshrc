# Functions
addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

addToPathTail() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

# List large files in the current directory
fn largeFiles() {
    du -h . | grep '[0-9]\{3\}M'
}

# ZSH Setup
# Colours
export TERM=xterm-256color
# Uncomment this block to use oh-my-zsh (and comment out the starship block below)
# # # # # oh-my-zsh start # # # # # #
## Path to your oh-my-zsh configuration.
# ZSH=$HOME/.oh-my-zsh
# ZSH_THEME="vibrantink"
# DISABLE_AUTO_TITLE="false"
# DISABLE_AUTO_UPDATE="true"
# COMPLETION_WAITING_DOTS="true"
# plugins=(git)
# source $ZSH/oh-my-zsh.sh
# # The git plugin had this bad idea
# unalias gm
# # # # # # oh-my-zsh end # # # # # #
# 
#
# Uncomment this block to use starship (and comment out the oh-my-zsh block above)
# # # # # # starship start # # # # # #
export STARSHIP_CONFIG=$HOME/.config/starship.toml
eval "$(starship init zsh)"
# # # # # # starship end # # # # # #
#
# Basics
#
export GPG_TTY=$(tty)
export EDITOR='nvim'

# History
source <(fzf --zsh)
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt extended_history
setopt share_history
setopt hist_expire_dups_first

#
# Vim aliases
alias vi='nvim'
alias vim='nvim'
#
# Tmux aliases
# Create new tmux session with the provided name
alias tm='tmux new -s ' # Example: tm api-server
# Attach to an existing tmux session with the given name
alias tma='tmux attach -d -t' # Example: tma api-server
# Create new tmux session with the name of the current folder
alias tmg='tmux new -s $(basename $(pwd))'
#
# Git alias
alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
#
# Golang
export GOPATH="$HOME/go"
export GOPRIVATE="github.com/twitsprout,github.com/abh1nav"
#
# Rust
export RUSTUP_HOME="$HOME/.config/rustup"
export CARGO_HOME="$HOME/.config/cargo"
#
# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
#
# PATH mods
addToPathTail $GOPATH/bin
addToPathTail $CARGO_HOME/bin
addToPathTail $HOME/tools/bin
#
# Other aliases
alias ls='eza -h'
alias ll='eza -lh'
alias la='eza -lha'
alias kc='kubectl'
alias cr="cd $HOME/src"
alias cg="cd $HOME/go/src/github.com/twitsprout"
alias f="fd --type f --hidden --follow --max-results 1000 --exclude .git --exclude .cache --exclude node_modules --exclude vendor | fzf-tmux -p --reverse | xargs nvim"
alias temp="curl https://wttr.in/pickering\?format\=3"

# lowercase the uuidgen output in MacOS
alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'

# Load local customizations
if [[ -f "$HOME/.localzshrc" ]]; then
    source $HOME/.localzshrc
fi

if [[ -f "$HOME/.local/bin/env" ]]; then
    source "$HOME/.local/bin/env"
fi
