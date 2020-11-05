"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Nerd commenter, to comment / uncomment code easily
Plug 'scrooloose/nerdcommenter'

" A browsable tree view of the working directory
Plug 'scrooloose/nerdtree'

" Match non single-chars, for instance tags in html
Plug 'vim-scripts/matchit.zip'

" To have a view of vim 256 colors
Plug 'guns/xterm-color-table.vim'

" Most recently used files
Plug 'vim-scripts/mru.vim'


" # Snipmate, snippet engine, and dependancies
" git clone https://github.com/tomtom/tlib_vim.git
" git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
" git clone https://github.com/garbas/vim-snipmate.git
" # And the snippets that go with
" git clone https://github.com/honza/vim-snippets.git

" Airline, a better status line
Plug 'vim-airline/vim-airline'

" Buffer grep: grep on open buffers with :Bgrep
Plug 'vim-scripts/buffergrep'

" Ctrl-p: fuzzy finder to open files
Plug 'kien/ctrlp.vim'

" hilinks, to debug syntax files, mostly
Plug 'kergoth/vim-hilinks'

" Markdown files
Plug 'tpope/vim-markdown'

" To edit very large files without choking
Plug 'vim-scripts/LargeFile'

" local vimrc .lvimrc
Plug 'embear/vim-localvimrc'

" trailing whitespace highlight and remove
Plug 'bronson/vim-trailing-whitespace'

Plug 'ervandew/supertab'

" grep / git grep / ripgrep / whatevergrep plugin
Plug 'mhinz/vim-grepper'

" auto-close brackets and friends
Plug 'Raimondi/delimitMate'

" show indentation
Plug 'Yggdroot/indentLine'

" systemd syntax
Plug 'wgwoods/vim-systemd-syntax'

" toml syntax hithlighting
Plug 'cespare/vim-toml'

" git plugin
Plug 'tpope/vim-fugitive'

" surround text with stuff
Plug 'tpope/vim-surround'

" vue.js components syntax
Plug 'posva/vim-vue'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion: deoplete + language servers look like the best combo. Language server
" integrations also has some linting abilities that are nice
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

"Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clangd-completer' }
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'dimixar/deoplete-omnisharp'

"Plug 'deoplete-plugins/deoplete-jedi'


" language agnostic language server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

"""" Python

" Language server from Palantir. They may be have disputable ethics, but they
" make good software it seems...

" Semantic highlighting for Python
" Needs Python >= 3.5, to re-enable after upgrading to Stretch
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}



"""" C#

Plug 'OmniSharp/omnisharp-vim'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Linting: ale is pretty good, seems to do all I can want a.t.m
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'w0rp/ale'

call plug#end()



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General behaviour preferences
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible		" Break retrocompatibility with plain old vi
set fileformat=unix		" Files at unix format (CR)
set shell=bash
set mouse=a                     " I can use the mouse if I want

set ttyfast
set redrawtime=10000

" desactivate that useless antiquity of ex-mode
nnoremap Q <nop>

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

" Use 'very magic' regex instead of backslashing everything
"nnoremap / /\v
"nnoremap ? ?\v

cnoremap %s %s/\v

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

set noswapfile

set switchbuf=useopen " use open buffer when in quickfix mode

" Jump to last cursor position unless it's invalid or in an event handler
" (Thanks Gary Bernhard)
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif


" Tell vim that shell scripts should be posix
let g:is_posix=1

set scrolloff=4

" As I write comments in C# code that requires all sorts of weird
" tricks to work with Mono, this shortcut is absolutely essential.
command Shrug :normal i¯\_(ツ)_/¯<ESC>


" Highlight line number of the current cursor line
" Enable cursor line position tracking:
set cursorline
" Both the following are done in the colorscheme: This has to be done in the colorscheme
"   Remove the underline from enabling cursorline:
"   highlight clear CursorLine

"   Set line numbering to red background.
"   highlight CursorLineNR ctermbg=red

" Move correctly on wrapped lines
nmap j gj
nmap k gk


" diffget and diffput shorthands
nmap <leader>dg :diffget<CR>
nmap <leader>dp :diffput<CR>
vmap <leader>dg :diffget<CR>
vmap <leader>dp :diffput<CR>

" Buffer next and buffer previous
nmap <c-n> :bn<cr>
nmap <c-b> :bp<cr>


" Move into splits with C-j, k, l, ...
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Have the current file display on two columns with scrollbind
" noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

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




" XXX fix for neovim and terminator
set guicursor=
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
let $VTE_VERSION="100"




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
map <s-F10> :set nopaste<CR>


" MULTIPURPOSE TAB KEY : Indent if we're at the beginning of a line. Else, do completion.
" function! InsertTabWrapper()
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     else
"         return "\<c-n>"
"     endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper()<cr>
" inoremap <s-tab> <c-p>

" C-space makes omnicompletion
" inoremap <Nul> <c-x><c-o>



