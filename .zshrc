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

# Pretty git log
alias lg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"

# Load local customizations
alias ll='ls -lh'
source $HOME/.localzshrc

# TMUX
alias tma='tmux attach -d -t'
alias tmg='tmux new -s $(basename $(pwd))'
alias tm='tmux new -s '

# List large files in the current directory
fn large-files() {
    du -h . | grep '[0-9]\{3\}M'
}

# IPTables
fn ipt-show() {
	sudo iptables -vnL $1 --line-numbers
}

fn ipt-del() {
	echo iptables -D INPUT 13
}

