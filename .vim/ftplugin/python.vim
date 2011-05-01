" Il faut bien entendu que le filetype plugin soit activé dans .vimrc et
" .gvimrc, ce qui est le cas.


" Omnicomplétion pour Python, elle est mappée sur C-Space dans le .vimrc et
" .gvimrc
set omnifunc=pythoncomplete#Complete
" Pour régler un pb avec l'omnicompletion qui stoppe lors de la complétion pour un module
au filetype python imap <silent> <expr> <buffer> <CR> pumvisible() ? "<CR><C-R>=(col('.')-1&&match(getline(line('.')), '\\.',
      \ col('.')-2) == col('.')-2)?\"\<lt>C-X>\<lt>C-O>\":\"\"<CR>"
      \ : "<CR>"


let python_highlight_all=1							" Plus de coloration pour Python


" --------------------- Des trucs pour être PEP8-friendly -------------------
" 4 espaces pour une tabulation
setlocal tabstop=4

" De même pour l'indentation (j'ai pas trop la différence entre les deux)
setlocal shiftwidth=4

" On indente avec des espaces, pas des tabulations
setlocal expandtab

" Pour que le backspace supprime 4 espaces (rend le tout presque aussi
" pratique qu'avec des tabulations)
setlocal softtabstop=4

" Sur pression de F3, highlight les caractères qui dépassent la 80è colonne
map <silent> <F3> "<Esc>:match ErrorMsg '\%>80v.\+'<CR>"


" Quickfix, pour naviguer entre les erreurs
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
set makeprg=python
