

inoremap <Nul> <c-x><c-u>

"""" Clang_complete options
let g:clang_auto_select = 0
let g:clang_complete_auto = 0
let b:clang_complete_macros = 1
let g:clang_hl_errors = 1
let g:clang_user_option = '2>/dev/null || exit 0'
let g:clang_use_library = 0 " XXX : change that once sure it works ! It does not work
let g:clang_library_path = '/usr/lib/llvm/libclang.so'


map <leader>u :call g:ClangUpdateQuickFix()<CR>
