""""""""" This is mainly eclim configuration


" Autocomplete with Ctrl-Space
inoremap <silent> <buffer> <Nul> <c-x><c-u>
" try with ,d
inoremap <silent> <buffer> <leader>d <c-x><c-u>

"XXX decide later if we want completion to be case sensitive
" let g:EclimJavaCompleteCaseSensitive=1

" Some nice shortcuts for eclim

" The 'extended leader' for java is <leader>j

" Search symbol unnnder the cursor with Enter
nnoremap <silent> <buffer> <leader>js :JavaSearchContext<cr>

" Import what is under the cursor
nnoremap <silent> <buffer> <leader>ji :JavaImport<cr>

" Search the documentation for symbol under cursor
nnoremap <silent> <buffer> <leader>jd :JavaDocSearch<cr>

" Correction suggestion on quickfix error
nnoremap <silent> <buffer> <leader>jc :JavaCorrect<cr>


" When there is only one result to search, open the file in a new tab
let g:EclimJavaSearchSingleResult = 'tabnew'
