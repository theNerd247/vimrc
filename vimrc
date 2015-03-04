set nocompatible
filetype off

" Vundle
set rtp+=~/.vim/vundle/Vundle.vim
call vundle#begin('~/.vim/vundle/')

Plugin 'gmarik/Vundle.vim'

"-- PLUGINS {{{ ------------------------------------------------------
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
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'moll/vim-bbye'
Plugin 'tpope/vim-surround'
Plugin 'Command-T'
Plugin 'octol/vim-cpp-enhanced-highlight'
"-- END PLUGINS }}} --------------------------------------------------

call vundle#end()
filetype plugin indent on  

" set map leader for custom key-maps
let mapleader = "," 

"-- CUSTOM MAPINGS {{{ -----------------------------------------------
" the highlighted text with braces
vmap <leader>b <esc>:'<,'>s/\%V\(\_.*\)\%V/{\r\1\r}/<cr>
" fix indenting of a file (see :help =)
nmap <leader>rf gg=G
" vertical split
nmap <leader>vs :vsp<CR>
" horizontal split
nmap <leader>hs :sp<CR>
" delete two spaces (used when tabs are converted into spaces)
imap <C-S-K> <BS><BS>
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
nmap <leader>su :tabnew ~/.vim/vundle/UltiSnips/UltiSnips/ <cr>
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
nmap <leader><S-P> "+p
inoremap <C-v> <esc>"+p
vmap <leader><S-Y> "+y
" buffer controls
nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nmap <leader>bd :bd<cr>
"-- END CUSTOM MAPINGS }}} -------------------------------------------

"-- CUSTOM MACROS {{{ ------------------------------------------------
" format single line multiline c style comment to a multiline comment
let @f='0f*wif*i€kb€kb'
"-- END CUSTOM MACROS }}} --------------------------------------------

"-- PLUGIN CONFIG {{{ -------------------------------------------------
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

" tagbar mappings
nmap <leader>/ :TagbarToggle <cr>

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

" I like colors
syntax enable

" set custom colors
colorscheme default
set background=dark "if set to monokai then comment this out

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
set expandtab

" show lines numbers
set number

" set ctags path
set tags+=/usr/include/tags

" i don't like to scroll left so much
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
"-- END MISC }}} -----------------------------------------------------
