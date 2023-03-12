"  trans.vim
"
"  translate the text under the visual mode you select
"
"  Copyright (Vimscript) Jie
"  2023-02-24
" 
vnoremap <LEADER>tr :call MyTrans()<CR>

function! MyTrans()
    let save = @z
    silent exec 'normal! gv"zy'

    echo system('trans :zh --shell ' . shellescape(@z))
endfunction

let test = 1
