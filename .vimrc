" Optimisations de base
set nocompatible                " Pas de compatibilité avec vi
set fileformat=unix		"Fichiers au format unix

set t_Co=256
syntax on

"Faire taire Vim
set vb

"pour la détection du type de fichier

set nocp										" Donné par un toto CPP
filetype on
filetype indent on
filetype plugin on

"Undo persistant : conserve l'historique même en cas de fermeture de fichier
set undofile

set nobackup                    " Pas de sauvegarde

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"Indentation et compagnie
set autoindent                  " Autoindentation
set smartindent
set tabstop=4                   " Taille des tabulations à 4
set softtabstop=4
set shiftwidth=4


" This damn cursor won't blink !
set guicursor=a:blinkon0


set mouse=a                     " Possibilité d'utiliser la souris
set foldmethod=marker           " Sauvegarder les plis
"set cursorline                  " Afficher la ligne courante du curseur
"hi  CursorLine term=NONE cterm=NONE ctermbg=7
set showcmd                     " Voir les demi commandes
set laststatus=2                " Ajoute une barre de status

set ruler			" Affiche constament la position du curseur

"Pour la recherche
set incsearch			"recherche pendant la frappe
set hlsearch			"highlight les résultats
set ignorecase			"ignore la casse

"Montrer les parenthèses soeurs
set showmatch

"Affiche les numéros de ligne
set number

"Activation des replis
"set foldenable
 
"Le mapleader, pour projet et comment
let mapleader=","

"Sauver automatiquement en changeant de buffer
set autowrite



"Colorations
colors yaude

"let python_highlight_all=1      " Syntaxe totale en python (done in ftplugin)

"Pour le PHP
"done dans ftplugin
"let php_sql_query=1             " Coloration des requetes SQL en php
"let php_htmlInStrings=1         " Coloration des balises html en php


" Une fonction pour transoformer les tabs en espaces, et convertir les
" fichiers Mac et DOS au format Unix
fun! CleanText()
	let curcol = col(".")
	let curline = line(".")
	exe ":retab"
	$//ge"xe ":%s/
	/ /ge"xe ":%s/
	exe ":%s/ \\+$//e"
	call cursor(curline, curcol)
endfun

"On la mappe sur F6
map <F6> :call CleanText()<CR>



function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
  else
        return "\<Tab>"
  endif
endfunction
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>


" Auto-completion
" Contrôle + Espace pour l'auto completion
imap <Nul> <C-x><C-o>
autocmd FileType html        set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css         set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript  set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType c           set omnifunc=ccomplete#Complete
autocmd FileType php         set omnifunc=phpcomplete#CompletePHP
"autocmd FileType ruby        set omnifunc=rubycomplete#Complete
"autocmd FileType sql         set omnifunc=sqlcomplete#Complete
autocmd FileType python      set omnifunc=pythoncomplete#Complete
"autocmd FileType xml         set omnifunc=xmlcomplete#CompleteTags
"set completeopt=menu,longest
"
"

au filetype cpp			imap <C-Space> <C-p>
" Pour gérer les tags C++
set tags+=~/.vim/tags/stl


"----------------- Pour le plugin NERDTree ---------------------------
let NERDTreeQuitOnOpen=1					" L'arbre se ferme lorsqu'on ouvre un fichier
"Ouvrir/Fermer le NERDTree en une touche
nnoremap <silent> <F9> :NERDTreeToggle ./<CR>



"----------------- Pour le plugin Taglist ----------------------------
"nnoremap <silent> <f8> :TlistToggle <CR>		
"set statusline=%<%f%=%([%{Tlist_Get_Tagname_By_Line()}]%)		" Pour que le tag courant soit dans la barre de statut
"let Tlist_Process_File_Always=1									" Pour que ce qui est au-dessus marche
"let Tlist_Exit_OnlyWindow = 1					" Vim se ferme s'il ne reste qu el afenêtre des tags
"let Tlist_Use_Right_Window = 1						" Affiche les tags sur le côté droit de l'écran

"---------------- Another try with tagbar instead. Tagbar cares of scopes,
"--- which is helpful
nmap <F8> :TagbarToggle<CR> 




" Créer les tags de mes projets persos avec F12
" map <C-F12> :!ctags -R -c++-linds=+p --fields=+iaS --extra=+q .<CR>
noremap <F12> :!ctags -R -c++-linds=+p --fields=+iaS --extra=+q .<CR>
inoremap <F12> <Esc>:!ctags -R -c++-linds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]


set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after



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


" Vim addon-manager, principalement pour vim-addon-sbt
fun! SetupVAM()
          " YES, you can customize this vam_install_path path and everything still works!
          let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
          exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'

          " * unix based os users may want to use this code checking out VAM
          " * windows users want to use http://mawercer.de/~marc/vam/index.php
          " to fetch VAM, VAM-known-repositories and the listed plugins
          " without having to install curl, unzip, git tool chain first
          " -> BUG [4] (git-less installation)
          if !filereadable(vam_install_path.'/vim-addon-manager/.git/config') && 1 == confirm("git clone VAM into ".vam_install_path."?","&Y\n&N")
            " I'm sorry having to add this reminder. Eventually it'll pay off.
            call confirm("Remind yourself that most plugins ship with documentation (README*, doc/*.txt). Its your first source of knowledge. If you can't find the info you're looking for in reasonable time ask maintainers to improve documentation")
            exec '!p='.shellescape(vam_install_path).'; mkdir -p "$p" && cd "$p" && git clone --depth 1 git://github.com/MarcWeber/vim-addon-manager.git'
            " VAM run helptags automatically if you install or update plugins
            exec 'helptags '.fnameescape(vam_install_path.'/vim-addon-manager/doc')
          endif

          " Example drop git sources unless git is in PATH. Same plugins can
          " be installed form www.vim.org. Lookup MergeSources to get more control
          " let g:vim_addon_manager['drop_git_sources'] = !executable('git')

          call vam#ActivateAddons([], {'auto_install' : 0})
          " sample: call vam#ActivateAddons(['pluginA','pluginB', ...], {'auto_install' : 0})
          " - look up source from pool (<c-x><c-p> complete plugin names):
          " ActivateAddons(["foo", ..
          " - name rewritings:
          " ..ActivateAddons(["github:foo", .. => github://foo/vim-addon-foo
          " ..ActivateAddons(["github:user/repo", .. => github://user/repo
          " Also see section "2.2. names of addons and addon sources" in VAM's documentation
        endfun
		call SetupVAM()
        " experimental: run after gui has been started (gvim) [3]
        " option1: au VimEnter * call SetupVAM()
        " option2: au GUIEnter * call SetupVAM()
        " See BUGS sections below [*]
        " Vim 7.0 users see BUGS section [3]
		
" Vu juste au-dessus !
set rtp+=PATH-TO-VAM

au GUIEnter * call SetupVAM()


 call vam#ActivateAddons(['ensime', 'tlib', 'vim-addon-actions', 'vim-addon-async', 'vim-addon-completion', 'vim-addon-json-encoding', 'vim-addon-mw-utils', 'vim-addon-sbt', 'vim-addon-signs'], {'auto_install' : 0})


" NeocompleteCache, une autocomplétion qu'elle est mieux
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 4
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'


" How to tell it that is should look at scala STL ?
