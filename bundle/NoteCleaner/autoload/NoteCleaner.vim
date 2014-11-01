function! NoteCleaner#Notecleaner()

call inputsave() 
let s:name = input('Enter path for new note: ')
call inputrestore()
:new s:name
let mapleader=','
noremap <buffer> <leader>q :w<cr>:!NoteCleaner name<cr>:q<cr> 

endfunction
