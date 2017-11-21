" set default 'runtimepath' (without ~/.vim folders)
let &runtimepath = printf('%s/vimfiles,%s,%s/vimfiles/after', $VIM, $VIMRUNTIME, $VIM)

" what is the name of the directory containing this file?
let s:portable = expand('<sfile>:p:h')

" add the directory to 'runtimepath'
let &runtimepath = printf('%s,%s,%s/after', s:portable, &runtimepath, s:portable)

set nocompatible
filetype off

" Vundle
"-- PLUGINS {{{ ------------------------------------------------------
set rtp+=~/.vim/vundle/Vundle.vim
call vundle#begin('~/.vim/vundle/')

Plugin 'gmarik/Vundle.vim'

Plugin 'vim-scripts/autocomplpop'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rstacruz/sparkup'
Plugin 'vim-scripts/UltiSnips'
Plugin 'sheerun/vim-polyglot'
" Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'bling/vim-airline'
Plugin 'OmniCppComplete'
"Plugin 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'
"Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'moll/vim-bbye'
Plugin 'tpope/vim-surround'
Plugin 'Command-T'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'rhysd/vim-clang-format'
Plugin 'matchit.zip'
"Plugin 'Cpp11-Syntax-Support'
"Plugin 'bitc/vim-hdevtools'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Chiel92/vim-autoformat'
Plugin 'scrooloose/syntastic'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
Plugin 'Shougo/vimproc.vim'
"my fork of the solarized theme
"Plugin 'theNerd247/vim-colors-solarized'
call vundle#end()
"-- END PLUGINS }}} --------------------------------------------------

filetype plugin indent on  

" set map leader for custom key-maps
let mapleader = "," 

"-- CUSTOM FUNCTIONS {{{ ---------------------------------------------
function! EscapeString (string)
  let string=a:string
  " Escape regex characters
  let string = escape(string, '^$.*\/~[]')
  " Escape the line endings
  let string = substitute(string, '\n', '\\n', 'g')
  return string
endfunction

" Get the current visual block for search and replaces
" This function passed the visual block through a string escape function
" Based on this - http://stackoverflow.com/questions/676600/vim-replace-selected-text/677918#677918
function! GetVisual() range
  " Save the current register and clipboard
  let reg_save = getreg('"')
  let regtype_save = getregtype('"')
  let cb_save = &clipboard
  set clipboard&

  " Put the current visual selection in the " register
  normal! ""gvy
  let selection = getreg('"')

  " Put the saved registers and clipboards back
  call setreg('"', reg_save, regtype_save)
  let &clipboard = cb_save

  "Escape any special characters in the selection
  let escaped_selection = EscapeString(selection)

  return escaped_selection
endfunction
"-- END CUSTOM FUNCTIONS }}} -----------------------------------------

