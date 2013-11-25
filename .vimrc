"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" First of all, load and put in runtimepath all bundle with pathogen
call pathogen#infect()
call pathogen#helptags() " To generate doc, could be removed if lows down startup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General behaviour preferences
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible		" Break retrocompatibility with plain old vi
set fileformat=unix		" Files at unix format (CR)
set shell=bash
set mouse=a                     " I can use the mouse if I want

set textwidth=999	" I don't want it limited if not in some precise language

set vb " Visual bell, no way vim can make noise !
set number " line numbers

set autowrite " Automatically save current buffer when switching buffers (bn, bp, ...)

let mapleader="," " The leader, ',' is cool on azerty keyboards

set backspace=indent,eol,start "allow backspacing over everything in insert mode
set showcmd " show partial commands in status line
set ruler   " Affiche constament la position du curseur
set laststatus=2 " tells when last window has status lines

" File completion : emacs-mode (longest prefix, then show a list
set wildmode=longest,list
"set wildmenu

" Folding-related
set foldmethod=syntax  " Folds are decided conidering syntax
set foldminlines=4  " Don't fold if too small
set foldopen=jump,mark,quickfix,tag,search,undo  " Open fold in such situations
set nofoldenable  " File is not folded by default


" Search : incremental with highlight and smartcase, AND a fast way to make it
" stop highlighting (,n)
set hlsearch
set incsearch
set ignorecase smartcase
nnoremap <leader>n :nohls<CR>

" Autocomments: continue comments in insert mode, but not wit o,O (just don' like it)
au BufRead,BufNewFile * setlocal formatoptions+=r
au BufRead,BufNewFile * setlocal formatoptions-=o
set formatoptions+=r
set formatoptions-=o


" Backup-related stuff : use backup but don't put it in current dir !
set backup
set backupdir=~/.vim_tmp,~/.tmp,~/tmp,/tmp
set directory=~/.vim_tmp,~/.tmp,~/tmp,/tmp
set undofile " Undo persistant : keeps undo log even when file closed
set undodir=~/.vim_tmp,~/.tmp,~/tmp,/tmp

set switchbuf=useopen " use open buffer when in quickfix mode

" Jump to last cursor position unless it's invalid or in an event handler
" (Thanks Gary Bernhard)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif


" Tell vim that shell scripts should be posix
let g:is_posix=1


" Move correctly on wrapped lines
nmap j gj
nmap k gk

" Buffer next and buffer previous
nmap <c-n> :bn<cr>
nmap <c-b> :bp<cr>


" Move into splits with C-j, k, l, ...
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Have the current file display on two columns with scrollbind
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

