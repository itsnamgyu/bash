# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

source ~/.bash_aliases
source ~/.bash_local.sh

HISTCONTROL=ignoreboth  # no duplicates in history
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend 2> /dev/null  # append history file
shopt -s checkwinsize 2> /dev/null  # adjust to window size on every command
shopt -s globstar 2> /dev/null  # allow /**/

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"  # improve command <less>

# ?
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Fancy prompt
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;00m\]\$ '
else
	PS1='\u:\w\$ '
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

# GCC Colors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features?
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
export CLICOLOR=1

# Tmux Colors
if [[ $TMUX != "" ]]; then
	export TERM="xterm-256color"
fi
	
# Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1

#  Grep
export GREP_OPTIONS='--color=auto -n'
