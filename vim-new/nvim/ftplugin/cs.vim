" Syntax completion with Ctrl-Space
inoremap <c-k> <c-x><c-o>


set splitbelow
setlocal expandtab

setlocal formatoptions-=o


"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabContextDefaultCompletionType = "<c-n>"

inoremap <c-space> <c-x><c-o>


" Arguments function alignment like:
"       func(int a, int b
"            int c, int d)
set cinoptions=(0

" Wrap on 120 chars. With the one above, gqq will wrap arguments properly
set textwidth=120


" Add compiler stuff
let current_compiler = "msbuild"
let s:keepcpo= &cpo
set cpo&vim

if exists(":CompilerSet") != 2  " older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

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

CompilerSet makeprg=dotnet\ msbuild\ /property:GenerateFullPaths=true\ /verbosity:quiet

let &cpo = s:keepcpo
unlet s:keepcpo

nnoremap <leader>m :make!<cr> :cwindow<cr>


""" Semantic highlight bindings
"let g:OmniSharp_highlight_groups = {
    "\ 'Comment': 'Comment',
    "\ 'LocalName': 'Normal',
    "\ 'PropertyName': 'PropertyName',
    "\ 'ParameterName': 'Identifier',
    "\ 'XmlDocCommentName': 'Identifier',
    "\ 'XmlDocCommentText': 'NonText'
"\}
