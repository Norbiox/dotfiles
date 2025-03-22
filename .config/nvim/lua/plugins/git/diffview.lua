return {
  'sindrets/diffview.nvim',
  config = function()
    vim.keymap.set('n', '<leader>do', '<Cmd>DiffviewOpen<CR>', {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>dc', '<Cmd>DiffviewClose<CR>', {noremap = true, silent = true})
  end,
}
