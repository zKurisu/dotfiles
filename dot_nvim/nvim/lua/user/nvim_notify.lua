local status_ok, nvim_notify = pcall(require, "notify")
if not status_ok then
  return
end

vim.notify = require("notify")

-- nvim_notify.OpenedBuffer = {
--     height = 20,
--     width = 40,
-- }
--
-- nvim_notify.Config = {
--     max_width = 40,
-- }

-- Lsp message
-- table from lsp severity to vim severity.
local severity = {
  "error",
  "warn",
  "info",
  "info", -- map both hint and info to info?
}
vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
             vim.notify(method.message, severity[params.type])
end


local function notify_output(command, opts)
  local output = ""
  local notification
  local notify = function(msg, level)
    local notify_opts = vim.tbl_extend(
      "keep",
      opts or {},
      { title = table.concat(command, " "), replace = notification }
    )
    notification = vim.notify(msg, level, notify_opts)
  end
  local on_data = function(_, data)
    output = output .. table.concat(data, "\n")
    notify(output, "info")
  end
  vim.fn.jobstart(command, {
    on_stdout = on_data,
    on_stderr = on_data,
    on_exit = function(_, code)
      if #output == 0 then
        notify("No output of command, exit code: " .. code, "warn")
      end
    end,
  })
end

-- Send Hello, When run vim
if #vim.api.nvim_get_vvar("argv") == 1 then
    local time = os.date('%Y-%m-%d')
    local hello_str = "Hi, today is " .. time
    notify_output({ "echo", hello_str})
end

-- Notify to relax

