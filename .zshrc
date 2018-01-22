# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="vibrantink"
DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"

# Colours!
export TERM=xterm-256color

# Example format: plugins=(rails git textmate ruby lighthouse)
DISABLE_AUTO_UPDATE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh
# The git plugin had this bad idea
unalias gm

# Pretty git log
alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# TMUX
alias tma='tmux attach -d -t'
alias tmg='tmux new -s $(basename $(pwd))'
alias tm='tmux new -s '

# List large files in the current directory
fn large-files() {
    du -h . | grep '[0-9]\{3\}M'
}

# Golang
export GOPATH="$HOME/go"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Virtualenv
export WORKON_HOME="$HOME/.venvs"

# PATH mods
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$HOME/.yarn/bin"

# Aliases
alias ll='ls -la'
alias kc='kubectl'

# Load local customizations
source $HOME/.localzshrc

