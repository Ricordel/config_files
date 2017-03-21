setlocal nosmartindent   " As smartindent screws with comments in Python

"nnoremap <leader>m :PyLint<CR>
"nnoremap <leader>m :make<CR><CR><CR>:cwindow<CR>
"setlocal makeprg=pylint\ --reports=n\ --errors-only\ --output-format=parseable\ %:p
"setlocal makeprg=pylint\ --rcfile=~/.config/pylint/pylint.rc\ --output-format=parseable\ %:p
"
"setlocal makeprg=/home/yoann/bin/pylint-with-options\ %:p

" Function to activate a virtualenv in the embedded interpreter for
" omnicomplete and other things like that.
function LoadVirtualEnv(path)
    let activate_this = a:path . '/bin/activate_this.py'
    if getftype(a:path) == "dir" && filereadable(activate_this)
        python << EOF
import vim
activate_this = vim.eval('l:activate_this')
execfile(activate_this, dict(__file__=activate_this))
EOF
    endif
endfunction

" Load up a 'stable' virtualenv if one exists in ~/.virtualenv
let defaultvirtualenv = $HOME . "/.virtualenvs/stable"

" Only attempt to load this virtualenv if the defaultvirtualenv
" actually exists, and we aren't running with a virtualenv active.
if has("python")
    if empty($VIRTUAL_ENV) && getftype(defaultvirtualenv) == "dir"
        call LoadVirtualEnv(defaultvirtualenv)
    endif
endif

setlocal makeprg=flake8\ --ignore\ E501,F405,F403,E303,E302\ %:p
setlocal errorformat=%f:%l:%c:\ %m
nnoremap <leader>m :make<CR><CR><CR>:cwindow<CR>

let g:fuf_coveragefile_exclude = '\v\~$|\.(o|exe|dll|bak|orig|swp)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|(^venv)'


""""" Some eclim stuff -------

" Autocomplete, with C-space of course !
"inoremap <silent> <buffer> <Nul> <c-x><c-o>

""""" At the origin, my global leader '<leader>j' was intended for java...
" But why remember a different leader for every language ? So <leader>j here too


" Find use (if on definition) or definition (if on use) of the
" symbol under cursor
"nnoremap <silent> <buffer> <leader>js :PythonSearchContext<cr>

" When there is only one result to search, open the file in a new tab
"let g:EclimPythonSearchSingleResult = 'tabnew'


" As long as I don't have a real omnicompletion for python
"let g:SuperTabContextDefaultCompletionType = "<c-n>"
"let g:SuperTabDefaultCompletionType = "context"

let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501,F405,F403,E303,E302'

" python-mode related confituration
"let g:pymode_run = 1
"let g:pymode_lint_on_write = 0
"let g:pymode_lint_unmodified = 0
"let g:pymode_run_bind = '<leader>t'
"let g:pymode_lint_checkers = ['pyflakes', 'mccabe', 'pylint']
"let g:pymode_lint_ignore = 'E501,W,C,R0201,R0912' " ignore style-related issues, and warnings (because warnings are annoying with pylint)
"let g:pymode_rope_goto_definition_bind = 'gd'
"let g:pymode_rope_autoimport_bind = '<leader>ji'
"let g:pymode_options_max_line_length = 2000
