" Syntax completion with Ctrl-Space
inoremap <c-k> <c-x><c-o>


set splitbelow
setlocal expandtab

setlocal formatoptions-=o


let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

setlocal omnifunc=OmniSharp#Complete

" Supertab: omnicompletion with tab
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"


" Use the preview window instead of the status line for type lookup
let g:OmniSharp_typeLookupInPreview=1

nnoremap gd :OmniSharpGotoDefinition<cr>
nnoremap <leader>jd :OmniSharpGotoDefinition<cr>
inoremap <F12> <ESC>:OmniSharpGotoDefinition<cr>

nnoremap fi :OmniSharpFindImplementations<cr>
nnoremap <leader>ji :OmniSharpFindImplementations<cr>

nnoremap fu :OmniSharpFindUsages<cr>
nnoremap <leader>ju :OmniSharpFindUsages<cr>

nnoremap <leader>jt :OmniSharpTypeLookup<cr>
nnoremap <leader>jr :OmniSharpRename<cr>
nnoremap <leader>js :OmniSharpReloadSolution<cr>

nnoremap <leader>jc :OmniSharpFindSyntaxErrors<cr>


"don't autoselect first item in omnicomplete, show if only one item (for preview)
set completeopt=longest,menuone,preview


"nnoremap <space> :OmniSharpGetCodeActions<cr>


" Add compiler stuff
let current_compiler = "msbuild"
let s:keepcpo= &cpo
set cpo&vim

if exists(":CompilerSet") != 2  " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

"CompilerSet errorformat=\ %#%f(%l\\\,%c):\ %trror\ %m,
"CompilerSet errorformat+=%f(%l):\ %trror\ %m,


CompilerSet errorformat=
    \%*[^\"]\"%f\"%*\\D%l:\ %m,
    \\"%f\"%*\\D%l:\ %m,
    \%f(%l\\,%c):\ %trror\ %m,
    \%f(%l\\,%c+):\ %trror\ %m,
    \%f(%l\\,%c):\ %tarning\ %m,
    \%f(%l\\,%c+):\ %tarning\ %m,
    \%f:%l:\ %m,
    \\"%f\"\\,\ line\ %l%*\\D%c%*[^\ ]\ %m,
    \%D%*\\a[%*\\d]:\ Entering\ directory\ `%f',
    \%X%*\\a[%*\\d]:\ Leaving\ directory\ `%f',
    \%DMaking\ %*\\a\ in\ %f,
    \%-G%.%#Compilation%.%#,
    \%-G%.%#

"CompilerSet makeprg=msbuild\ /nologo\ /v:q\ /property:GenerateFullPaths=true\ /verbosity:quiet
CompilerSet makeprg=/home/yoann/bin/msbuild-filtered\ /nologo\ /v:q\ /property:GenerateFullPaths=true\ /verbosity:quiet

let &cpo = s:keepcpo
unlet s:keepcpo

nnoremap <leader>m :make!<cr> :cwindow<cr>

