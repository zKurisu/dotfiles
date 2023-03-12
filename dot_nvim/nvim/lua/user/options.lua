#! /usr/bin/lua
--
-- options.lua
-- Basic options of nvim
-- Copyright (Lua) Jie
-- 2023-01-02
--
--
vim.cmd "syntax on"
vim.cmd "set nowrap"
vim.cmd "set listchars=tab:»\\ ,trail:·,nbsp:·"
-- vim.cmd "set guioptions+=r"     -- Adding scroll line on the right
vim.cmd "let g:netrw_winsize = 30"

local options = {
    fileencodings = {'ucs-bom', 'utf-8', 'default', 'latin1'},
    encoding = 'utf-8',
    foldlevel = 99,
--    autoindent
    tabstop = 4,        -- 每层缩排 4 列
    shiftwidth = 4,     -- 内/外缩排为 4 列
    expandtab = true,   -- 把所有制表符转换成空格
    shiftround = true, -- 总是内/外缩排至最近的移位点
    hidden = true,
    undofile = true,
    undodir = '/home/jie/.local/share/nvim/undo',
    background = 'dark',
    termguicolors = true,
    wildmenu = true,
    vb = true,
    relativenumber = true,
    nu = true,
--     cursorcolumn
    cursorline = true,
    showcmd = true,
    scrolloff=5,
    ignorecase = true,
    smartcase = true,
    hlsearch = true,
    incsearch = true,
--    textwidth = 78,     -- 代码行设置
    mouse=a
}

for key, value in pairs(options) do
    vim.opt[key] = value
end
