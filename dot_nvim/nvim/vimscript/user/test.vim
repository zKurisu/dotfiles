"  test.vim
"
"  function
"
"  Copyright (Vimscript) Jie
"  2023-03-11
"
highlight echo guifg=lightblue gui=bold,italic guibg=#3d59a1

echohl echo

let list = [1, 2, 3, 4]

function! Testt()
    echo "Hello"  
endfunc

echo list
echo "Hello"
let FuncRef = function('Testt')
call Testt()
"
" echohl PmenuSel
" echomsg "Hello"
"
" echohl None
" echon " "
"
" echohl IncSearch
" echon "World"
"
