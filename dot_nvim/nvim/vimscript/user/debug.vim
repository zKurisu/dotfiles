nmap <LEADER>dd :call RunDebug()<CR>

func! RunDebug()
    exec "w"

    if &filetype == 'perl'
        term perl -d %
    elseif &filetype == 'c'
		term gcc -g % -o %< && gdb %<
    elseif &filetype == 'vim'
        :debug source %
    endif

    :normal a
endfunc