" Only complete to longest common prefix and show the menu even for only
" one match. That's usefull if there is extra info such as file of origin
" of type of the completed element
" set completeopt=longest,menuone
" let g:SuperTabLongestEnhanced=1


" Auto-completion, in case there is nothing in ftplugin
" autocmd FileType html        set omnifunc=htmlcomplete#CompleteTags
" autocmd FileType css         set omnifunc=csscomplete#CompleteCSS
" autocmd FileType javascript  set omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType c           set omnifunc=clang
" autocmd FileType php         set omnifunc=phpcomplete#CompletePHP
" autocmd FileType ruby        set omnifunc=rubycomplete#Complete
" autocmd FileType sql         set omnifunc=sqlcomplete#Complete
" autocmd FileType python      set omnifunc=pythoncomplete#Complete
" autocmd FileType xml         set omnifunc=xmlcomplete#CompleteTags

autocmd FileType json          set conceallevel=0



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"				Some plugins options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let NERDTreeQuitOnOpen=1 " Quit tree window when opening a file
" Toggle nerdTree window with F9
nnoremap <silent> <F8> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.class$', '\.o$', '\.pyc$', '\~$']

" Tagbar toggles with F9
nmap <F9> :TagbarToggle<CR>
nnoremap <leader>t :vsp <CR> <C-w>l :exec("tag ".expand("<cword>"))<CR> zz

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


"""" Deactivate to prevent interaction with anything, because I don't use it anyway
"
" Scala syntax for tagbar
" let g:tagbar_type_scala = {
" 		\ 'ctagstype' : 'Scala',
" 		\ 'kinds'     : [
" 			\ 'p:packages:1',
" 			\ 'V:values',
" 			\ 'v:variables',
" 			\ 'T:types',
" 			\ 't:traits',
" 			\ 'o:objects',
" 			\ 'a:aclasses',
" 			\ 'c:classes',
" 			\ 'r:cclasses',
" 			\ 'm:methods'
" 	\ ]
" \ }


" Attempt to cut myself from the ESC key.
imap <leader>k <ESC>
imap <leader>w <ESC>:w<CR>a
nmap <leader>w :w<CR>


""""""""" Ctrl-P global settings
" That will ignore files ignored by git
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

nmap <C-q> :CtrlPBuffer<CR>


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*~,*.pyc,*.a,*.class


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




" vimgrep key mapping
nnoremap <leader>fp :Grepper -tool rg<cr>
nnoremap <leader>fo :Grepper -tool rg -cword -noprompt<cr>
nnoremap <leader>fg :Grepper -tool git<cr>


" Localvimrc stuff
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 2



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete configuration  --  DEACTIVATED AS IT's fucking stopped working. YCM instead
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""" General configuration

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
 "let g:deoplete#omni#input_patterns = {}
endif
call g:deoplete#custom#option('camel_case', v:true)
call g:deoplete#custom#option('smart_case', v:true)
call g:deoplete#custom#option('enable_refresh_always', v:false)
" Little delay so that semshi is fast (https://github.com/numirias/semshi#semshi-is-slow-together-with-deopletenvim)
call g:deoplete#custom#option('auto_complete_delay', 100)



""""" Go
"let g:deoplete#sources#go#gocode_binary = '/home/yoann/work/go/bin/gocode-tamere'
"let g:deoplete#sources#go#builtin_objects = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" YCM is great, but slows down opening files. I don't really care about
" YCM when writing a git commit for instance, but I do care to have my
" vim operational in < 1 sec. So only enable YCM for the filetypes where
" it's really useful.
let g:ycm_filetype_whitelist = {
            \ 'cs': 1,
            \ 'python': 1,
            \ 'go': 1,
            \ 'c': 1
        \ }


  let g:ycm_semantic_triggers =  {
    \   'c': ['->', '.'],
    \   'objc': ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
    \            're!\[.*\]\s'],
    \   'ocaml': ['.', '#'],
    \   'cpp,cuda,objcpp': ['->', '.', '::'],
    \   'perl': ['->'],
    \   'php': ['->', '::'],
    \   'cs,d,elixir,go,groovy,java,javascript,julia,perl6,python,scala,typescript,vb': ['.'],
    \   'ruby,rust': ['.', '::'],
    \   'lua': ['.', ':'],
    \   'erlang': [':'],
    \ }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LanguageClient configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""" General configuration

let g:LanguageClient_serverCommands = {
    \ 'python': ['python', '-m', 'pyls', '-v', '--log-file', '/tmp/pyls.log'],
    \ 'cpp': ['clangd'],
    \ 'c': ['clangd'],
    \ 'bash': ['bash-language-server', 'start'],
    \ }


"let g:LanguageClient_loadSettings = 1
"let g:LanguageClient_settingsPath = '.vim/settings.json'

let g:LanguageClient_diagnosticsEnable = 0

nmap 'gd' :call LanguageClient_textDocument_definition()<CR>

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>



"""""" Python

" Don't forget to create those venvs and to install neovim inside,
" see (https://github.com/deoplete-plugins/deoplete-jedi#virtual-environments)
"
" NOTE: may need to install python-language-server[all] in the venv of the current
" project to get correct Python version and completion. So be it.

let g:python_host_prog = '/home/yoann/.vim/neovim-venv/venv/bin/python'
let g:python3_host_prog = '/home/yoann/.vim/neovim-venv/venv3.8/bin/python'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ALE configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""" General config

