# Export the correct locale
export LC_ALL=en_US.utf8

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="yaude"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# XXX from https://github.com/zsh-users/zsh-syntax-highlighting, it seems
# that the syntax-highlight plugin must be set last
#plugins=(git colored-man colorize cp scala sbt vi-mode zsh-syntax-highlighting)
plugins=(git colored-man cp colorize z debian sudo vagrant zsh-syntax-highlighting)

fpath=(~/.zsh/completions $fpath)

# zmv, the built-in mass file renamer
autoload zmv

# Restore history search, apparently absent with vi-mode
#bindkey '^R' history-incremental-search-backward

source $ZSH/oh-my-zsh.sh



# Customize to your needs...


export EDITOR=vim

# For mono, by default I need the debian mono, so put /usr/bin in front of /usr/local/bin
export PATH=~/bin:/usr/bin:/opt/qarnot/bin:/opt/qarnot/simulator/bin:$PATH:
export LD_LIBRARY_PATH=/opt/qarnot/bin:$LD_LIBRARY_PATH
# go root and stuff
export GOROOT=/home/leyaude/bin/go
export GOBIN=$GOROOT/bin
export PATH=$PATH:$GOBIN

# java home
export JAVA_HOME=/usr

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

__DUMMY='$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I") $PWD)\h$ '



function recursive_grep {
    find . -type f | xargs grep -n -I -E "$*"
}
function recursive_grep_case_ins {
    find . -type f | xargs grep -n -I -i -E "$*"
}
function recursive_grep_sourcefiles {
    find . -name "*.cs" -or -name "*.c" -or -name "*.h" -or -name "*.cpp" -or -name "*.cc" -or -name "*.hpp" -or -name "*.hh" -or -name "*.py" -or -name "*.php" -or -name "*.qsh" -or -name "*.java" -or -name "*.phtml" -or -name "*.css" -or -name "*.html" | xargs grep -n -E "$*"
}
function recursive_grep_sourcefiles_casei {
    find . -name "*.cs" -or -name "*.c" -or -name "*.h" -or -name "*.cpp" -or -name "*.cc" -or -name "*.hpp" -or -name "*.hh" -or -name "*.py" -or -name "*.php" -or -name "*.qsh" -or -name "*.java" -or -name "*.phtml" -or -name "*.css" -or -name "*.html" | xargs grep -n -E -i "$*"
}

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rg='recursive_grep $*'
alias rgi='recursive_grep_case_ins $*'

alias rgs='recursive_grep_sourcefiles $*'
alias rgsi='recursive_grep_sourcefiles_casei $*'
alias /='vim $(rgs . | selecta | cut -d":" -f 1)'

# Gestion du 'ls' : couleur & ne touche pas aux accents
alias ls='ls --tabsize=0 --literal --color=auto --show-control-chars --human-readable'

# Demande confirmation avant d'ecraser un fichier
alias cp='ionice -c3 cp --interactive'
alias mv='ionice -c3 mv --interactive'

# Raccourcis pour 'ls'
alias l='ls'
alias ll='ls -lh'
alias lll='ls -lh | less'
alias la='ls -A'
alias lla='ls -lA'


# Un cd && ls qui va bien
function cd_ls {
	cd "$*"; ls --tabsize=0 --literal --color=auto --show-control-chars --human-readable;
}


# Quelques alias pratiques
alias c='cd_ls $*'
alias cl='clear'
alias less='less --quiet'
alias tf='tail -f'
alias s='cd ..'
alias u='cd .. && ls'
alias p='cd -'
alias df='df --human-readable'
alias du='du --human-readable'
alias duu='du --max-depth=1'
alias md='mkdir'
alias rd='rmdir'
alias maman='sudo'
alias m='make'
alias r='make run'
alias mc='make clean'
alias mb='make -B'
# Make with clang as C compiler (for better error messages)
alias makec='make CC=clang LD=clang CXX=clang++'
# Make with debug infos
alias maked='make CPPFLAGS+=-DDEBUG'

alias xb='xbuild'
alias xc='xbuild /target:Clean'
alias xbb='xbuild /target:Clean && xbuild'

alias v='vim'

alias fsel='find . | selecta'

alias g='git'
alias glh='git log | head -n 40'
alias glo='git log --oneline'
alias gloh='git log --oneline | head -n 40'
alias gk='gitk --all&'
alias ts='tig status'

