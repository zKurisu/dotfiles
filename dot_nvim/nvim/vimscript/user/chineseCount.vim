vnoremap <LEADER>cc :call ChineseCount()<CR>
vnoremap <LEADER>ce :call EnglishCount()<CR>


function! ChineseCount() range
    let save = @z
    silent exec 'normal! gv"zy'
    let text = @z
    silent exec 'normal! gv'
    let cc = 0
    for char in split(text, '\zs')
        if char2nr(char) >= 0x2000
            let cc += 1
        endif
    endfor 
    echo "Count of Chinese charasters is:"
    echo cc
endfunc

function! EnglishCount() range
    let save = @z
    silent exec 'normal! gv"zy'
    let text = @z
    silent exec 'normal! gv'
    let cc = 0
    for char in split(text, '\zs')
        if char2nr(char) >= 65 && char2nr(char) <= 122 
            let cc += 1
        endif
    endfor 
    echo "Count of English charasters is:"
    echo cc
endfunc
