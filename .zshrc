# Export the correct locale
export LC_ALL=en_US.utf8

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export XDG_CONFIG_HOME=~/.config/

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
plugins=(git colored-man-pages cp colorize z debian sudo vagrant systemd docker redis-cli zsh-syntax-highlighting)

fpath=(~/.zsh/completions $fpath)

# zmv, the built-in mass file renamer
autoload zmv

# Restore history search, apparently absent with vi-mode
#bindkey '^R' history-incremental-search-backward

source $ZSH/oh-my-zsh.sh



# Customize to your needs...


export EDITOR=nvim

# For mono, by default I need the debian mono, so put /usr/bin in front of /usr/local/bin
export PATH=~/.local/bin/:~/bin:/usr/bin:/opt/qarnot/bin:/opt/qarnot/simulator/bin:/opt/heap-shot/lib/heap-shot:/opt/influxdb:/opt/telegraf:$PATH:
export LD_LIBRARY_PATH=/opt/qarnot/bin:$LD_LIBRARY_PATH
# go root and stuff
export GOPATH=/home/yoann/work/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

# java home
export JAVA_HOME=/usr

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

__DUMMY='$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I") $PWD)\h$ '



function recursive_grep {
    grep -r --color -nIE "$*" .
    #find . -type f | xargs grep -n -I -E "$*"
}
function recursive_grep_case_ins {
    grep -r --color -niIE "$*" .
    #find . -type f | xargs grep -n -I -i -E "$*"
}
function recursive_grep_sourcefiles {
    find . -type f -name "*.cs" -or -name "*.c" -or -name "*.h" -or -name "*.cpp" -or -name "*.cc" -or -name "*allow.hpp" -or -name "*.hh" -or -name "*.py" -or -name "*.php" -or -name "*.qsh" -or -name "*.java" -or -name "*.phtml" -or -name "*.css" -or -name "*.html" -or -name "*.go" -or -name "*.js" | xargs grep --color -n -E "$*"
}
function recursive_grep_sourcefiles_casei {
    find . -type f -name "*.cs" -or -name "*.c" -or -name "*.h" -or -name "*.cpp" -or -name "*.cc" -or -name "*.hpp" -or -name "*.hh" -or -name "*.py" -or -name "*.php" -or -name "*.qsh" -or -name "*.java" -or -name "*.phtml" -or -name "*.css" -or -name "*.html" -or -name "*.go" -or -name "*.js" | xargs grep --color -n -E -i "$*"
}

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias rg='recursive_grep $*'
alias rgi='recursive_grep_case_ins $*'

alias dsf=diff-so-fancy

alias rgs='recursive_grep_sourcefiles $*'
alias rgsi='recursive_grep_sourcefiles_casei $*'
alias /='nvim $(rgs . | selecta | cut -d":" -f 1)'

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

alias mono-custom='/opt/mono-3.2.8-debug/bin/mono'

alias jpp='jq -S .'

alias jcurl='jcurl $*'
function jcurl {
    curl -s "$@" | jq -S .
}

alias ipt='sudo iptables -L -n -v'

# Un cd && ls qui va bien
function cd_ls {
	cd "$*"; ls --tabsize=0 --literal --color=auto --show-control-chars --human-readable;
}

function mkdir_cd {
    mkdir "$*"; cd $*;
}

