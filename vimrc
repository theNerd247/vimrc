set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/vundle/Vundle.vim
call vundle#begin('~/.vim/vundle/')

Plugin 'gmarik/Vundle.vim'

"--INSTALLED PLUGINS ---------------------------------
Plugin 'vim-scripts/autocomplpop'
Plugin 'scrooloose/nerdtree'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rstacruz/sparkup'
Plugin 'vim-scripts/UltiSnips'
Plugin 'sheerun/vim-polyglot'
Plugin 'xolox/vim-easytags'
Plugin 'xolox/vim-misc'
Plugin 'bling/vim-airline'
Plugin 'OmniCppComplete'
Plugin 'vim-scripts/LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'scrooloose/syntastic'
Plugin 'majutsuchi/tagbar'
Plugin 'tpope/vim-fugitive'
"-- END INSTALLED PLUGINS --------------------------

call vundle#end()
filetype plugin indent on  

"--CUSTOM KEY MAPPINGS------------------------------
" set map leader for custom key-maps
let mapleader = "," 

" write the file 
nmap <leader>w :w<cr>
" edit the vimrc file
nmap <leader>s :split ~/.vimrc<cr>
"edit Ultisnips 
nmap <leader>su :split ~/.vim/vundle/UltiSnips/UltiSnips/ <cr>
" comment out the marked lines 'a,'b
"nmap <leader><S-C> 'a^O/*<ESC>:'a,'bs/^/ * /<cr>'b^o */<ESC>:nohlsearch<cr>
"comment out a single line
"nmap <leader>c :s/^/\/\//<cr>:nohlsearch<cr>
" uncomment marked lines 'a,'b
"nmap <leader>u<S-C> 'a-dd:'a,'bs/^ \* /<cr>'b+dd:nohlsearch<cr>
"uncomment a single line
"nmap <leader>uc :s/^\/\///<cr>:nohlsearch<cr>
" quit the file
nmap <leader>q :q<cr>
" unhighlight search results
"nmap <leader>/ :nohlsearch<cr>
" go to the tag of the word under the cursor
nmap <leader>t :ptag <C-R><C-W><cr>
" create ctags for the given file
nmap <leader><S-T> :!ctags --options="$HOME/.ctagsrc" <cr>
" set up the look up option for a word
nmap <S-K> :!firefox https://duckduckgo.com/?q=<C-R><C-W> & <cr>
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
vmap <leader><S-P> "+p
vmap <leader><S-Y> "+y
" open nerdtree
nmap <leader>n :NERDTree <cr>
" open tagbar
nmap <leader>/ :TagbarToggle <cr>
" buffer controls
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nmap <leader>bd :bd<cr>
" --END CUSTOM MAPPINGS----------------------------

" for the pathogen plugin 
"call pathogen#infect()
"call pathogen#helptags()

" Vimrc autoloading the vimrc file
"autocmd! bufwritepost ~/.vimrc source ~/.vimrc

let g:airline#extensions#tabline#enabled = 1

"omnicomplete options
set omnifunc=syntaxcomplete#Complete
set completeopt+=longest

" set the mode of mouse
set mouse=a

" I like colors
syntax enable

" set custom colors
colorscheme monokai

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
set shiftwidth=2

" show tab
set number

" I like to use a dark background 
"set background=dark

" set ctags path
set tags+=/usr/include/tags

" i don't like to scroll left so much
set textwidth=80

" don't let the mouse interupt me typing
set mouse=

" turn off smart indenting
set si

" printing options
set printoptions=top:1in,bottom:1in,left:0.5in,right:0.5in
set printheader=" "
set pdev = "BCMLaser"

set nospell
