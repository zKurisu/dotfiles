if &ft == 'vim' 
    nmap <leader>t <Plug>(vimpad-toggle)
    " make sure to set the style to custom!
    " let g:vimpad_style = 'custom'
    " let g:vimpad_prefix = "\uE0B6"
    " let g:vimpad_suffix= "\uE0B4"
    highlight VimpadOutput guifg=bg guibg=Cyan gui=bold,italic
    highlight VimpadPrefix guifg=bg guibg=Cyan gui=reverse
    highlight VimpadSuffix guifg=bg guibg=Cyan gui=reverse

    " make sure to set the style to custom!
    " let g:vimpad_style_error = 'custom'
    " let g:vimpad_prefix_error = "\uE0B6"
    " let g:vimpad_suffix_error = "\uE0B4"
    highlight VimpadOutputError guifg=bg guibg=Red gui=bold,italic
    highlight VimpadPrefixError guifg=bg guibg=Red gui=reverse
    highlight VimpadSuffixError guifg=bg guibg=Red gui=reverse
endif