function fuzzy_find {
    find . -name "*$1*";
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
alias mdc='mkdir_cd $*'
alias rd='rmdir'
alias maman='sudo'
alias m='make'
alias mj='make -j5'
alias r='make run'
alias mb='make -j5 -B'
# Make with clang as C compiler (for better error messages)
alias makec='make CC=clang LD=clang CXX=clang++'
# Make with debug infos
alias maked='make CPPFLAGS+=-DDEBUG'

alias cclang='clang -Wall -Wextra -O0 -g'
alias ggcc='gcc -Wall -Wextra -Og -g'

alias xb='xbuild'
alias xc='xbuild /target:Clean'
alias xbb='xbuild /target:Clean && xbuild'

alias v='nvim'
alias vi='nvim'

alias fsel='find . | selecta'

alias ff='fuzzy_find $*'

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

alias sc='systemctl'

alias timestamp='date +%s'

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

alias devboxssh='ssh -p 49022 root@82.239.66.128'
alias devboxforward='ssh -L 8090:127.0.0.1:8081 -p 49022 root@82.239.66.128'

alias qssh='ssh -p 50022'
alias qscp='scp -P 50022'

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
alias iotop='sudo iotop'

alias ip='ip -c'

alias sa='ssh-add -t 7200'


# Some shorthands for the conversion utility I wrote (in ~/bin)
alias 10to16='~/bin/convert_base 10 16'
alias 16to10='~/bin/convert_base 16 10'
alias 2to10='~/bin/convert_base 2 10'
alias 10to2='~/bin/convert_base 10 2'

alias _='sudo'

#alias docker='sudo /usr/bin/docker'
#alias docker='docker-1.9'
alias dr='docker run --rm -it'


# some zsh-specific awesomness

# Global aliasing
alias -g gr='| nobuf grep -E -u'
alias -g grc='| nobuf grep -E -u --color'
alias -g gri='| nobuf grep -E -i -u'
alias -g grci='| nobuf grep -E -u -i --color'
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
alias -g sel='$(find | selecta)'
alias -g pwc='| wc -l'
alias -g logmsg='| cut -d"|" -f6'

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


# Alias for usual machines
alias qrocosrv01='ssh -p 50022 root@qrocosrv01.qarnot.net -t "cd /opt/qarnot/www/qrocosrv/www/public; zsh --login"'
alias qrocosrv='qrocosrv01'
alias qrocomon01='ssh -p 50022 root@qrocomon01.qarnot.net -t zsh --login'
alias qrocomon02='ssh -p 50022 root@qrocomon02.qarnot.net -t zsh --login'
alias submit='ssh root@submit.qarnot.net'
alias submit01='ssh -p 50022 root@submit01.qarnot.net -t zsh --login'
alias submit02='ssh -p 50022 root@submit02.qarnot.net'
alias docker01='ssh -p 50022 root@docker01.qarnot.net'
alias qoala01='ssh -p 50022 root@qoala-blender01.qarnot.net -t zsh --login'
alias qoala02='ssh -p 50022 root@qoala-blender02.qarnot.net -t zsh --login'
alias python01='ssh -p 50022 root@qoala-python01.qarnot.net'
alias python02='ssh -p 50022 root@qoala-python02.qarnot.net'
alias qobra01='ssh -p 50022 root@qobra01.qarnot.net'
alias qobra02='ssh -p 50022 root@qobra02.qarnot.net'
alias rssh01='ssh -p 50022 root@rssh01.qarnot.net'
alias build01='ssh -p 50022 root@build01.qarnot.net -t "cd /opt/qarnot/src/; zsh --login"'
alias qmonitor-dev='ssh root@192.168.5.7'
alias admin02='ssh -p 50022 root@admin02.qarnot.net'
alias forward01='ssh -p 50022 root@forward01.qarnot.net'
alias qtout='ssh root@192.168.6.246'
alias qtout2='ssh root@192.168.6.160'
alias rest01='ssh -p 50022 root@rest01.qarnot.net -t /usr/bin/zsh --login'
alias rest02='ssh -p 50022 root@rest02.qarnot.net -t /usr/bin/zsh --login'
alias api.prod='ssh -p 50022 root@api.qarnot.com -t /usr/bin/zsh --login'
alias qrocodir='ssh -p 50022 root@qrocodir01.qarnot.net -t /usr/bin/zsh --login'
alias bnp='ssh -p 50022 root@bnp.qarnot.net'
alias qbig1='ssh -p 50022 root@62.210.95.37 -t /usr/bin/zsh --login'
alias qbig2='ssh -p 50022 root@62.210.246.52 -t /usr/bin/zsh --login'
alias qbig3='ssh root@195.154.154.175'
alias qbig4='ssh root@195.154.154.176'
alias qbig5='ssh root@195.154.154.177'
alias qbig6='ssh root@195.154.154.178'
alias qbig7='ssh root@195.154.154.179'
alias osho01='ssh -p 50022 root@osho01.qarnot.net -t /usr/bin/zsh --login'
alias jira01='ssh -p 50022 root@jira01.qarnot.net'
alias boinc01='ssh -p 50022 root@boinc-snapshot01.qarnot.net'
alias buildbot01='ssh -p 50022 root@buildbot.qarnot.loc'
alias buildbot-slave='ssh root@192.168.6.238'
alias sso-back01='ssh -p 50022 root@sso-back01.qarnot.net -t /usr/bin/zsh --login'
alias sso-back02='ssh -p 50022 root@212.83.155.36 -t /usr/bin/zsh --login'
alias sso-front01='ssh -p 50022 root@sso-front01.qarnot.net'
alias sso-ldap01='ssh -p 50022 root@sso-ext01.qarnot.net'
alias influx-smarthome='ssh -p 50022 root@influx-sensors.qarnot.net'
alias influx-hpc='ssh -p 50022 root@influx-hpc.qarnot.net'

# Alias with tmux in supplement
alias tqrocosrv01='ssh -p 50022 root@qrocosrv01.qarnot.net -t "tmux a || tmux"'
alias tqrocosrv='tqrocosrv01'
alias tqs='tqrocosrv01'
alias tqrocomon01='ssh -p 50022 root@qrocomon01.qarnot.net -t "tmux a || tmux"'
alias tqrocomon02='ssh -p 50022 root@qrocomon02.qarnot.net -t "tmux a || tmux"'
alias tsubmit='ssh yricordel@submit.qarnot.net'
alias tsubmit01='ssh -p 50022 root@submit01.qarnot.net -t "tmux a || tmux"'
alias tsubmit02='ssh -p 50022 root@submit02.qarnot.net -t "tmux a || tmux"'
alias tdocker01='ssh -p 50022 root@docker01.qarnot.net -t "tmux a || tmux"'
alias tqoala01='ssh -p 50022 root@qoala-blender01.qarnot.net -t "tmux a || tmux"'
alias tqoala02='ssh -p 50022 root@qoala-blender02.qarnot.net -t "tmux a || tmux"'
alias tpython01='ssh -p 50022 root@qoala-python01.qarnot.net -t "tmux a || tmux"'
alias tpython02='ssh -p 50022 root@qoala-python02.qarnot.net -t "tmux a || tmux"'
alias tqobra01='ssh -p 50022 root@qobra01.qarnot.net -t "tmux a || tmux"'
alias tqobra02='ssh -p 50022 root@qobra02.qarnot.net -t "tmux a || tmux"'
alias trssh01='ssh -p 50022 root@rssh01.qarnot.net -t "tmux a || tmux"'
alias tbuild01='ssh -p 50022 root@build01.qarnot.net -t "tmux a || tmux"'
alias tb='tbuild01'
alias tqmonitor-dev='ssh root@192.168.5.7 -t "tmux a || tmux"'
alias tadmin02='ssh -p 50022 root@admin02.qarnot.net -t "tmux a || tmux"'
alias tforward01='ssh -p 50022 root@forward01.qarnot.net -t "tmux a || tmux"'
alias tqtout='ssh root@192.168.6.246 -t "tmux a || tmux"'
alias trest01='ssh -p 50022 root@rest01.qarnot.net -t "tmux a || tmux"'
alias trest01='ssh -p 50022 root@rest01.qarnot.net -t "tmux a || tmux"'
