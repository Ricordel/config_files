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


# vim-scala-behaghel: version of scala vim config files by some guy that
# seems to have improved it. (but needs some testing before...)
refresh https://github.com/behaghel/vim-scala.git vim-scala-behaghel

# Fugitive: the ultimate git integration
refresh https://github.com/tpope/vim-fugitive

# Vim-surround: vais-je vraiment l'utiliser ? Mystère...
refresh https://github.com/tpope/vim-surround

# New tentative ensime integration by Andrey Popp
refresh https://github.com/andreypopp/ensime

# Snipmate, snippet engine
refresh https://github.com/msanders/snipmate.vim.git snipmate

# Go standard plugins
regresh https://github.com/jnwhiteh/vim-golang.git

# Go autocomplete
refresh https://github.com/nsf/gocode.git

# Nyan cat, because...
refresh https://github.com/koron/nyancat-vim.git

# Powerline, a better status line
refresh https://github.com/Lokaltog/vim-powerline

# A restructured text plugin. Celui-là est pourri, fait n'importe quoi avec les tableaux
#refresh https://github.com/Rykka/riv.vim
# Celui-là interfère avec la coloration python. Bien joué.
#refresh https://github.com/vim-scripts/VOoM.git

# Nouvel essai (pas sur github): http://www.vim.org/scripts/script.php?script_id=1334

# Ctrl-P, fuzzy finder
refresh https://github.com/kien/ctrlp.vim.git

# vim clojure
refresh https://github.com/vim-scripts/VimClojure.git

# Better documentation viewing
refresh https://github.com/powerman/vim-plugin-viewdoc
