local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"

-- ==================== Keymappings ====================
local opts = { noremap = true, silent = true }
local opt_silent = { silent = true }

local keymap = vim.api.nvim_set_keymap

-- formatting
keymap("n", "<M-f>", ":lua vim.lsp.buf.formatting_sync()<CR>", opts)
