local status_ok, hop = pcall(require, "hop")
if not status_ok then
  vim.notify("Can not load hop.nvim")
  return
end

hop.setup()

-- ==================== Keymappings ====================
-- hop.nvim
local opts = { noremap = true, silent = true }
local opt_silent = { silent = true }

local keymap = vim.api.nvim_set_keymap

keymap("n", "<LEADER>gh", ":HopAnywhere<CR>", opts)
