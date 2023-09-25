alias rv="vi ~/.vimrc"
alias rb="vi ~/.bash_profile; source ~/.bash_profile"
alias rba="vi ~/.bash_aliases; source ~/.bash_profile"
alias rbl="vi ~/.bash_local.sh; source ~/.bash_profile"

alias ssh-config="mkdir -p ~/.ssh; vi ~/.ssh/config"
alias ssh-key="cat ~/.ssh/id_rsa.pub"
alias ssh-auth="mkdir -p ~/.ssh; vi ~/.ssh/authorized_keys"


if [[ "$OSTYPE" != "darwin"* ]]; then
	alias ls='ls --color=auto'
fi
alias l='ls -CF'
alias ll='ls -alF'
alias la='ls -A'

alias grep="/usr/bin/grep --color=auto -n"

alias md="mkdir"
alias cdd="cd .."
alias cddd="cd ../.."

alias rsync="rsync -rvlP"

alias juppy="jupyter nbconvert --to script"

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

alias django="source venv/bin/activate; python manage.py"
alias startproject="source venv/bin/activate; django-admin startproject"
alias startapp="source venv/bin/activate; django-admin startapp"
alias runserver="source venv/bin/activate; python manage.py runserver"
alias createsuperuser="source venv/bin/activate; python manage.py createsuperuser"
alias makemigrations="source venv/bin/activate; python manage.py makemigrations"
alias showmigrations="source venv/bin/activate; python manage.py showmigrations"
alias collectstatic="source venv/bin/activate; python manage.py collectstatic"
alias migrate="source venv/bin/activate; python manage.py migrate"

alias warp="touch -mt 197001010000"

function add {
	git add "$@"
	git status
}

alias ts="tmux ls"
alias tn="tmux new-session -s"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"
alias tr="tmux rename-session"

alias cn="conda create -n"
alias ca="conda activate"
alias cr="conda env remove -n"
alias cda="conda deactivate"

alias ns="nvidia-smi"
alias gs="gpustat"
alias wgs="watch -n 0.25 gpustat"
alias wns="watch -n 0.25 nvidia-smi"

alias jj="python -m json.tool"

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

function sv {
	command -v "deactivate" >/dev/null 2>&1;
	if [[ $? == '0' ]]; then
		deactivate
		echo 'Deactivating previous virtual environment'
	fi

	if [[ -f venv/bin/activate ]]; then
		source venv/bin/activate
		echo 'Activating new virtual environment'
	else
		echo 'Could not find virtual environment'
	fi
}

function sv-init {
	python3 -m venv venv $@
	sv
	pip3 install --upgrade pip
	vi requirements.txt
	pip3 install -r requirements.txt
}

function sv-update {
	python3 -m venv venv $@
	sv
	pip3 install --upgrade pip
	vi requirements.txt
	pip3 install -r requirements.txt
}

function clone {
	if [ $# == 1 ]; then
		git clone git@github.com:itsnamgyu/$1.git
		if [ $? -ne 0 ]; then
			git clone https://github.com/itsnamgyu/$1.git
		fi
		cd $1
	fi
}

function cd {
	builtin cd "$*"
	ls
}

function mdd {
	mkdir $1
	cd $1
}

if [[ "$OSTYPE" == "darwin"* ]]; then
	function copy {
		cat $@ | pbcopy
	}
fi
