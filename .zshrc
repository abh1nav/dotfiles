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

# List occupied ports by pid
fn ports() {
	netstat -tulpn
}

# IPTables
fn ipt-show() {
	sudo iptables -vnL $1 --line-numbers
}

fn ipt-del() {
	echo iptables -D INPUT 13
}

# Some docker helpers
alias dockerps='docker ps -a'

fn dockerrmi() {
	IMAGES=$(docker images -f dangling=true -qa)
	if [ "$IMAGES" = "" ]; then
		echo Nothing to delete
	else
		echo $IMAGES
		docker rmi $IMAGES
	fi
}

fn dockerip() {
	docker inspect -f '{{ .NetworkSettings.IPAddress }}' $1
}

fn dockermysql() {
    docker run --name mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=hodor -d mysql:5.5
}
