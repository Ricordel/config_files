"inoremap <Nul> <c-x><c-o>

setlocal shiftwidth=8
setlocal tabstop=8

map <leader>m :make<CR><CR> :copen<CR>



"For Eclim:

" Search the definition/use of the symbol under the cursor
"nnoremap <silent> <buffer> <leader>js :CSearchContext<cr>

" Autocomplete with C-space
inoremap <silent> <buffer> <Nul> <c-x><c-u>
inoremap <silent> <buffer> <leader>d <c-x><c-u>

"let g:EclimCSearchSingleResult='edit'



"""""" Ce qui est en dessous: pour clang-complete. Commenté pour tenter Eclim

setlocal completefunc=ClangComplete
setlocal omnifunc=ClangComplete

"""" Clang_complete options
let g:clang_auto_select = 0
let g:clang_complete_auto = 0
let b:clang_complete_macros = 1
let g:clang_hl_errors = 0
let g:clang_user_option = '2>/dev/null || exit 0'
let g:clang_use_library = 1
let g:clang_library_path = '/usr/lib/llvm-3.3/lib/'
let g:clang_periodic_quickfix = 0

let g:clang_snippets=0
let g:clang_snippets_engine="clang_complete"
let g:clang_trailing_placeholder=1
let g:clang_conceal_snippets=1

setlocal tabstop=8
setlocal softtabstop=8
setlocal shiftwidth=8
setlocal autoindent
setlocal smartindent
setlocal expandtab


map <leader>u :call g:ClangUpdateQuickFix()<CR>
"" Make snippet-completion acceptable
imap <leader>r <ESC><TAB>