export QSH_HEAD="~/work/qarnot/apps/qshell/bin/Debug/QarnotShell.exe"
export QSIMU_HEAD="~/work/qarnot/qnetwork/bin/Debug/qsimu.exe"
alias qshell-head="mono --debug $QSH_HEAD"
alias qsimu-head="mono --debug $QSIMU_HEAD"

alias ts='tig status' # tig is SO awesome


# A bit better than ps aux | grep pattern
# -l : list process name too
# -f : search the whole line
alias pgrep='pgrep -l -f'

# A vim + find usefull when dealing with profound trees
function vim_find {
    vim "`find ./* -name \"*$1*\"`"
}
alias vimf='vim_find $*'
alias vims='vim $(find . | selecta)'

function _calc {
    echo $(($*))
}
alias calc='_calc $*'


# GCC in english and with colors
alias gcc='LC_ALL=C gcc'


# Tell tmux to use ~/.config/tmux/.tmux.conf as a config file
# -2 is to use 256 colors
alias tmux='tmux -2 -f ~/.config/tmux/tmux.conf'

alias ktssh='ssh ricordel@u-shell.csc.kth.se'
alias ktsshx='ssh -Y ricordel@u-shell.csc.kth.se'
alias ktsshfs='sshfs ricordel@u-shell.csc.kth.se: ~/kth_sshfs'
alias gothmogssh='ssh pcs_8@gothmog.it.kth.se'
alias gothmogsshx='ssh -X pcs_8@gothmog.it.kth.se'
alias smal1ssh='ssh pcs_8@smal1.sics.se'
alias smal1sshx='ssh -X pcs_8@smal1.sics.se'
alias avrilssh='ssh ricordel@avril.it.kth.se'
alias colombianassh='ssh ricordel@colombiana.it.kth.se'
alias atlantisssh='ssh ricordel@atlantis.it.kth.se'
alias subwayssh='ssh ricordel@subway.it.kth.se'
alias malavitassh='ssh ricordel@malavita.it.kth.se'
alias ferlinssh='ssh ricordel@ferlin.pdc.kth.se'

alias freyassh='ssh yoann@192.168.6.66'
alias baldurssh='ssh yoann@192.168.6.67'

alias subssh='ssh yricordel@submit.qarnot.net'

# Buffer only one line instead of a lot. Better to view logs in real time
# when they are on stdout
alias nobuf='stdbuf -oL -eL'
#alias qlog='nobuf remark /home/yoann/.config/remark/qarnot-log.syntax'
#alias qtrim='nobuf cut -d"|" -f4-' # To trim the first fields of log that take space and are not always interesting.


alias :q='exit' # vim forever
alias :e='vim'  # and ever


alias htop='htop -s PERCENT_CPU'
alias nloadw='nload -u K wlan0'

#alias hubic-mount='cloudfuse /home/leyaude/mount_point -o noauto_cache,sync_read'
alias hubic-sync='hubic login "leyaude@gmail.com" /home/leyaude/data/hubic-sync'

alias upgrade='sudo aptitude update; sudo aptitude upgrade'



# Some shorthands for the conversion utility I wrote (in ~/bin)
alias 10to16='~/bin/convert_base 10 16'
alias 16to10='~/bin/convert_base 16 10'
alias 2to10='~/bin/convert_base 2 10'
alias 10to2='~/bin/convert_base 10 2'

alias _='sudo'


# some zsh-specific awesomness

# Global aliasing
alias -g gr='| nobuf grep -E -u'
alias -g gri='| nobuf grep -E -i -u'
#alias -g qlog='| nobuf remark /home/yoann/.config/remark/qarnot-log.syntax'
alias -g plog='| /home/yoann/bin/qlog'
alias -g pqfsl='| /home/yoann/bin/qfslog'
alias -g qtrim='| nobuf cut -d"|" -f4- | nobuf grep -E -v "^$"' # To trim the first fields of log that take space and are not always interesting.
alias -g ple='| less'
alias -g pyc='|& pygmentize -l pytb'
alias -g pcat='| cat'
alias -g phd='| head -n 40'
alias -g pvim='| vim -'
alias -g psel='| selecta '

# Default applications to open some files
alias -s c=vim
alias -s h=vim
alias -s cc=vim
alias -s hh=vim
alias -s cpp=vim
alias -s hpp=vim
alias -s cs=vim
alias -s scala=vim
alias -s txt=vim
alias -s jpg=gpicview
alias -s png=gpicview
alias -s JPG=gpicview
alias -s PNG=gpicview
alias -s pdf=evince
alias -s epub=ebook-viewer
alias -s mp4=mplayer
alias -s mkv=mplayer
alias -s avi=mplayer
