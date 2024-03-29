# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="vibrantink"
DISABLE_AUTO_TITLE="false"
COMPLETION_WAITING_DOTS="true"

# Colours!
export TERM=xterm-256color

# Example format: plugins=(rails git textmate ruby lighthouse)
DISABLE_AUTO_UPDATE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh
# The git plugin had this bad idea
unalias gm

# Git
alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
export GPG_TTY=$(tty)

# Vim
alias vi='nvim'
alias vim='nvim'

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
export GOPRIVATE="github.com/twitsprout"

# Rust
export RUSTUP_HOME="$HOME/.config/rustup"
export CARGO_HOME="$HOME/.config/cargo"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# PATH mods
export PATH="$PATH:$GOPATH/bin:$HOME/tools/bin:$HOME/.config/cargo/bin"

# Aliases
alias ls='exa -h'
alias ll='exa -lh'
alias la='exa -lha'
alias kc='kubectl'
alias cr="cd $HOME/src"
alias cg="cd $HOME/go/src/github.com/twitsprout"
alias f="fd --type f --hidden --follow --max-results 1000 --exclude .git --exclude .cache --exclude node_modules --exclude vendor | fzf-tmux -p --reverse | xargs nvim"
alias temp="curl https://wttr.in/pickering\?format\=3"

# lowercase the uuidgen output in MacOS
alias uuidgen='uuidgen | tr "[:upper:]" "[:lower:]"'

## Functions ##
# Kubernetes get secret
function get_secret {
    kubectl get secret $@ -o json | jq '.data | map_values(@base64d)'
}
alias get_secret="get_secret"

# Load local customizations
source $HOME/.localzshrc

