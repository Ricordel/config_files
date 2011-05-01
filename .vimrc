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


set nobackup                    " Pas de sauvegarde

"allow backspacing over everything in insert mode
set backspace=indent,eol,start

"Indentation et compagnie
set autoindent                  " Autoindentation
set smartindent
set tabstop=8                   " Taille des tabulations à 8
set softtabstop=8
set shiftwidth=8


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
" Trouvé sur Vim-fr.org : plein de map pour les différents formats de fichier

" Fonctions pour fichiers XML
"au BufEnter *.xml      exe Fxml()

" Fonctions pour fichiers SPIP
"au BufEnter *.spip     exe Fspip()

" Fonctions pour fichiers HTML
"au BufEnter *.html      exe Fhtml()
"au BufEnter *.htm	exe Fhtml()
"au BufEnter *.php	exe Fhtml()

" Fonctions pour Javascript
"au BufEnter *.js exe Fjs()

" Fonctions pour fichiers CSS
"au BufEnter *.css	exe Fcss()

" TXT en 72 de large
" Prévoir fonction...
au BufEnter,BufNewFile *.txt set tw=72
 
function! Flatex() 
	" Codages des caractères ISO-8859-1
	set fileencoding=iso-8859-1

	" Types de fichiers à ignorer
	set wildignore=*.dvi,*.ps,*.toc,*.log,*.pdf,*.aux

	" Dossier du fichier comme dossier de travail de gVim
	" Je ne le fais pas avec Vim mode texte.
	" Et je ne sais pas vraiment pourquoi...
	if has("gui_running")
		set acd
	endif

	" 4 espaces me suffisent en LaTeX pour les tabulations ou indentations
	set ts=4
	set sw=4

	" Largeur de texte standard
	set tw=72

	" Modèles
	map ,mod :0r ~/.latex/modele.tex<CR>
	map ,ex :0r ~/.latex/ex.tex<CR>
	map ,pre :0r ~/.latex/presentation.tex<CR>

	" Lancement Xfig
	map <F3> :!LANG=fr_FR.iso-8859-1 xfig &<CR><CR>
	imap <F3> <ESC>:!LANG=fr_FR.iso-8859-1 xfig &<CR><CR>

	" Lancement Inkscape
	map <F3>i :!inkscape &<CR><CR>
	imap <F3>i <ESC>:!inkscape &<CR><CR>

	" Sauvegarde et compilation PDFLaTeX (-> PDF)
	map <F4> <ESC>:w<CR>:!pdflatex %<.tex<CR><CR>
	imap <F4> <ESC>:w<CR>:!pdflatex %<.tex<CR>a

	" Sauvegarde et compilation LaTeX (-> DVI)
	set <S-F4>=�[1;2S
	map <S-F4> <ESC>:w<CR>:!latex %<.tex<CR><CR>
	imap <S-F4> <ESC>:w<CR>:!latex %<.tex<CR>a

	" Visualisation PDF
	map <F5> :!xpdf %<.pdf &<CR>
	imap <F5> <ESC>:!xpdf %<.pdf &<CR>
	
	" Visualisaton DVI
	map <S-F5> :!xdvi %<.dvi &<CR><CR>
	imap <S-F5> <ESC>:!xdvi %<.dvi &<CR><CR>a

	" Conversion vers Postscript
	map <F7> :!dvips %<.dvi -o %<.ps <CR><CR>
	imap <F7> <ESC>:!dvips %<.dvi -o %<.ps <CR>

	" Visualisation Postscript
	map <F8> :!gv %<.ps &<CR><CR>
	imap <F8> <ESC>:!gv %<.ps &<CR><CR>

	" Réduction A4 vers double-A5
	map <S-F7> :!psnup -2 %<.ps %<-miformat.ps<CR>

	" Visualisation double-A5
	map <S-F8> :!gv %<-miformat.ps &<CR><CR>

	" Impression demi PDF
	map <F9> :!lpr -o number-up=2 %<.pdf

	" Make PDF
	map <F10> :!make pdf<CR>
	imap <F10> <ESC>:!make pdf<CR>

	" Nettoyage des fichiers
	map ,cln :!rm -f %<.aux %<.dvi %<.log %<.out %<.ps %<.toc %<-miformat.ps <CR>
	imap ,cln :!rm %<.aux %<.dvi %<.log %<.out %<.ps %<.toc %<-miformat.ps <CR>

	" TeX, LaTeX
	imap ,tex \TeX{}
	imap ,la \LaTeX{}

	" Euro
	imap ,eu \euro{}

	" Insertion fraction
	imap ,fr \dfrac{}{}<ESC>2hi
	imap ,tfr \tfrac{}{}<ESC>2hi

	" Taille math standard
	imap ,dst \displaystyle{}<ESC>i
	vmap ,dst s\displaystyle{<ESC>pa}

	" Insertion d'une figure
	imap ,igr \includegraphics{}<ESC>i
	vmap ,igr s\includegraphics{<ESC>pa}
 
	imap ,ppr \parpic[r]{\includegraphics{}}<ESC>hi
	imap ,ppl \parpic[l]{\includegraphics{}}<ESC>hi
 
	vmap ,ppr s\parpic[r]{\includegraphics{<ESC>pa}}
	vmap ,ppl s\parpic[l]{\includegraphics{<ESC>pa}}
 
	imap ,fig \begin{figure}<CR>\end{figure}<ESC>O
	vmap ,fig S\begin{figure}<CR>\end{figure}<ESC>P
 
	imap ,wf \begin{wrapfigure}{}{}<CR>\end{wrapfigure}<ESC>O\includegraphics{}<ESC>i
	"""""vmap ,wf S\begin{wrapfigure}{}{}<CR>\end{wrapfigure}<ESC>\includegraphics{}P
	
	" Table des matières
	imap ,toc \tableofcontents

	" (Sous-(sous-)Section numérotée
	imap ,s \section{}<ESC>i
	imap ,ss \subsection{}<ESC>i
	imap ,sss \subsubsection{}<ESC>i
	vmap ,s s\section{<ESC>pa}
	vmap ,ss s\subsection{<ESC>pa}
	vmap ,sss s\subsubsection{<ESC>pa}

	" (Sous-)Section non-numérotée
	imap ,s* \section*{}<ESC>i
	imap ,ss* \subsection*{}<ESC>i
	imap ,sss* \subsubsection*{}<ESC>i
	vmap ,s* s\section*{<ESC>pa}
	vmap ,ss* s\subsection*{<ESC>pa}
	vmap ,sss* s\subsubsection*{<ESC>pa}

	" Présentations LaTeX-Beamer
	imap ,un \uncover<><ESC>i
	imap ,on \only<><ESC>i
	imap ,fm \begin{frame}<CR>\end{frame}<ESC>O
 
	imap ,ft \frametitle{}<ESC>i
	imap ,al \alert{}<ESC>i
	
	" Marques de modifications
	imap ,chb \begin{changebar}<CR>\end{changebar}<ESC>O
	vmap ,chb S\begin{changebar}<CR>\end{changebar}<ESC>P
	
	" Environnement quelconque
	imap ,env \begin{ENV}<CR>\end{ENV}<ESC>O
	vmap ,env S\begin{ENV}<CR>\end{ENV}<ESC>P

	" Retour ou saut de ligne
	imap ,cr \\ <CR>

	" Retour à la ligne justifié
	imap ,lb \linebreak 

	" Retour à la ligne simple
	imap ,nl \newline

	" Saut de page
	imap ,pb \pagebreak

	" Changement de colonne
	imap ,cb \columnbreak
	
	" Gros saut de ligne
	imap ,bs <CR>\bigskip<CR>
	
	" Ligatures
	imap ,oe \oe{}
	
	" Mode maths en ligne
	imap ,$ $$<ESC>i
	vmap ,$ s$<ESC>pa$

	" Mode maths centré
	imap ,$$ \[<CR>\]<ESC>O
	vmap ,$$ S\[<CR>\]<ESC>P

	" Texte normal en mode maths
	imap ,rm \textrm{}<ESC>i
	
	" Racine carrée
	imap ,rc \sqrt{}<ESC>i
	vmap ,rc s\sqrt{<ESC>pa}

	" Pi
	imap ,pi \pi
	imap ,Pi \Pi

	" Angles et trigo
	imap ,wh \widehat{}<ESC>i
	imap _c \cos
	imap _s \sin
	imap _t \tan

	" Flèche fonction 
	imap ,lm \longmapsto<ESC>a

	" Signe multiplié
	imap ,* \times
	
	" Signé divisé
	imap ,/ \div
	
	" Centrage
	imap ,c \begin{center}<CR>\end{center}<ESC>O
	vmap ,c S\begin{center}<CR>\end{center}<ESC>P

	" Frame
	imap ,frm \frame<CR>}<ESC>O
	vmap ,frm S\frame{<CR>}<ESC>P
	
	" Minipage
	imap ,mp \begin{minipage}[t]{}<CR>\end{minipage}<ESC>O
	vmap ,mp S\begin{minipage}[t]{}<CR>\end{minipage}<ESC>P
	
	" Double-colonnage
	imap ,dc \begin{multicols}{2}<CR>\end{multicols}<ESC>O
	vmap ,dc S\begin{multicols}{2}<CR>\end{multicols}<ESC>P
	
	" Caractères machine à écrire
	imap ,tt \texttt{}<ESC>i
	vmap ,tt s\texttt{<ESC>pa}

	" Caractères gras
	imap ,bf \textbf{}<ESC>i
	vmap ,bf s\textbf{}<ESC>Pi

	" Paragraphe
	imap ,pa \paragraph{}<ESC>i
	vmap ,pa s\paragraph{}<ESC>Pi

 
	" Soulignement
	imap ,_ \underline{}<ESC>i
	vmap ,_ s\underline{<ESC>pa}
	
	" Ligne supérieure
	imap ,ol \overline{}<ESC>i
	vmap ,ol s\overline{<ESC>pa}
	
	" Caractères penchés
	imap ,sl \textsl{}<ESC>i
	vmap ,sl s\textsl{<ESC>pa}
 
	imap ,sls {\slshape<CR>}<ESC>O
	vmap ,sls S{\slshape<CR>}<ESC>P
	
	" Caractères italiques
	imap ,i \textit{}<ESC>i
	vmap ,i s\textit{<ESC>pa}
 
	imap ,is {\itshape<CR>}<ESC>O
	vmap ,is S{\itshape<CR>}<ESC>P
	
	" Petites capitales
	imap ,sc \textsc{}<ESC>i
	vmap ,sc s\textsc{<ESC>pa}
	
	" Caligraphiques math
	imap ,mc \mathscr{}<ESC>i
	vmap ,mc s\mathscr{<ESC>pa}

	" Ensembles math
	imap ,mb \mathbb{}<ESC>i
	vmap ,mb s\mathbb{<ESC>pa}

	" Ensembles
	imap ,bb \mathbb{}<ESC>i
	vmap ,bb s\mathbb{<ESC>pa}
	
	" Verbatim
	imap ,vb+ \verb++<ESC>i
	vmap ,vb+ s\verb+<ESC>pa+
 
	imap ,vbt \begin{verbatim}<CR>\end{verbatim}<ESC>O
	vmap ,vbt S\begin{verbatim}<CR>\end{verbatim}<ESC>P
		
	" Vecteur
	imap ,v \overrightarrow{}<ESC>i
	vmap ,v s\overrightarrow{<ESC>pa}

	" Logarithmes, exponentielles
	imap ,ln \ln{}<ESC>i
	imap ,exp \exp{}<ESC>i
 
	vmap ,ln s\ln{<ESC>pa}
	vmap ,exp s\exp{<ESC>pa}

	" Infini
	imap ,inf \infty{}

	" Fantôme
	imap ,ph \phantom{}<ESC>i
	vmap ,ph s\phantom{<ESC>pa}

	" Insertion tableau
	imap ,tab \begin{tabular}[t]{}<CR>\end{tabular}<ESC>k$i
	imap ,tabc \begin{tabular}[c]{}<CR>\end{tabular}<ESC>k$i
	imap ,hl \hline
 
	imap ,ar \begin{array}[t]{rcl}<CR>\end{array}<ESC>O
	imap ,eqn \begin{eqnarray*}<CR>\end{eqnarray*}<ESC>O
 
	imap ,sy \left\lbrace{}<CR>\begin{array}{rcl}<CR>\end{array}\right.<ESC>O
 
	vmap ,tab S\begin{tabular}[t]{}<CR>\end{tabular}<ESC>P

	" = en tableau math
	imap ,& &<SPACE>=<SPACE>&<SPACE>
	imap ,ou &<SPACE>\textrm{ ou }<SPACE>&<SPACE>

	" Interligne tableaux
	imap ,ast \renewcommand{\arraystretch}{1.8}

	" Accolades systèmes
	imap ,{ \left\lbrace{}
	imap ,. \right.
	
	" Liste
	imap ,ite \begin{itemize}<CR>\end{itemize}<ESC>O\item<SPACE>
	vmap ,ite S\begin{itemize}<CR>\end{itemize}<ESC>P
 
	imap ,it \item
	
	" Enumeration
	imap ,en \begin{enumerate}[1°)]<CR>\end{enumerate}<ESC>O\item<SPACE>
	vmap ,en S\begin{enumerate}[1°)]<CR>\end{enumerate}<ESC>P
	
	" Description
	imap ,des \begin{description}<CR>\end{description}<ESC>O\item[]<ESC>i
	imap ,itd \item[]<ESC>i
	
	" Au fer à droite
	imap ,r \begin{flushright}<CR>\end{flushright}<ESC>O
	vmap ,r S\begin{flushright}<CR>\end{flushright}<ESC>P
	
	" Au fer à gauche
	imap ,l \begin{flushleft}<CR>\end{flushleft}<ESC>O
	vmap ,l S\begin{flushleft}<CR>\end{flushleft}<ESC>P

	" Alinéa
	imap ,ind \indent{}

	" Pas d'alinéa
	imap ,noi \noindent{}

	" Largeur de texte
	imap ,tw \textwidth

	" Espaces supplémentaires
	imap ,, \,
	imap ,; \;
	imap ,q \quad
	imap ,qq \qquad

	" Espacement horizontal ou vertical
	imap ,hs \hspace{}<ESC>i
	imap ,vs \vspace{}<ESC>i

	" Remplissage horizontal ou vertical
	imap ,hf \hfill
	imap ,vf \vfill
	
 
	" Parenthèses
	imap ,( \left(
	imap ,) \right)
	imap ,() \left(   \right)<ESC>8hi

	" Crochets
	imap ,[ \left[
	imap ,] \right]
	imap ,dcr \left[   \right]<ESC>8hi
	
 
	" Rien à droite
	imap ,. \right.

	" Environ égal
	imap ,= \simeq

	" Différent
	imap ,n= \not=
	
	" Inégalités
	imap ,< \leqslant{}
	imap ,> \geqslant{}

	" Équivalences
	imap ,eq \Longleftrightarrow{}

	" Nombres barrés
	imap ,ca \cancel{}<ESC>i
	vmap ,ca s\cancel{}<ESC>Pa

	" Boîtes
	imap ,fb \fbox{}<ESC>i
	vmap ,fb c\fbox{}<ESC>PA

	" Numéros
	imap ,no \no{}<ESC>i
	imap ,No \No{}<ESC>i
	imap ,e \ieme{}<ESC>i
	imap ,er 1\ier{}

	" Renvois
	imap ,fn \,\footnote{}<ESC>i

	" Liens
	imap ,url \url{}<ESC>i
	imap ,hr \href{}{}<ESC>2hi
 
	vmap ,url s\url{<ESC>pa}
	vmap ,hr s\href{<ESC>pa}{}
 
endfunction
 
function! Fhtml()
	" Dossier du fichier comme dossier de travail de Vim
	set acd
	" Pour Vim < 7.0
	"map ,cwd :cd %:h

	" Codages des caractères utf-8
	"set encoding=iso-8859-1
	set fileencoding=utf-8
	
	" Modèles
	map ,mod :r ~/site/statique/modele.html<CR>ggdd
	
	" 4 espaces pour les tabulations suffisent en HTML
	set ts=4
	set sw=4
	
	" Pas de retour à la ligne
	set tw=0

	" Insertion de saut à la ligne
	imap ,br <CR><br><CR>
	
	" Headers 1, 2, 3 et 4
	imap ,h1 <h1></h1><ESC>4hi
	vmap ,h1 s<h1><ESC>pa</h1>
 
	imap ,h2 <h2></h2><ESC>4hi
	vmap ,h2 s<h2><ESC>pa</h2>
 
	imap ,h3 <h3></h3><ESC>4hi
	vmap ,h3 s<h3><ESC>pa</h3>
 
	imap ,h4 <h4></h4><ESC>4hi
	vmap ,h4 s<h4><ESC>pa</h4>

	" Environnement div quelconque
	imap ,div <div class=""><CR></div><ESC>?"<CR>i
	vmap ,div di<div class=""><CR></div><ESC>P

	" Paragraphe
	imap ,p <p><CR></p><ESC>O
	vmap ,p S<p><CR></p><ESC>P

	" strong
	imap ,st<strong></strong><ESC>8hi
	vmap ,st s<strong><ESC>pa</strong> 

	" Italique
	imap ,em <em></em><ESC>4hi
	vmap ,em s<em><ESC>pa</em>

	" Image
	imap ,img <img src="" alt=""><ESC>19hi
	vmap ,img s<img src="" alt=""><ESC>19hPa

	" Liens
	imap ,lnk <a href=""></a><ESC>5hi
	vmap ,lnk s<a href="<ESC>pa"><ESC>pa</a>
 
	imap ,eml <a href="mailto:?Subject="></a><ESC>3hi
	vmap ,eml <a href="mailto:?Subject="><ESC>pa</a>
	
	" Étiquettes (liens internes)
	imap ,lnh <a href="#"></a><ESC>5hi
	imap ,lnn <a name=""></a><ESC>5hi
	vmap ,lnn s<a name="<ESC>pa"><ESC>pa</a>
	
	" Commentaire
	imap ,com <!--<CR>--><ESC>kA
	vmap ,com S<!--<CR>--><ESC>P
	
	
	" Visualisation du fichier courant dans Mozilla
	" Attention : Mozilla exige le chemin absolu complet
	" map <F5> :w<CR>:!mozilla %:p &<CR>
	" imap <F5> <ESC>:w<CR>:!mozilla %:p &<CR>
	
	" Modification du fichier courant dans Mozilla
	" Attention : Mozilla exige le chemin absolu complet
	" map <S-F5> :w<CR>:!mozilla -editor %:p &<CR>
	" imap <S-F5> <ESC>:w<CR>:!mozilla -editor %:p &<CR>

	" Tableau
	imap ,tab <table><CR></table><ESC>O
	vmap ,tab s<table><CR></table><ESC>P
 
	imap ,tr <tr><cr></tr><ESC>O
	vmap ,tr S<tr><CR></tr><ESC>P
 
	imap ,td <td><cr></td><ESC>O
	vmap ,td S<td><CR></td><ESC>P
	
"	imap ,td <td></td><ESC>4hi
"	vmap ,td s<td><ESC>pa</td>

	" Liste (sans numérotation)
	imap ,ul <ul><CR></ul><ESC>O
	vmap ,ul s<ul><CR></ul><ESC>P

	" Liste (avec numérotation)
	imap ,ol <ol><CR></ol><ESC>O
	vmap ,ol s<ol><CR></ol><ESC>P

	" Élément de liste
	imap ,li <li><CR></li><ESC>O
	vmap ,li s<li><CR></li><ESC>P

	"Liste descriptive
	"environnement
	"imap ,dl <dl><CR></dl><ESC>O
	"vmap ,dl s<dl><CR></dl><ESC>P

	"élément
	"imap ,dt <dt><CR></dt><ESC>O
	"vmap ,dt s<dt><CR></dt><ESC>P

	"description
	"imap ,dd <dd><CR></dd><ESC>O
	"vmap ,dd s<dd><CR></dd><ESC>P


	" Formulaire
	imap ,frm <form><CR></form><ESC>O

	" Champ de texte
	imap ,chp <form><CR></form><ESC>O<input type="text"  value="valeur">
	

	" Insertion d'un script Javascript
	imap ,js <script type="text/javascript"><CR></script><ESC>O

	" Boîte de message
	imap ,al alert('Alerte quelconque');
 
endfunction
 
function! Fjs()
	" Tout de Fhtml...
	exe Fhtml()

	" ... sauf les commentaires !
	vmap ,com S/*<CR>*/<ESC>P
 
endfunction
 
function! Fxml()
	set sw=2
	set ts=2
	" Commentaires
	imap ,com <!-- --><ESC>hi
	vmap ,com S<!--<CR>--><ESC>P
 
endfunction
 
function! Fcss()
	" Tabulations réduites à 2
	set ts=2
	set sw=2

	" Commentaires
	imap ,com /**/<ESC>hi
	vmap ,com s/*<CR>*/<ESC>P
 
endfunction


" Fonctions pour latexsuite
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after



