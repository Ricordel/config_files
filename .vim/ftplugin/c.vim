"inoremap <Nul> <c-x><c-o>

setlocal syn=cpp.doxygen

map <leader>m :make<CR><CR> :cwindow<CR>

" Ignore lines out of make tat do not match gcc error format
"let g:compiler_gcc_ignore_unmatched_lines=1

"setlocal errorformat=%f:%l:%c:\ %t%s:\ %m


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
let g:clang_complete_auto = 1
let b:clang_complete_macros = 1
let g:clang_hl_errors = 0
let g:clang_user_option = '2>/dev/null || exit 0'
let g:clang_use_library = 1
let g:clang_library_path = '/usr/lib/llvm-3.5/lib/'
let g:clang_library_name = 'libclang.so.1'
let g:clang_periodic_quickfix = 0 " bypasses clang_hl_errors and breaks syntax highlighting.
let g:clang_hl_errors=0 " was broken last time I tried
let g:clang_auto_user_options = ".clang_complete"
let g:clang_jumpto_declaration_key='gd'

let g:clang_snippets=1
let g:clang_snippets_engine="clang_complete"
let g:clang_trailing_placeholder=1
let g:clang_conceal_snippets=1

set completeopt=menu,longest " choose which completion to use

setlocal tabstop=8
setlocal softtabstop=8
setlocal shiftwidth=8
setlocal autoindent
setlocal smartindent
setlocal expandtab


map <leader>u :call g:ClangUpdateQuickFix()<CR>
"" Make snippet-completion acceptable
imap <leader>r <ESC><TAB>
