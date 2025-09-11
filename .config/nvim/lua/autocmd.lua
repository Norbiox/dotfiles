-- Custom files associations
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = {'Jenkinsfile', 'jenkinsfile'},
  command = 'setlocal filetype=groovy',
})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = {'.pylintrc'},
  command = 'setlocal filetype=ini',
})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'}, {
  pattern = {'supervisord.conf'},
  command = 'setlocal filetype=ini',
})

-- Tab width settings for JSON and terraform files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "terraform",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Run linters on file save
vim.api.nvim_create_autocmd({"BufWritePost"}, {
  callback = function()
    require("lint").try_lint()
  end,
})
