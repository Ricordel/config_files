# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# Pour le buildroot armadeus
export BUILDROOT_VERSION=2010.11

# Vi mode
set -o vi


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

#Ajouter la suite arp-none-eabi au PATH
export PATH=$PATH:/opt/arm_none_eabi/bin:~/Rose/git/IRL/armadeus-3.4/buildroot/output/build/staging_dir/usr/bin:/opt/Xilinx/13.1/ISE_DS/ISE/bin/lin64:~/bin

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    #debian_chroot=$(cat /etc/debian_chroot)
#fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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

#if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;37m\](\[\033[01;34m\]\u\[\033[33m\]@\[\033[01;36m\]\h\[\033[00m\]\[\033[01;37m\]) \[\033[01;37m\]\W\[\033[33m\] \$\[\033[00m\] '
#else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac


#########################################################
#                       Des alias                       #
#########################################################

# enable color support of ls and also add handy aliases

function recursive_grep {
	grep --color=auto -r $* .
}
function recursive_grep_case_ins {
	grep --color=auto -ri $* .
}
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rg='recursive_grep $*'
alias rgi='recursive_grep_case_ins $*'


alias cdc='cd ~/Telecom/plnc/projet/src'


# Gestion du 'ls' : couleur & ne touche pas aux accents
alias ls='ls --classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable'

# Demande confirmation avant d'ecraser un fichier
alias cp='cp --interactive'
alias mv='mv --interactive'
#alias rm='rm --interactive'

# Raccourcis pour 'ls'
alias l='ls'
alias ll='ls -lh'
alias lll='ls -lh | less'
alias la='ls -A'
alias lla='ls -lA'

# Un cd && ls qui va bien
function cd_ls {
	cd "$*"; ls --classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable;
}


# Quelques alias pratiques
alias c='cd_ls $*'
alias cl='clear'
alias less='less --quiet'
alias s='cd ..'
alias u='cd .. && ls'
alias p='cd -'
alias df='df --human-readable'
alias du='du --human-readable'
alias duu='du --max-depth=1'
alias md='mkdir'
alias rd='rmdir'
alias maman='sudo'
alias make='clear && make -j5'
alias m='make'
# Make with clang as C compiler (for better error messages)
alias makec='make CC=clang LD=clang'
# Make with debug infos
alias maked='make CPPFLAGS+=-DDEBUG'

alias g='git'
alias qgit='qgit --all'
alias cg='cd ~/Rose/git'


# A bit better than ps aux | grep pattern
# -l : list process name too
# -f : search the whole line
alias pgrep='pgrep -l -f'


# A vim + find usefull when dealing with profound trees
function vim_find {
	vim "`find ./* -name *$1*`"
}
alias vimf='vim_find $*'

# Un alias pour vim avec fichier de tags ROSE
alias rvim='vim "+set tags=/home/leyaude/Rose/git/IRL/work/tags"'

# Alias pour vim pour projet de Scala
alias wvim='vim "+set tags=/home/leyaude/Programmation/scala/ScalaPod/wtf/src/tags"'

# Emacs est mieux en plein écran
alias emacs='emacs --fullscreen'


# GCC in english and with colors
alias gcc='LC_ALL=C grc -e gcc'

# Some other grc improvements
alias configure='grc configure'
alias cvs='grc cvs'
alias diff='grc diff'
alias log='grc log'
alias netstat='grc netstat'
alias ping='grc ping'
alias traceroute='grc traceroute'

# Tell tmux to use ~/.config/tmux/.tmux.conf as a config file
# -2 is to use 256 colors
alias tmux='tmux -2 -f ~/.config/tmux/tmux.conf'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    #. /etc/bash_completion
#fi

export JAVA_HOME=/usr/lib/jvm/java-7-openjdk/
