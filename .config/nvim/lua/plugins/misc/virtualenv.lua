local host_dir = vim.fn.stdpath('data') .. '/python-host'
local host_py  = host_dir .. '/bin/python3'

local function ensure_host()
  if vim.fn.executable(host_py) == 1 then return true end
  if vim.fn.executable('uv') == 0 then
    vim.notify(
      'Neovim Python host missing and `uv` not found. Install uv or set '
        .. '`vim.g.loaded_python3_provider = 0` to silence.',
      vim.log.levels.WARN
    )
    return false
  end
  vim.notify('Bootstrapping Neovim Python host via uv...', vim.log.levels.INFO)
  vim.fn.system({ 'uv', 'venv', '--seed', host_dir })
  if vim.v.shell_error ~= 0 then return false end
  vim.fn.system({ 'uv', 'pip', 'install', '--python', host_py, 'pynvim' })
  return vim.v.shell_error == 0 and vim.fn.executable(host_py) == 1
end

if ensure_host() then
  vim.g.python3_host_prog = host_py
else
  vim.g.loaded_python3_provider = 0
end

return {}
