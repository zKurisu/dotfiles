let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'local-lua-debugger-vscode' ]
sign define vimspectorBP text=🟥 texthl=Normal
sign define vimspectorBPDisabled text=🟥 texthl=Normal
sign define vimspectorPC text=🔶 texthl=SpellBad

function! s:read_template_into_buffer(template)
	" has to be a function to avoid the extra space fzf#run insers otherwise
	execute '0r ~/.config/nvim/sample_vimspector_json/'.a:template
endfunction
command! -bang -nargs=* LoadVimSpectorJsonTemplate call fzf#run({
			\   'source': 'ls -1 ~/.config/nvim/sample_vimspector_json',
			\   'down': 20,
			\   'sink': function('<sid>read_template_into_buffer')
			\ })

noremap <leader>dd :tabe .vimspector.json<CR>:LoadVimSpectorJsonTemplate<CR>
" ==================== Keymappings ====================
nnoremap <LEADER>dc <Plug>VimspectorContinue<CR>
nnoremap <LEADER>ds <Plug>VimspectorStop<CR>
nnoremap <LEADER>dr <Plug>VimspectorRestart<CR>
nnoremap <LEADER>dp <Plug>VimspectorPause<CR>
nnoremap <LEADER>dj <Plug>VimspectorJumpToNextBreakpoint<CR>
nnoremap <LEADER>dk <Plug>VimspectorJumpToPreviousBreakpoint<CR>
nnoremap <LEADER>db <Plug>VimspectorToggleBreakpoint<CR>
nnoremap <LEADER>do <Plug>VimspectorStepOver<CR>
nnoremap <LEADER>di <Plug>VimspectorStepInto<CR>
nnoremap <LEADER>dg <Plug>VimspectorStepOut<CR>
