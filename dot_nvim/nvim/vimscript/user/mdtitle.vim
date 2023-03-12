"  mdtitle.vim
"
"  To show the titles of markdone file, you can jump between titles
"
"  Copyright (Vimscript) Jie
"  2022-12-13
" 

if &ft == "markdown" || &ft == "md"
    nnoremap <LEADER>ft :call Mdtitle()<CR>:copen<CR>
    function! Mdtitle() abort
        vimgrep /^\#\+/ %
    endfunction
endif
