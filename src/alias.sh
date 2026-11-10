alias rv="vi ~/.vimrc"
alias rb="vi ~/.bash_profile; source ~/.bash_profile"
alias rba="vi ~/.bash_aliases; source ~/.bash_profile"
alias rbl="vi ~/.bash_local.sh; source ~/.bash_profile"

alias ssh-config="mkdir -p ~/.ssh; vi ~/.ssh/config"
function ssh-key {
	if [ -f ~/.ssh/id_ed25519.pub ]; then
		cat ~/.ssh/id_ed25519.pub
	elif [ -f ~/.ssh/id_rsa.pub ]; then
		cat ~/.ssh/id_rsa.pub
	else
		echo "No SSH public key found. Running ssh-keygen..."
		ssh-keygen
	fi
}
alias ssh-auth="mkdir -p ~/.ssh; vi ~/.ssh/authorized_keys"


if [[ "$OSTYPE" != "darwin"* ]]; then
	alias ls='ls --color=auto'
fi
alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'

alias grep="grep --color=auto"

alias md="mkdir"
alias cdd="cd .."
alias cddd="cd ../.."

alias rsync="rsync -rvlP"

alias g="git"
alias push="git push"
alias pull="git pull"
alias commit="git commit"
alias status="git status"
alias branch="git branch"
alias merge="git merge"
alias checkout="git checkout"
alias develop="git checkout develop && git pull --ff-only"
alias master="git checkout master && git pull --ff-only"

alias amend="git commit --amend"
alias oneline="git log --pretty=format:'%C(yellow)%h %Cred%ad %Cblue%an%Cgreen%d %Creset%s' --date=short"
alias hardreset="git reset --hard"

function git-patch-global {
	git config --global user.email "itsnamgyu@gmail.com"
	git config --global user.name "Namgyu Ho"
	git config --global core.editor vim
}

function git-patch {
	git config user.email "itsnamgyu@gmail.com"
	git config user.name "Namgyu Ho"
	git config core.editor vim
}

function add {
	git add "$@"
	git status
}

alias ts="tmux ls"
alias tn="tmux new-session -s"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"
alias trs="tmux rename-session"

alias claude="IS_SANDBOX=True claude --dangerously-skip-permissions"
alias cld="claude"
alias cn="claude"
alias cr="claude --resume"
alias cf="claude --resume --fork-session"


alias ns="nvidia-smi"
alias gs="gpustat"
alias wgs="watch -n 1 gpustat"
alias wns="watch -n 1 nvidia-smi"

function rass {
	sudo vi /etc/apache2/sites-enabled/000-default-le-ssl.conf
	sudo apachectl graceful
}

function ras {
	sudo vi /etc/apache2/sites-enabled/000-default.conf
	sudo apachectl graceful
}

function ra {
	sudo vi /etc/apache2/apache2.conf
	sudo apachectl graceful
}

function clone {
	if [ $# -eq 1 ] && [[ "$1" != *[:/]* ]]; then
		git clone git@github.com:itsnamgyu/$1.git || git clone https://github.com/itsnamgyu/$1.git
		cd "$1"
	else
		git clone "$@"
	fi
}

function cd {
	builtin cd "$@" && ls
}

function mdd {
	mkdir $1
	cd $1
}

if [[ "$OSTYPE" == "darwin"* ]]; then
	function copy {
		cat "$@" | pbcopy
	}
fi

