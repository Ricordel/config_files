" Syntax for Qarnot log formats

if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "qlog"

syn match separator '|'
syn match date         "^[^|]*" nextgroup=hostid
syn match hostid       "|[^|]*" contained nextgroup=threadid
syn match threadid     "|[^|]*" contained nextgroup=msgnature
syn match msgnature    "|[^|]*" contained nextgroup=loglocation contains=Warn,QError,Info,Debug
syn match loglocation  "|[^|]*" contained nextgroup=logcontent
syn match logcontent   "|[^|]*" contained


syn keyword basicKeywords in
syn keyword Warn WARNING
syn keyword QError ERROR
syn keyword Info INFO DEBUG
syn keyword Debug DEBUG

syn region stackRegion start="^---" end="^---"

hi date         ctermfg=red
hi hostid       ctermfg=blue
hi threadid     ctermfg=cyan
hi msgnature    ctermfg=green
hi loglocation  ctermfg=yellow
hi logcontent   ctermfg=251     cterm=bold
hi QError       ctermfg=197     cterm=bold
hi Warn         ctermfg=208
hi Info         ctermfg=41
hi Debug        ctermfg=141
