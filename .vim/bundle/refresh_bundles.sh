#!/bin/bash

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
refresh https://github.com/Rip-Rip/clang_complete.git clang_complete

# Neocomplcache, a boosted auto-completion
refresh https://github.com/Shougo/neocomplcache.git neocomplcache

# To have a view of vim 256 colors
refresh https://github.com/guns/xterm-color-table.vim.git xterm-color-table

# Tagbar, context-aware
refresh https://github.com/majutsushi/tagbar.git tagbar
