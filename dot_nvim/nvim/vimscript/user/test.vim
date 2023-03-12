"  test.vim
"
"  function
"
"  Copyright (Vimscript) Jie
"  2023-03-11
"
let list = [1, 2, 3, 4]

function Testt() abort
    echo "Hello"  
endfunc

let FuncRef = function('Testt')
call FuncRef()
