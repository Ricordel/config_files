setlocal nosmartindent   " As smartindent screws with comments in Python

"nnoremap <leader>m :PyLint<CR>
nnoremap <leader>m :make<CR><CR><CR>:cwindow<CR>
setlocal makeprg=pylint\ --reports=n\ --errors-only\ --output-format=parseable\ %:p
setlocal errorformat=%f:%l:\ %m


""""" Some eclim stuff -------

" Autocomplete, with C-space of course !
inoremap <silent> <buffer> <Nul> <c-x><c-u>

""""" At the origin, my global leader '<leader>j' was intended for java...
" But why remember a different leader for every language ? So <leader>j here too


" Find use (if on definition) or definition (if on use) of the
" symbol under cursor
nnoremap <silent> <buffer> <leader>js :PythonSearchContext<cr>

" When there is only one result to search, open the file in a new tab
let g:EclimPythonSearchSingleResult = 'tabnew'


" As long as I don't have a real omnicompletion for python
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "context"


" python-mode related confituration
let g:pymode_run = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_unmodified = 0
let g:pymode_run_bind = '<leader>t'
let g:pymode_lint_checkers = ['pyflakes', 'mccabe', 'pylint']
let g:pymode_lint_ignore = 'E501,W,C,R0201,R0912' " ignore style-related issues, and warnings (because warnings are annoying with pylint)
let g:pymode_rope_goto_definition_bind = 'gd'
let g:pymode_rope_autoimport_bind = '<leader>ji'
let g:pymode_options_max_line_length = 2000
