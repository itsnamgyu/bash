alias rv="vi ~/.vimrc"
alias rb="vi $BASE_BASH; source $BASE_BASH"
alias rbl="vi ~/.bash/local.sh; source $BASE_BASH"
alias rba="vi ~/.bash/alias.sh; source $BASE_BASH"

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias md="mkdir"
alias cdd="cd .."
alias cddd="cd ../.."

alias cl="clear; printf '\e[3J"

alias py="python"
alias py2="python2"
alias py3="python3"

alias g="git"
alias add="git add"
alias push="git push"
alias pull="git pull"
alias commit="git commit"
alias status="git status"
alias branch="git branch"
alias merge="git merge"
alias checkout="git checkout"

alias gs="git status"
alias gl="git log"
alias ga="git add"
alias gd="git diff"

alias sv="source venv/bin/activate"

alias ts="tmux ls"
alias tn="tmux new-session -s"
alias ta="tmux attach -t"

alias sts="sudo tmux ls"
alias stn="sudo tmux new-session -s"
alias sta="sudo tmux attach -t"

function sv-init {
	python3 -m venv venv
	sv
	pip install --upgrade pip
	vi requirements.txt
	pip install -r requirements.txt
}

function git-clone-https {
	if [ $# == 1 ]; then
		git clone https://github.com/itsnamgyu/$1.git
	fi

	if [ $# == 2 ]; then
		git clone https://github.com/$1/$2.git
	fi
}

function git-clone {
	if [ $# == 1 ]; then
		git clone git@github.com:itsnamgyu/$1.git
	fi

	if [ $# == 2 ]; then
		git clone git@github.com:$1/$2.git
	fi
}

function cd {
	command cd $@
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
