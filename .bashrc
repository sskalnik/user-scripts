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
HISTSIZE=1000000
HISTFILESIZE=2000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

force_color_prompt=yes

# [sskalnik@ip-172-31-39-86:/tmp]$
export PS1="\[\e[32m\][\[\e[m\]\[\e[36m\]\u\[\e[m\]\[\e[33m\]@\[\e[m\]\[\e[35m\]\h\[\e[m\]:\[\e[1;34m\]\w\[\e[m\]\[\e[32m\]]\[\e[m\]\[\e[32m\]\\$\[\e[m\] "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

# vim with colors
export TERM="xterm-256color"
export VISUAL="vim"
export EDITOR="vim"

# retain history across terminal sessions
shopt -s histverify
shopt -s histreedit
export HISTCONTROL=ignoredups:erasedups
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

export PYTHONSTARTUP="~/.pythonrc"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# Also add user-scoped NPM and binaries for AWS and Bitbucket, etc.
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.npm-global/bin:$PATH:$HOME/.rvm/bin"

# https://bugs.launchpad.net/ubuntu/+source/libsecret/+bug/1420914
if test -z "$DBUS_SESSION_BUS_ADDRESS" ; then
  eval `dbus-launch --sh-syntax`
fi

[[ -f ~/.tmux_ssh ]] && . ~/.tmux_ssh

# https://stackoverflow.com/questions/52540121/make-pipenv-create-the-virtualenv-in-the-same-folder
export PIPENV_VENV_IN_PROJECT="enabled"
