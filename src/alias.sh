alias rv="vi ~/.vimrc"
alias rb="vi ~/.bash_profile; source ~/.bash_profile"
alias rba="vi ~/.bash_aliases; source ~/.bash_profile"
alias rbl="vi ~/.bash_local.sh; source ~/.bash_profile"

alias ssh-config="vi ~/.ssh/config"
alias ssh-key="cat ~/.ssh/id_rsa.pub"
alias ssh-auth="vi ~/.ssh/authorized_keys"

command -v exa &>/dev/null
if [[ $? == 0 ]]; then
	alias l='exa -t=mod --time-style=long-iso'
	alias ls='exa -t=mod --time-style=long-iso'
	alias la='exa -t=mod --time-style=long-iso -a'
	alias ll='exa -t=mod --time-style=long-iso -a --long --group --git'
	alias lt='exa -t=mod --time-style=long-iso --long --git --tree --level=2'
else
	if [[ "$OSTYPE" != "darwin"* ]]; then
		alias ls='ls --color=auto'
	fi
	alias l='ls -CF'
	alias ll='ls -alF'
	alias la='ls -A'
fi
alias grep="/usr/bin/grep --color=auto -n"

alias md="mkdir"
alias cdd="cd .."
alias cddd="cd ../.."

alias rsync="rsync -rvlP"

alias cl="clear; printf '\e[3J"

alias py="python"
alias py2="python2"
alias py3="python3"

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

alias warp="touch -mt 200101010000"

function add {
	git add "$@"
	git status
}

alias gs="git status"
alias gl="git log"
alias ga="git add"
alias gd="git diff"

alias ts="tmux ls"
alias tn="tmux new-session -s"
alias ta="tmux attach -t"
alias tk="tmux kill-session -t"
alias tr="tmux rename-window"

alias cn="conda create -n"
alias ca="conda activate"
alias cda="conda deactivate"

alias sts="sudo tmux ls"
alias stn="sudo tmux new-session -s"
alias sta="sudo tmux attach -t"
alias stk="sudo tmux kill-session -t"

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

	if [ $# == 2 ]; then
		git clone git@github.com:$1/$2.git
		if [ $? -ne 0 ]; then
			git clone https://github.com/$1/$2.git
		fi
		cd $2
	fi
}

function cd {
	command cd "$*"
	ls
}

function mdd {
	mkdir $1
	cd $1
}

function run {
	if [ $# == 0 ]; then
		if [ -f makefile ]; then
			make
			
			if [ $? != 0 ]; then
				echo "Make failed"
				return -1
			fi 

			if [ -f test ]; then
				./test
				make clean
				return 0
			fi
			
			if [ -f a.out ]; then
				./a.out
				make clean
				return 0
			fi
		fi

		if [ -f a.out ]; then
			./a.out
			return 0
		fi

		cCount=`ls -l *.c 2>&1 | wc -l` > /dev/null
		ls -l *.c > /dev/null
		if ! [ $? == 0 ]; then
			cCount=0
		fi

		cppCount=`ls -l *.cpp 2>&1 | wc -l` > /dev/null
		ls -l *.cpp > /dev/null
		if ! [ $? == 0 ]; then
			cppCount=0
			echo hoho
		fi

		if [ $cCount == 1 ] && [ $cppCount == 0 ]; then
			run *.c
			return $?
		fi 
		
		if [ $cCount == 0 ] && [ $cppCount == 1 ]; then
			run *.cpp
			return $?
		fi

		echo "No makefile or more than one .c or .cpp file. Please specify"

		return -1
	else
		if [[ $1 == *.c ]]; then
			gcc -O2 -Wall -Wpedantic -Wextra -o .run_temp_output $1
			./.run_temp_output
			rm .run_temp_output
		elif [[ $1 == *.cpp ]]; then
			g++ --std=c++11 -o .run_temp_output $1
			./.run_temp_output
			rm .run_temp_output
		else
			./$1
		fi

		return 0
	fi
}

function test {
	if [[ $1 == *.c ]]; then
		gcc -D TEST -O2 -Wall -Wextra -o .run_temp_output $1
		./.run_temp_output
		rm .run_temp_output
	fi
}

if [[ "$OSTYPE" == "darwin"* ]]; then
	function copy {
		cat $@ | pbcopy
	}
fi
