" Vim color file
" Maintainer:   Yoann Ricordel <yoann.ricordel@gmail.com>
" Last Change:  $Date: 2011/04/11 15:00:00 $
" Version:  $Id: yaude.vim,v 1.0 2011/04/11 15:00:00 $
" License:  GPLv3

" NB : 
"   - The cUserFunction depends on an addon for C syntax
"   - The PythonSelf and PythonUserFunction also depends on an addon 
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

hi Normal       guifg=#E0E0E0   guibg=#0B0B0B       ctermfg=254 cterm=bold

" highlight groups
hi Cursor       guibg=grey90    guifg=grey20
hi CursorLine   guibg=#1D1D1D                       ctermbg=darkgrey
hi VertSplit    guibg=#c2bfa5   guifg=grey50    gui=none
hi Folded       guibg=grey30    guifg=gold
hi FoldColumn   guibg=grey30    guifg=tan
hi IncSearch    guifg=black     guibg=#FFC31C       ctermfg=black   ctermbg=yellow
hi LineNr       guifg=#4B23FF                       ctermfg=250     ctermbg=234
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
hi Comment      guifg=#808080       gui=bold        ctermfg=245     cterm=bold
hi Constant     guifg=#6CD800       gui=bold        ctermfg=106     cterm=bold
hi Number       guifg=#72FC27       gui=none        ctermfg=105     cterm=bold
hi String       guifg=#9DDA53                       ctermfg=10
hi Character    guifg=#E0E0E0       gui=bold        ctermfg=lightgrey cterm=bold
hi Boolean      guifg=#89DE00       gui=bold        ctermfg=106     cterm=bold
hi Identifier   guifg=#00AEFF       gui=bold        ctermfg=white       cterm=bold
hi stdFunction                                      ctermfg=69    cterm=bold
hi Function                                         ctermfg=39    cterm=bold
hi pythonUserFunction guifg=#00AEFF     gui=bold    ctermfg=39      cterm=bold
hi hsFunction                           ctermfg=white   cterm=bold
hi hsUserFunction                           ctermfg=39      cterm=bold
hi scalaDefName guifg=#00AEFF       gui=bold        ctermfg=39      cterm=bold
hi scalaDefSpecializer guifg=#00AEFF        gui=bold        ctermfg=white       cterm=bold
hi scalaMethodCall guifg=#00AEFF        gui=bold        ctermfg=69      cterm=bold
hi scalaStdFunction guifg=#00AEFF       gui=bold        ctermfg=69      cterm=bold
hi pythonSelf   guifg=#36C23C       gui=bold,italic ctermfg=28      cterm=bold
hi cTypeModifier                                    ctermfg=112     cterm=bold
hi cTypeDeclarator                                    ctermfg=112     cterm=bold
hi Statement    guifg=#CC01F2       gui=bold        ctermfg=165     cterm=bold
hi Exception    guifg=#D400E7       gui=bold        ctermfg=magenta cterm=bold
"hi operator     guifg=#5F5FFF       gui=bold        ctermfg=9       cterm=bold
hi operator     guifg=#5F5FFF       gui=bold        ctermfg=203       cterm=bold
hi PreProc      guifg=#48AFBF       gui=bold        ctermfg=31  cterm=bold
hi Type         guifg=#00BF09       gui=bold        ctermfg=106 cterm=bold
hi Special      guifg=#FFC31C       gui=bold        ctermfg=214 cterm=bold
hi Tag          guifg=red
hi Delimiter    guifg=#FFA41E       gui=bold        ctermfg=214     cterm=bold
hi pythonDelimiter guifg=#FFC005 gui=bold           ctermfg=214     cterm=bold
hi Ignore       guifg=grey40
hi Todo         guifg=black guibg=yellow2
hi keyword                                              ctermfg=105      cterm=bold
hi scalaSymbol                                          ctermfg=white cterm=bold
hi scalaRoot                                            ctermfg=white cterm=bold
"hi scalaKeyword                                            ctermfg=106       cterm=bold
hi scalaClassName                                       ctermfg=82      cterm=bold
hi scalaDef guifg=#36C23C       gui=bold,italic ctermfg=197     cterm=bold
hi scalaVar guifg=#36C23C       gui=bold,italic ctermfg=197     cterm=bold
hi scalaVal guifg=#36C23C       gui=bold,italic ctermfg=197     cterm=bold

hi psycStatement    ctermfg=47  cterm=bold




hi Visual   cterm=reverse
hi VisualNOS    cterm=bold,underline
