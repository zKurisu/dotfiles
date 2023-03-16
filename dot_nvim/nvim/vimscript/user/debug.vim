if &ft == 'perl' || &ft == 'c'
    nmap <LEADER>dd :call RunDebug()<CR>
endif

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