"-- CUSTOM MAPINGS {{{ -----------------------------------------------
" format the << to newlines
nmap <leader>f< f<illl
" format the , to newlines
nmap <leader>f, f,illl
" open the output from the compiler
nmap <leader>co :copen<cr><C-w><S-j>
" close the output from the compiler
nmap <leader>cc :cclose<cr>
" replace selected text
vmap <leader>s <Esc>:%s/<C-r>=GetVisual()<cr>/
" open the compiler output
nmap <leader>sc :copen<cr>
" automagically set the current build path using NERDTree
nmap <leader>nb cd:let $MAKEDIR=getcwd()<cr>Pcd
" manually set the current build path
nmap <leader>sb :let $MAKEDIR=getcwd()<cr>
" shows the buffers 
nmap <leader>bb :buffers<cr>
" open a newterminal
nmap <leader>nt :!urxvt -cd "`pwd`" &<cr>
" center current line on screen
nmap <space> zz
" run make
nmap <leader>m :make<cr>
" the highlighted text with braces
vmap <leader>b <esc>:'<,'>s/\%V\(\_.*\)\%V/{\r\1\r}/<cr>
" fix indenting of a file (see :help =)
nmap <leader>rf :Autoformat <cr>
" vertical split
nmap <leader>vs :vsp<CR>
" horizontal split
nmap <leader>hs :sp<CR>
" delete two spaces (used when tabs are converted into spaces)
" imap <C-S-K> <BS><BS> (use softtabs instead)
" edit filetype dependent commands
nnoremap <leader>ss :tabnew ~/.vim/after/ftplugin/ <cr>
" format paragraph
nnoremap <leader>fp gqap
"format line 
nnoremap <leader>fl gqas
" write the file 
nmap <leader>w :w<cr>
" edit the vimrc file
nmap <leader>se :tabnew ~/.vimrc<cr>
" shortcut to help screen in new tab
nmap <leader>hh :tab help 
"edit Ultisnips 
nmap <leader>su :tabnew ~/.vim/UltiSnips/ <cr>
" comment out the marked lines 'a,'b
"nmap <leader><S-C> 'a^O/*<ESC>:'a,'bs/^/ * /<cr>'b^o */<ESC>:nohlsearch<cr>
"comment out a single line
"nmap <leader>c :s/^/\/\//<cr>:nohlsearch<cr>
" uncomment marked lines 'a,'b
"nmap <leader>u<S-C> 'a-dd:'a,'bs/^ \* /<cr>'b+dd:nohlsearch<cr>
"uncomment a single line
"nmap <leader>uc :s/^\/\///<cr>:nohlsearch<cr>
" quit the file (by deleting the buffer)
nmap <leader>q :q<cr>
" unhighlight search results
"nmap <leader>/ :nohlsearch<cr>
" go to the tag of the word under the cursor
"nmap <leader>t :ptag <C-R><C-W><cr>
" tab management
nmap <leader>tn :tabnew<cr>
nmap <leader>td :tabclose<cr>
" create ctags for the given file
nmap <leader><S-T> :!ctags --options="$HOME/.ctagsrc" <cr>
" set up the look up option for a word (replaced by keywordprg setting)
"nmap <S-K> :!firefox https://duckduckgo.com/?q=<C-R><C-W> & <cr>
"insert tabs at the beginning of a line
nmap <leader><Tab> :s/^/\t/ <cr>:nohlsearch <cr>
"remove tabs at beginning of a line
nmap <leader>u<Tab> :s/\t// <cr>:nohlsearch <cr>
"replace all tabs with double spaces
nmap <leader>r :%s/\t/  /g
"insert braces for a new function (c style)
nmap <leader>b i}<ESC>O{<cr><Tab> 
"go to next tab
nmap <C-n> :tabn <cr>
" indent code block
nmap <leader>a :'a,'bs/^/\t/g <cr>
" unindent a code block
nmap <leader><S-A> :'a,'bs/^\t//g <cr>
" add copy/paste functions for clipboard
nmap <leader><S-P> :read !xclip -o <cr>
"inoremap <C-v> <esc>"+p
vmap <leader><S-Y> "+y
" buffer controls
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nmap <leader>bd :bd<cr>
"-- END CUSTOM MAPINGS }}} -------------------------------------------

"-- CUSTOM MACROS {{{ ------------------------------------------------
" format single line multiline c style comment to a multiline comment
let @f='0f*wif*iÂ€kbÂ€kb'
let @c=':vimgrep /^\(\(#\)\@!.\)*$/ %€kl€kl€kl€kl€kl€kl€kl€kl€kl€kl€kl€kl€kl'
"-- END CUSTOM MACROS }}} --------------------------------------------

"-- PLUGIN CONFIG {{{ -------------------------------------------------
" close the screen of nerdtree and tagbar
nmap <leader><SPACE> :NERDTreeClose<cr> :TagbarClose<cr> :cclose<cr>
" delimitMate mappings
" alias for <S-Tab>
imap <C-j> <S-Tab>
" show buffers and tabs in airline plugin
let g:airline#extensions#tabline#enabled = 1

"CommandT mappings
nnoremap <Leader>? :CommandTFlush<cr>:CommandT<cr>
nnoremap <leader>~ :CommandT
nnoremap <leader>tf :CommandTFlush<cr>
"nnoremap <silent> <Leader>b :CommandTBuffer<CR>

"nerdtree mappings 
nmap <leader>nn :NERDTreeToggle <cr>
nnoremap <leader>nf :NERDTreeFind<cr>

"easytags 
let g:easytags_auto_update=0

" tagbar mappings
nmap <leader>// :TagbarToggle <cr>
nmap <leader>/p :TagbarTogglePause <cr>

" recurse into directories for tags
let g:easytags_autorecurse = 0
" run easytags in the background
let g:easytags_async=1
let g:easytags_auto_update=0
" put our easytags file somewhere non intrusive
let g:easytags_file='~/.vim/tags'
" use the tags files that are project specific
set tags=.tags,./.tags,./tags,tags
let g:easytags_dynamic_files=2

" syntax formatter plugin
let g:formatdef_custom_style_c = '"astyle"'
let g:formatters_cpp = ['custom_style_c']
let g:formatters_c   = ['custom_style_c']
"let g:autoformat_verbose = 1

"syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"-- END PLUGIN CONFIG }}} ---------------------------------------------

"-- PRINTER {{{ ------------------------------------------------------
set printoptions=top:1in,bottom:1in,left:0.5in,right:0.5in
set printheader=" "
set pdev=BCMLaser
"-- END PRINTER }}} --------------------------------------------------

"-- MISC {{{ ---------------------------------------------------------
"omnicomplete options
set omnifunc=syntaxcomplete#Complete
set completeopt+=longest

" set the mode of mouse
set mouse=a

" I like syntax highlighting
syntax enable

" set custom colors
"use 16 colors
set t_Co=16 
"set this ONLY if you're using the solarized theme
let g:solarized_termcolors=16
set background=dark
colorscheme solarized

" show the commands as I type them
set showcmd

" don't wrap text by default
set nowrap

" allow for inline searching
set incsearch

" fold code by syntax
set foldmethod=syntax

" default tab size
set tabstop=2
" spaces to use for auto-indent
set shiftwidth=2
" number of spaces for a single tab
set softtabstop=2

" show lines numbers
set number

" set ctags path
set tags+=/usr/include/tags

" i don't like to scroll horizontally so much
set textwidth=80

" don't let the mouse interupt me typing
set mouse=

" turn off smart indenting
set si

" turn off spell check
set nospell

" set the program to use for the S-K mapping
set keywordprg=firefox

" set the number of lines to buffer the cursor with (above or below) when
" scrolling
set scrolloff=10

" set the make program
set makeprg=~/.vim/makeWrapper.sh

"-- END MISC }}} -----------------------------------------------------
