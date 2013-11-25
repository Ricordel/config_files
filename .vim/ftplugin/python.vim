setlocal nosmartindent   " As smartindent screws with comments in Python

"nnoremap <leader>m :PyLint<CR>
nnoremap <leader>m :make<CR><CR><CR>:copen<CR>
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