let g:ale_linters = {
    \ 'sh': ['shellcheck'],
    \ 'go': ['golangserver', 'gofmt'],
    \ 'cs': [''],
    \ }

""    \ 'cs': ['OmniSharp'],
" mcsc
"
"let g:ale_completion_enabled = 1


""""" Python

let g:ale_python_flake8_executable = 'python3'   " or 'python' for Python 2
let g:ale_python_flake8_options = '-m flake8'
" Don't set quickfix as this is done periodically and will erase the list
" set by a grep for instance
let g:ale_set_quickfix = 0
let g:ale_set_loclist = 1

" mypy will blow up on missing imports if it does not find
" typesheds, which is not always the case with uncomon packages
let g:ale_python_mypy_options = '--ignore-missing-imports'


""""" shellcheck for Bash

" deactivating:
"   - SC2086: quote to prevent word splitting
"   - SC2002: useless use of cat. I don't fucking care, it's just clearer
"     to cat a file, then filter it
let g:ale_sh_shellcheck_options = '-x -e SC2002'


""""" Go

let g:ale_go_gofmt_options = '-s'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""" delimitmate (auto close char insertion)
let g:delimitMate_expand_cr=2  " behave correctly when inserting a carriage return just after a { or (
let g:delimitMate_expand_space=2  " behave correctly when inserting a space just after a { or (


""""" indentLine: show indentation level with thin chars
let g:indentLine_char_list = ['|', '¦', '┆', '┊']



""""" Some magic to debug syntax highlight (https://vim.fandom.com/wiki/Identify_the_syntax_highlighting_group_used_at_the_cursor)
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>




" SuperTab complete in 'logical' order
"let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Auto update when external changes occur (from http://vim.wikia.com/wiki/Have_Vim_check_automatically_if_the_file_has_changed_externally)

" Normally it will ask you if you want to load the file, even if you haven't made
" any changes in vim. This can get annoying, however, if you frequently need to reload
" the file, so if you would rather have it to reload the buffer *without*
" prompting you, add a bang (!) after the command (WatchForChanges!).
" This will set the autoread option for that buffer in addition to setting up the
" autocommands.
"
" If you want to turn *off* watching for the buffer, just call the command again while
" in the same buffer. Each time you call the command it will toggle between on and off.
"
" WatchForChanges sets autocommands that are triggered while in *any* buffer.
" If you want vim to only check for changes to that buffer while editing the buffer
" that is being watched, use WatchForChangesWhileInThisBuffer instead.
"
command! -bang WatchForChanges                  :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0})
command! -bang WatchForChangesWhileInThisBuffer :call WatchForChanges(@%,  {'toggle': 1, 'autoread': <bang>0, 'while_in_this_buffer_only': 1})
command! -bang WatchForChangesAllFile           :call WatchForChanges('*', {'toggle': 1, 'autoread': <bang>0})

" WatchForChanges function
"
" This is used by the WatchForChanges* commands, but it can also be
" useful to call this from scripts. For example, if your script executes a
" long-running process, you can have your script run that long-running process
" in the background so that you can continue editing other files, redirects its
" output to a file, and open the file in another buffer that keeps reloading itself
" as more output from the long-running command becomes available.
"
" Arguments:
" * bufname: The name of the buffer/file to watch for changes.
"     Use '*' to watch all files.
" * options (optional): A Dict object with any of the following keys:
"   * autoread: If set to 1, causes autoread option to be turned on for the buffer in
"     addition to setting up the autocommands.
"   * toggle: If set to 1, causes this behavior to toggle between on and off.
"     Mostly useful for mappings and commands. In scripts, you probably want to
"     explicitly enable or disable it.
"   * disable: If set to 1, turns off this behavior (removes the autocommand group).
"   * while_in_this_buffer_only: If set to 0 (default), the events will be triggered no matter which
"     buffer you are editing. (Only the specified buffer will be checked for changes,
"     though, still.) If set to 1, the events will only be triggered while
"     editing the specified buffer.
"   * more_events: If set to 1 (the default), creates autocommands for the events
"     listed above. Set to 0 to not create autocommands for CursorMoved, CursorMovedI,
"     (Presumably, having too much going on for those events could slow things down,
"     since they are triggered so frequently...)
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end

  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0

  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end

  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"

  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')

  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec

      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end

  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end

  "echo msg
  let @"=reg_saved
endfunction

let autoreadargs={'autoread':1}
execute WatchForChanges("*", autoreadargs)
