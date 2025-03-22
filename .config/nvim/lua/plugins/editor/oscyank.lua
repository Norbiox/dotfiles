-- OSCYank for copying to clipboard
return {
  "ojroques/vim-oscyank",
  config = function()
    vim.keymap.set('v', '<leader>c', ':OSCYank<CR>', { noremap = true, silent = true })
  end
}
