" Syntax completion with Ctrl-Space
inoremap <Nul> <c-x><c-o>

setlocal noexpandtab
setlocal fileformat=dos

setlocal formatoptions-=o

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

" Add compiler stuff
let current_compiler = "xbuild"
let s:keepcpo= &cpo
set cpo&vim

if exists(":CompilerSet") != 2  " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet errorformat=\ %#%f(%l\\\,%c):\ %m
CompilerSet makeprg=xbuild\ /nologo\ /v:q\ /property:GenerateFullPaths=true

"CompilerSet errorformat=
        "\%*[^\"]\"%f\"%*\\D%l:\ %m,
        "\\"%f\"%*\\D%l:\ %m,
        "\%f(%l\\,%c):\ %trror\ CS%\\d%\\+:\ %m,
        "\%f(%l\\,%c):\ %tarning\ CS%\\d%\\+:\ %m,
        "\%f:%l:\ %m,
        "\\"%f\"\\,\ line\ %l%*\\D%c%*[^\ ]\ %m,
        "\%D%*\\a[%*\\d]:\ Entering\ directory\ `%f',
        "\%X%*\\a[%*\\d]:\ Leaving\ directory\ `%f',
        "\%DMaking\ %*\\a\ in\ %f,
        "\%-G%.%#Compilation%.%#,
        "\%-G%.%#


let &cpo = s:keepcpo
unlet s:keepcpo

nnoremap <leader>m :make<cr> :copen<cr>
