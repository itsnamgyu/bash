source ~/.its-local-bash.sh

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias md="mkdir"
alias cdd="cd .."
alias g="git"
alias gl="git log"
alias gc="git commit -m"
alias c="clear"

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
