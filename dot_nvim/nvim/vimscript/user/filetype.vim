if &ft == 'lua'
    set shiftwidth=2
endif

if (&ft == 'md') || (&ft == 'markdown')
    nnoremap <LEADER>pv :MarkdownPreview<CR>
    set wrap
    set textwidth=0
endif
