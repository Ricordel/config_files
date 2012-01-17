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
fun CleanText()
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
nnoremap <silent> <f8> :TlistToggle <CR>		
set statusline=%<%f%=%([%{Tlist_Get_Tagname_By_Line()}]%)		" Pour que le tag courant soit dans la barre de statut
let Tlist_Process_File_Always=1									" Pour que ce qui est au-dessus marche
let Tlist_Exit_OnlyWindow = 1					" Vim se ferme s'il ne reste qu el afenêtre des tags
let Tlist_Use_Right_Window = 1						" Affiche les tags sur le côté droit de l'écran




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
