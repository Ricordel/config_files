" Vim color file
" Maintainer:   Yoann Ricordel <yoann.ricordel@gmail.com>
" Last Change:  $Date: 2011/04/11 15:00:00 $
" Version:  $Id: yaude.vim,v 1.0 2011/04/11 15:00:00 $
" License:  GPLv3

" NB : 
"   - The PythonSelf also depends on an addon 
"   hi def link pythonSelf keyword
"   for Python syntax

" NOTE : the gui version is not up-to-date




set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="yaude"

hi Normal       guifg=#E0E0E0   guibg=#0B0B0B       ctermfg=254

" highlight groups
hi Cursor       guibg=grey90    guifg=grey20
hi CursorLine   guibg=#1D1D1D                   ctermbg=235
hi clear CursorLine
hi CursorLineNR guibg=#1D1D1D                   ctermbg=39
hi VertSplit    guibg=#c2bfa5   guifg=grey50    gui=none
hi Folded       guibg=grey30    guifg=gold
hi FoldColumn   guibg=grey30    guifg=tan
hi IncSearch    guifg=black     guibg=#FFC31C       ctermfg=black   ctermbg=yellow
hi LineNr       guifg=#e4e4e4                       ctermfg=250     ctermbg=234
hi ModeMsg      guifg=goldenrod
hi MoreMsg      guifg=SeaGreen
hi NonText      guifg=LightBlue guibg=grey30
hi Question     guifg=springgreen
hi Search       guibg=#FFC31C   guifg=black         ctermfg=172     ctermbg=235
hi SpecialKey   guifg=yellowgreen
hi StatusLine   guibg=#353535   guifg=#F0F0F0   gui=none ctermfg=248
hi StatusLineNC guibg=#c2bfa5   guifg=grey50    gui=none
hi Title        guifg=indianred
hi Visual       guibg=#2D2D2D                   gui=none
hi WarningMsg   guifg=salmon

" syntax highlighting groups
hi Comment      guifg=#8a8a8a       gui=bold        ctermfg=245     cterm=bold
hi Constant     guifg=#87af00       gui=bold        ctermfg=106     cterm=bold
hi Number       guifg=#8787ff       gui=none        ctermfg=105     cterm=bold
hi String       guifg=#ffff87                       ctermfg=11
hi Character    guifg=#E0E0E0       gui=bold        ctermfg=lightgrey cterm=bold
hi Boolean      guifg=#87af00       gui=bold        ctermfg=106     cterm=bold
hi Identifier   guifg=#87afff                       ctermfg=111   cterm=bold
hi stdFunction  guifg=#5f87ff       gui=bold        ctermfg=69    cterm=bold
hi Function     guifg=#00afff       gui=bold        ctermfg=39    cterm=bold
hi TypeModifier guifg=#008700       gui=bold        ctermfg=28     cterm=bold
hi Statement    guifg=#af5fff       gui=bold        ctermfg=135     cterm=bold
hi Exception    guifg=#aaf0ff       gui=bold        ctermfg=magenta cterm=bold
hi operator     guifg=#df5f5f       gui=bold        ctermfg=161       cterm=bold
hi PreProc      guifg=#48AFBF       gui=bold        ctermfg=31  cterm=bold
hi Type         guifg=#87af00       gui=bold        ctermfg=106 cterm=bold
hi Special      guifg=#FFaf00       gui=bold        ctermfg=214 cterm=bold
hi Tag          guifg=red
hi Delimiter    guifg=#FFaf00       gui=bold        ctermfg=214     cterm=bold
hi pythonDelimiter guifg=#FFaf00    gui=bold        ctermfg=214     cterm=bold
hi Ignore       guifg=grey40
hi Todo         guifg=black guibg=yellow2
hi keyword      guifg=#df5f5f       gui=bold        ctermfg=161      cterm=bold
hi def PropertyName guifg=#afdfdf                   ctermfg=152      cterm=bold

" weird thing that does not work if directly linked with Type... (cf after/syntax/c.vim)
hi cCustomClass   guifg=#36C23C       gui=bold,italic ctermfg=28      cterm=bold


hi SpecialKey      ctermfg=239

"hi Visual       cterm=reverse
hi Visual       ctermbg=240
hi VisualNOS    cterm=bold,underline

hi rstEmphasis      cterm=bold

hi DiffAdd                     ctermbg=22
hi DiffChange      ctermfg=181 ctermbg=24
hi DiffDelete      ctermfg=162 ctermbg=53
"hi DiffText                    ctermbg=102 cterm=bold
hi DiffText                    ctermbg=52 cterm=bold
hi SpellBad                ctermbg=88  cterm=italic
hi SpellCap                ctermbg=20  cterm=italic
hi SpellLocal              ctermbg=17  cterm=italic
hi SpellRare  ctermfg=none ctermbg=none  cterm=reverse


" Popup colors
hi Pmenu                    ctermbg=56  ctermfg=252
hi PmenuSel                 ctermbg=22  ctermfg=252

hi NormalFloat              ctermbg=240