"""" Quickfix and location windows related. All mappings exist beginning by 'q'
" for quickfix and 'l' for location
:botright cwindow " Window always fullwidth

" Show error
nnoremap <leader>qs :cc<CR>
nnoremap <leader>ls :ll<CR>
" next
nnoremap <leader>qn :cnext<CR>
nnoremap <leader>ln :lnext<CR>
" Previous
nnoremap <leader>qp :cprevious<CR>
nnoremap <leader>lp :lprevious<CR>
" First
nnoremap <leader>qf :cfirst<CR>
nnoremap <leader>lf :lfirst<CR>
" Last
nnoremap <leader>qf :clast<CR>
nnoremap <leader>lf :llast<CR>
" Window : open or refresh it if there are errors, close it if no error
nnoremap <leader>qw :cwindow<CR>
nnoremap <leader>lw :lwindow<CR>
" Open : open if existing
nnoremap <leader>qo :copen<CR>
nnoremap <leader>lo :lopen<CR>
" Close
nnoremap <leader>qc :cclose<CR>
nnoremap <leader>lc :lclose<CR>

" Clear the list
nnoremap <leader>qe :QuickFixClear<CR>




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Programmation-related options (tabs, completion, ...)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indenting-related options
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent


" Syntax coloring related stuff
set t_Co=256  " Use 256 colors terminal
set showmatch " Show matching parenthese
syntax on
filetype plugin indent on
colors yaude " Personal colorscheme

let g:rehash256=1 " for when I want to use the slightly modified Molokai theme.

map <F10> :set paste<CR>
map <F11> :set nopaste<CR>


" MULTIPURPOSE TAB KEY : Indent if we're at the beginning of a line. Else, do completion.
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-p>
"inoremap <Nul> <c-n>

" C-space makes omnicompletion
inoremap <Nul> <c-x><c-o>



" Only complete to longest common prefix and show the menu even for only
" one match. That's usefull if there is extra info such as file of origin
" of type of the completed element
set completeopt=menuone,longest  


" Auto-completion, in case there is nothing in ftplugin
autocmd FileType html        set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css         set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript  set omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType c           set omnifunc=clang
autocmd FileType php         set omnifunc=phpcomplete#CompletePHP
autocmd FileType ruby        set omnifunc=rubycomplete#Complete
autocmd FileType sql         set omnifunc=sqlcomplete#Complete
autocmd FileType python      set omnifunc=pythoncomplete#Complete
autocmd FileType xml         set omnifunc=xmlcomplete#CompleteTags



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"				Some plugins options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let NERDTreeQuitOnOpen=1 " Quit tree window when opening a file
" Toggle nerdTree window with F9
nnoremap <silent> <F8> :NERDTreeToggle ./<CR> 
let NERDTreeIgnore=['\.class$', '\.o$', '\.pyc$', '\~$']

" Tagbar toggles with F9
nmap <F9> :TagbarToggle<CR>

" Recognize latex files
au BufRead,BufNewFile *.tex setlocal ft=tex

" Recognize Scala fileType, which does not seem automatic
au BufRead,BufNewFile *.scala setlocal ft=scala

" Recognize qarnot log files
au BufRead,BufNewFile *.log setlocal ft=qlog
au BufRead,BufNewFile *.log.1 setlocal ft=qlog
au BufRead,BufNewFile *.log.2 setlocal ft=qlog
au BufRead,BufNewFile *.log.3 setlocal ft=qlog
au BufRead,BufNewFile *.log.4 setlocal ft=qlog
au BufRead,BufNewFile *.log.5 setlocal ft=qlog


" Scala syntax for tagbar
let g:tagbar_type_scala = {
		\ 'ctagstype' : 'Scala',
		\ 'kinds'     : [
			\ 'p:packages:1',
			\ 'V:values',
			\ 'v:variables',
			\ 'T:types',
			\ 't:traits',
			\ 'o:objects',
			\ 'a:aclasses',
			\ 'c:classes',
			\ 'r:cclasses',
			\ 'm:methods'
	\ ]
\ }





" Attempt to cut myself from the ESC key.
imap <leader>k <ESC>
imap <leader>w <ESC>:w<CR>a
nmap <leader>w :w<CR>


" Ctrl-P global settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*~,*.pyc,*.a,*.class


" Some stuff for clojure mode
let vimclojure#HighlightBuiltins=1      " Highlight Clojure's builtins
let vimclojure#ParenRainbow=1           " Rainbow parentheses'!

" For the viewdoc plugin
let g:viewdoc_open='split'      " Doc opened in an horizontal split


" For go syntax highlighting, I HATE trailing whitespace highlighting while I type
let go_highlight_trailing_whitespace_error = 0


""""""""" For gotags, according to https://github.com/jstemmer/gotags

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }




"""""""""""""" Some pyclewn stuff

" Print the variable under the cursor
map <leader>dp :exe "Cprint " . expand("<cword>") <CR>
" Print the value pointed to by the pointer under the cursor
map <leader>dx :exe "Cprint *" . expand("<cword>") <CR>
" Watch value under cursor
map <leader>dw :exe "Cdbgvar " . expand("<cword>") <CR>
" Unwatch value under cursor
map <leader>dd :exe "Cdelvar " . expand("<cword>") <CR>
" Expand/collapse watched value under cursor
map <leader>de :exe "Cfoldvar " . expand("<cword>") <CR>
" Activate the pyclewn mappings
map <leader>dm :Cmapkeys <CR>
" Desactivate them
map <leader>du :Cunmapkeys <CR>
" Start a debug session
map <leader>ds :Pyclewn <CR> :Cmapkeys <CR> :Cfile 


" Mapping for FuzzyFinder, starting witj <leader>f
" Buffer mode : search among open buffers
map <leader>fb :FufBuffer<cr>
" File mode, replacement for Cx-f
map <leader>ff :FufFile<cr>
" Recursive File mode, search recursively from current directory
map <leader>fr :FufCoverageFile<cr>
" Tags
map <leader>ft :FufTag<cr>


" Don't bother me with the question each time I quit.
let g:Omnisharp_stop_server=0

" SuperTab complete in 'logical' order
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"
