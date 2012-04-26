#!/bin/bash

# XXX Doing a remove - clone cycle for each update is a bit rough
# XXX and not really the git-way !

refresh() {
  local url="$1"
  local dir="$2"

  rm -rf $dir
  echo "removed $dir"
  git clone --depth=1 $url $dir 
  rm -rf $dir/.git

  if [ -f "$dir/.gitignore" ]; then
    rm "$dir/.gitignore"
  fi
}

# Nerd commenter and nerdTree
refresh https://github.com/scrooloose/nerdcommenter.git nerdcommenter
refresh https://github.com/scrooloose/nerdtree.git nerdtree

# Match non single-chars, for instance tags in html
refresh https://github.com/vim-scripts/matchit.zip.git matchit

# clang-complete, can't do without it for C programs
# XXX Don't refresh it as is as I tried to hack on it ! (directly here, yep, I know...)
# XXX if I modify it, push it to my github could be a good idea !
#refresh https://github.com/Rip-Rip/clang_complete.git clang_complete

# Neocomplcache, a boosted auto-completion
refresh https://github.com/Shougo/neocomplcache.git neocomplcache

# To have a view of vim 256 colors
refresh https://github.com/guns/xterm-color-table.vim.git xterm-color-table

# Tagbar, context-aware
refresh https://github.com/majutsushi/tagbar.git tagbar

# Most recently used files
refresh https://github.com/ornicar/vim-mru.git mru


##### Some things for ensime in vim, Jean-luc Chasseriau's version #####
# ensime itself, scala 2.9 version
refresh git://github.com/aemoncannon/ensime.git ensime

# ensime-common, contains decorators, S-expr parser, and Swank protocol stuff
refresh git://github.com/jlc/ensime-common.git ensime-common

# envim itself
# XXX don't let it refresh by itself as I removed stuff with vim addon manager
refresh git://github.com/jlc/envim.git envim

# Vim-async-beans : async communication through NetBeans protocol
refresh git://github.com/jlc/vim-async-beans.git vim-async-beans

# vim-scala-behaghel: version of scala vim config files by some guy that
# seems to have improved it. (but needs some testing before...)
refresh https://github.com/behaghel/vim-scala.git vim-scala-behaghel

# Vim-async
refresh git://github.com/jlc/vim-addon-async.git vim-addon-async
