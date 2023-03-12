#! /usr/bin/lua
--
-- keymaps.lua
-- function
-- Copyright (Lua) Jie
-- 2023-01-02
--
--
-- ==================== Basic options ====================
local opts = { noremap = true, silent = true }
local opt_silent = { silent = true }


vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",


-- ==================== Normal ====================
-- Better window navigation
keymap("n", ";", ":", opt_silent)
keymap("n", "S", ":w<CR>", opt_silent)
keymap("n", "Q", ":q<CR>", opt_silent)
keymap("n", "J", "5j", opt_silent)
keymap("n", "K", "5k", opt_silent)
keymap("n", "H", "0", opt_silent)
keymap("n", "L", "$", opt_silent)
keymap("n", "B", "%", opt_silent)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "s", "<nop>", opt_silent)
keymap("n", "<LEADER>/", ":nohlsearch<CR>", opt_silent)
keymap("n", "<LEADER>rc", ":vsplit $HOME/.config/nvim/init.lua<cr>", opts)
keymap("n", "<LEADER>src", ":source $HOME/.config/nvim/init.lua<cr>", opts)
keymap("n", "<LEADER>sc", ":source %<CR>", opts)

-- Jump to the next bracket 
keymap("n", "{", "0N:nohlsearch<CR>f{", opts)
keymap("n", "}", "/{<CR>:nohlsearch<CR>f{", opts)


-- Resize with arrows

-- Navigate buffers
keymap("n", "<M-h>", ":bprevious<CR>", opts)
keymap("n", "<M-l>", ":bnext<CR>", opts)
keymap("n", "<M-d>", ":bdelete<CR>", opts)
keymap("n", "<M-b>", ":new<CR>", opts)

-- Move text up and down

-- ==================== Insert ====================
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opt_silent)
keymap("i", "<>", "<><ESC>i", opt_silent)


-- ==================== Visual ====================
-- Stay in indent mode
keymap("v", "H", "0", opt_silent)
keymap("v", "L", "$", opt_silent)
keymap("v", "J", "5j", opt_silent)
keymap("v", "K", "5k", opt_silent)
keymap("v", "B", "%", opt_silent)
keymap("v", "s", '"+y', opt_silent)

-- Move text up and down


-- ==================== Visual Block ====================
-- Move text up and down


-- ==================== Terminal ====================
-- Better terminal navigation


-- ==================== Window management ====================
keymap("n", "<LEADER>h", "<C-w>h", opts)
keymap("n", "<LEADER>j", "<C-w>j", opts)
keymap("n", "<LEADER>k", "<C-w>k", opts)
keymap("n", "<LEADER>l", "<C-w>l", opts)
-- splite the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
keymap("n", "sh", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", opts)
keymap("n", "sj", ":set splitbelow<CR>:split<CR>", opts)
keymap("n", "sk", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", opts)
keymap("n", "sl", ":set splitright<CR>:vsplit<CR>", opts)
-- Resize splits with arrow keys
keymap("n", "<up>", ":res +5<CR>", opts)
keymap("n", "<down>", ":res -5<CR>", opts)
keymap("n", "<left>", ":vertical resize-5<CR>", opts)
keymap("n", "<right>", ":vertical resize+5<CR>", opts)
-- Place the two screens up and down
keymap("n", "su", "<C-w>t<C-w>K", opts)
-- Place the two screens side by side
keymap("n", "sv", "<C-w>t<C-w>H", opts)

