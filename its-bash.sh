. ~/.its-local-bash.sh

# Copied from AWS bashrc!

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias md="mkdir"
alias cdd="cd .."
alias cddd="cd ../.."

alias py="python"
alias py2="python2"
alias py3="python3"

alias g="git"
alias add="git add"
alias push="git push"
alias pull="git pull"
alias commit="git commit -m"
alias status="git status"

alias sv="source venv/bin/activate"

export CLICOLOR=1

function mdd {
	mkdir $1
	cd $1
}

function rb {
	vi ~/.its-bash.sh
	source ~/.its-bash.sh
}

function rbl {
	vi ~/.its-local-bash.sh
	source ~/.its-bash.sh
}

function rv {
	vi ~/.vimrc
}

function c {
	printf '\e[3J'
	clear
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
			g++ -o .run_temp_output $1
			./.run_temp_output
			rm .run_temp_output
		else
			./$1
		fi

		return 0
	fi
}
