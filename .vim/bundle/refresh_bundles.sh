#!/bin/bash

# Nerd commenter and nerdTree
git clone https://github.com/scrooloose/nerdcommenter.git nerdcommenter
git clone https://github.com/scrooloose/nerdtree.git nerdtree

# Match non single-chars, for instance tags in html
git clone https://github.com/vim-scripts/matchit.zip.git matchit

# clang-complete, can't do without it for C programs
git clone https://github.com/Rip-Rip/clang_complete.git clang_complete

# Neocomplcache, a boosted auto-completion: don't think I really use it
#git clone https://github.com/Shougo/neocomplcache.git neocomplcache

# To have a view of vim 256 colors
git clone https://github.com/guns/xterm-color-table.vim.git xterm-color-table

# Tagbar, context-aware
git clone https://github.com/majutsushi/tagbar.git tagbar

# Most recently used files
git clone https://github.com/ornicar/vim-mru.git mru


# vim-scala-behaghel: version of scala vim config files by some guy that
# seems to have improved it. (but needs some testing before...)
git clone https://github.com/behaghel/vim-scala.git vim-scala-behaghel

# Fugitive: the ultimate git integration
git clone https://github.com/tpope/vim-fugitive

# Vim-surround: vais-je vraiment l'utiliser ? Mystère... en fait non
#git clone https://github.com/tpope/vim-surround

# New tentative ensime integration by Andrey Popp
#git clone https://github.com/andreypopp/ensime

# Snipmate, snippet engine, and dependancies
git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/garbas/vim-snipmate.git
# And the snippets that go with
git clone https://github.com/honza/vim-snippets.git


# Go standard plugins
git clone https://github.com/jnwhiteh/vim-golang

# Go autocomplete
go get -u github.com/nsf/gocode # This has to go in $GOPATH, not in bundles, which 'go get' will do
# Get the right stuff at the right place for pathogen
$GOPATH/src/github.com/nsf/gocode/vim/pathogen_update.sh


# Nyan cat, because...
git clone https://github.com/koron/nyancat-vim.git

# Powerline, a better status line
git clone https://github.com/Lokaltog/vim-powerline

# vim clojure
git clone https://github.com/vim-scripts/VimClojure.git

# Better documentation viewing BREAKS PYTHON SYNTAX !!
#git clone https://github.com/powerman/vim-plugin-viewdoc

# Dependancy for Omnisharp
git clone git://github.com/tpope/vim-dispatch.git
# Testing Omnisharp, a C# plugin
git clone https://github.com/nosami/Omnisharp.git
git submodule update --init
cd Omnisharp/server
xbuild /p:Platform="Any CPU"

# Buffer grep: grep on open buffers with :Bgrep
git clone https://github.com/vim-scripts/buffergrep.git

# Supertab
git clone https://github.com/ervandew/supertab.git

# Ctrl-P, fuzzy finder: shitty, prefer the other one
#git clone https://github.com/kien/ctrlp.vim.git
# Fuzzyinder
hg clone https://bitbucket.org/ns9tks/vim-l9
hg clone https://bitbucket.org/ns9tks/vim-fuzzyfinder

# hilinks, to debug syntax files, mostly
git clone https://github.com/kergoth/vim-hilinks.git
# Better documentation viewing, breaks Python syntax highlighting
#refresh https://github.com/powerman/vim-plugin-viewdoc

# Scala files
git clone git@github.com:Ricordel/vim-scala.git

# Markdown files
git clone https://github.com/tpope/vim-markdown.git

# To edit very large files without choking
git clone https://github.com/vim-scripts/LargeFile.git

# pss plugin to navigate source
hg clone https://bitbucket.org/bernh/pss.vim
