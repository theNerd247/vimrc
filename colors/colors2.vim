"Vim color file
" Author: Noah Harvey <noah.harvey247@gmail.com>

hi clear
if("syntax_on")
	syntax reset
endif
let g:colors_name="colors2"
set background=dark

" Line Numbering / Folds / Status Lines
hi LineNr       ctermfg=white     ctermbg=none      cterm=none
hi NonText      ctermfg=white     ctermbg=none      cterm=none

hi Folded       ctermfg=grey     ctermbg=none      cterm=none
hi VertSplit    ctermfg=darkgrey  ctermbg=white     cterm=none
hi StatusLine   ctermfg=white     ctermbg=darkgrey  cterm=italic
hi StatusLineNC ctermfg=darkgrey 	ctermbg=white     cterm=none

" Messages / TODO
hi ModeMsg      ctermfg=white                       cterm=none
hi WarningMsg   ctermfg=black     ctermbg=yellow    cterm=none
hi ErrorMsg     ctermfg=white     ctermbg=red       cterm=none
hi Todo         ctermfg=white     ctermbg=none      cterm=bold

" Parenthesis / Underlined / Directories
hi MatchParen   ctermfg=black     ctermbg=grey      cterm=italic
hi Underlined   ctermfg=white     ctermbg=none      cterm=none
hi Directory    ctermfg=lightblue ctermbg=none      cterm=none

" Visual / Search
hi Visual       ctermfg=magenta   ctermbg=none      cterm=italic
hi IncSearch    ctermfg=black     ctermbg=lightgrey cterm=italic
hi Search       ctermfg=black     ctermbg=lightgrey cterm=italic

" Syntax 
hi Error        ctermfg=red       ctermbg=none      cterm=bold
hi Comment      ctermfg=lightblue ctermbg=none      cterm=italic
hi Identifier   ctermfg=white     ctermbg=none      cterm=none
hi Function     ctermfg=cyan     ctermbg=none      cterm=none
hi Statement    ctermfg=green     ctermbg=none      cterm=none
hi PreProc      ctermfg=lightblue ctermbg=none      cterm=none
hi Include      ctermfg=cyan      ctermbg=none      cterm=none
hi Define       ctermfg=cyan      ctermbg=none      cterm=none
hi Macro        ctermfg=cyan      ctermbg=none      cterm=none
hi PreCondit    ctermfg=lightgreen ctermbg=none     cterm=none
hi Type         ctermfg=lightgreen ctermbg=none     cterm=none
hi Constant     ctermfg=lightyellow ctermbg=none      cterm=none
hi Special      ctermfg=white     ctermbg=none      cterm=none
