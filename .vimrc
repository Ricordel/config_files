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
set wildmenu

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


" Move into splits with C-j, k, l, ...
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

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

" Tagbar toggles with F9
nmap <F9> :TagbarToggle<CR>

" Recognize Scala fileType, which does not seem automatic
au BufRead,BufNewFile *.scala setlocal ft=scala

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



" NeocompleteCache, a nice autocompletion
" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
"" Use neocomplcache.
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
"" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 4
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"let g:neocomplcache_disable_auto_complete = 1 " Complete only if I ask, please !
