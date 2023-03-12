local status_ok, dap = pcall(require, 'dap')
if not status_ok then
    return
end

-- ==================== Python Debugger ====================
vim.fn.sign_define('DapBreakpoint', {text='🟥☞', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='⭐️', texthl='', linehl='', numhl=''})

dap.adapters.python = {
  type = 'executable';
  command = '/home/jie/.virtualenvs/debugpy/bin/python';
  args = { '-m', 'debugpy.adapter' };
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}

-- ==================== Keymappings ====================
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<LEADER>db", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<LEADER>do", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<LEADER>di", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<LEADER>ds", ":lua require'dap'.stop()<CR>", opts)
keymap("n", "<LEADER>dc", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<LEADER>dk", ":lua require'dap'.up()<CR>", opts)
keymap("n", "<LEADER>dj", ":lua require'dap'.down()<CR>", opts)
keymap("n", "<LEADER>dr", ":lua require'dap'.repl.open()<CR>", opts)
keymap("n", "<LEADER>dh", ":lua require'dapui'.eval()<CR>", opts)
keymap("v", "<LEADER>dh", ":lua require'dapui'.eval()<CR>", opts)
keymap("n", "<LEADER>d?", ":lua require'dap.ui.variables'.scopes()<CR>", opts)
