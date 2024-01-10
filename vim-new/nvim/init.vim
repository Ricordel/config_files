lua require('plugins')
lua require('diagnostics')
lua <<EOF
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
  },
  current_line_blame_formatter_opts = {
    relative_time = false
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
EOF



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
" triggering the help every time I mistype ESC is a bit annoying
nnoremap <F1> <nop>
inoremap <F1> <nop>
vnoremap <F1> <nop>

set textwidth=999	" I don't want it limited if not in some precise language

set vb " Visual bell, no way vim can make noise !
set number " line numbers

set autowrite " Automatically save current buffer when switching buffers (bn, bp, ...)

let mapleader="," " The leader, ',' is cool on azerty keyboards

set backspace=indent,eol,start "allow backspacing over everything in insert mode
set showcmd " show partial commands in status line
set ruler   " Affiche constament la position du curseur
set laststatus=2 " tells when last window has status lines

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


" XXX fix for neovim and terminator
set guicursor=
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
let $VTE_VERSION="100"
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
map <s-F10> :set nopaste<CR>

autocmd FileType json          set conceallevel=0


" Attempt to cut myself from the ESC key.
imap <leader>k <ESC>
imap <leader>w <ESC>:w<CR>a
nmap <leader>w :w<CR>



"" Telescope configuration

""""" Misc
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <M-p> :Telescope buffers<CR>
nnoremap <leader>jl :Telescope jumplist<CR>
nnoremap <leader>fp :Telescope live_grep<CR>
nnoremap <leader>fo :Telescope grep_string<CR>

""""" Code navigation
nnoremap <leader>fu :Telescope lsp_references<CR>
nnoremap gd :Telescope lsp_definitions<CR>
nnoremap <leader>gt :Telescope lsp_type_definitions<CR>
nnoremap <leader>ss :Telescope lsp_document_symbols<CR>
nnoremap <leader>fs :Telescope lsp_dynamic_workspace_symbols<CR>


nnoremap <F2> :lua vim.lsp.buf.rename()<CR>
"nnoremap <leader>dn :lua vim.lsp.diagnostic.goto_next()<CR>
"nnoremap <leader>dN :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <leader>dh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>dd :Telescope diagnostics<CR>
nnoremap <leader><space> :Telescope lsp_code_actions<CR>
nnoremap <leader>xd :%Telescope lsp_range_code_actions<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better recognize file types
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"				Some plugins options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree
let NERDTreeQuitOnOpen=1 " Quit tree window when opening a file
" Toggle nerdTree window with F9
nnoremap <silent> <F8> :NERDTreeMirror<CR>:NERDTreeToggle<CR>
let NERDTreeIgnore=['\.class$', '\.o$', '\.pyc$', '\~$']
let NERDTreeWinSize=60


set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*~,*.pyc,*.a,*.class


" Localvimrc stuff
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 2



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
