# Bash profile template by Namgyu Ho <itsnamgyu@gmail.com>
# https://github.com/itsnamgyu/bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth  # no duplicates in history
HISTSIZE=100000
HISTFILESIZE=200000

shopt -s histappend 2> /dev/null  # append history file
shopt -s checkwinsize 2> /dev/null  # adjust to window size on every command
shopt -s globstar 2> /dev/null  # allow /**/

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"  # improve command <less>

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Git Prompt
export GIT_PS1_SHOWCOLORHINTS="TRUE"
[ -f ~/.bash/git-prompt.bash ] && source ~/.bash/git-prompt.bash

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
	PS1='\[\033[01;33m\]$(__git_ps1 "(%s) ")\[\033[01;32m\]\u\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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

# English
export LANG=en_US.UTF-8

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

# Homebrew
export HOMEBREW_NO_AUTO_UPDATE=1

# Add commands to path
[ -d ~/.commands ] || mkdir -p ~/.commands
case ":$PATH:" in
	*":$HOME/.commands:"*) ;;
	*) export PATH="$PATH:$HOME/.commands" ;;
esac
case ":$PATH:" in
	*":$HOME/.local/bin:"*) ;;
	*) export PATH="$HOME/.local/bin:$PATH" ;;
esac

# Reset modifyOtherKeys after each command, in case a program left it on
# (under tmux extended-keys this otherwise turns Option+Arrow and even Ctrl+U into garbage)
PROMPT_COMMAND='printf "\e[>4m"'"${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
# Option+Arrow word movement for xterm-style sequences (macOS bash 3.2 lacks these bindings)
bind '"\e[1;3D": backward-word' 2>/dev/null
bind '"\e[1;3C": forward-word' 2>/dev/null

source ~/.bash_aliases
source ~/.bash_local.sh
