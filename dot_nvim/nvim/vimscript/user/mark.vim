"  mark.vim
"
"  Visually select the content and add '<mark>   </mark>' around them
"
"  Copyright (Vimscript) Jie
"  2022-12-12
" 
vnoremap <LEADER>mm :call MarkSelect()<CR>

if (&filetype == "markdown") || (&filetype == "md")
    vnoremap <LEADER>mm :call MarkSelect()<CR>

    function! MarkSelect()
        exec 'w'
        exec 'normal! gvd'
        let @" = substitute(@", '\n', '', '')
        exec 'normal! i' . '<mark>' . @" . '</mark>'
    endfunction
endif
