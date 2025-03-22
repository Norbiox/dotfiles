-- Powerful git integration
return {
  'tpope/vim-fugitive',
  config = function()
    vim.keymap.set('n', '<leader>gg', ':Git<CR>', {noremap = true, silent = true})
  end
}
