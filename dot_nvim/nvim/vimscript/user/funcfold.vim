"  funcfold.vim
"
"  Fold the function under the cursor
"  Fold all functions in the file
"  Fold the block under the cursor
"
"  Copyright (Vimscript) Jie
"  2023-03-10
" 
nnoremap <M-CR> :call CheckFold()<CR>

let s:testt = 'hello'
function! CheckFold()
    let start = foldclosed('.')
    let end = foldclosedend('.')
    set fdm=manual
    if start >= 0 && end >= 0
        " echo 'Cursor is inside a fold'
        normal! zo
    else
        " echo 'Cursor is not inside a fold'
        normal! zfa{
        normal! zc
    endif
endfunction
