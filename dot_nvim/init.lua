#! /usr/bin/lua
--
-- init.lua
-- init file of nvim written by lua
-- Copyright (Lua) Jie
-- 2023-01-02
--
--

-- Plugins written or config by Lua 
package.path = '/home/jie/.config/nvim/lua/?.lua;' .. '/home/jie/.config/nvim/lua/?/init.lua;' .. package.path
require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.bufferline"
require "user.colorscheme"
-- require "user.neodev"
require "user.cmp"
require "user.lsp"
require "user.telescope"
require "user.treesitter"
-- require "user.autopairs"
require "user.comment"
require "user.gitsigns"
require "user.nvim-tree"
require "user.lualine"
require "user.toggleterm"
require "user.project"
require "user.impatient"
require "user.indentline"
require "user.alpha"
require "user.marks"
-- require "user.nvim_notify"
require "user.hop"
-- require "user.nvim-dap"
-- require "user.nvim-dap-ui"
-- require "user.dashboard"
-- require "user.whichkey"


-- Plugins written or config by vimscript
vim.cmd [[
    let b:mypath = '/home/jie/.config/nvim/vimscript/'
    let b:files = [
      \ "user/markdown-preview.vim",
      \ "user/vim-table-mode.vim",
      \ "user/vim-mundo.vim",
      \ "user/filetype.vim",
      \ "user/run.vim",
      \ "user/chineseCount.vim",
      \ "user/mark.vim",
      \ "user/mdtitle.vim",
      \ "user/vimspector.vim",
      \ "user/debug.vim",
      \ "user/lazygit.vim",
      \ "user/trans.vim",
      \ ]

function! LoadVimscript(path, files) abort
    for file in a:files
        execute "source " . expand(a:path) . expand(file)
    endfor
endfunction

    call LoadVimscript(b:mypath, b:files)
]]

