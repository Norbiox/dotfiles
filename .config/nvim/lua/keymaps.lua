-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set({ 'n', 'v' }, '<leader>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Map Esc to exit terminal mode
vim.keymap.set('t', '<esc>', '<C-\\><C-N>', { noremap = true, silent = true })

-- Keymap for saving/loading session
vim.keymap.set('n', '<leader>S', ':mksession! .nvimsession<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>L', ':source .nvimsession<CR>', { noremap = true, silent = true })

-- Keymap and settings for terminal floating window
vim.keymap.set('n', '<leader>;', ':FloatermToggle<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>;', '<Esc>:FloatermToggle<CR>', {noremap = false, silent = true})
vim.keymap.set('t', '<leader>;', '<C-\\><C-N>:FloatermToggle<CR>', {noremap = false, silent = true})
vim.keymap.set('t', '<leader>bc', '<C-\\><C-N>:FloatermNew<CR>', {noremap = true, silent = true})
vim.keymap.set('t', '<leader>bk', '<C-\\><C-N>:FloatermKill<CR>', {noremap = true, silent = true})
vim.keymap.set('t', '<leader>bf', '<C-\\><C-N>:FloatermFirst<CR>', {noremap = true, silent = true})
vim.keymap.set('t', '<leader>bp', '<C-\\><C-N>:FloatermPrev<CR>', {noremap = true, silent = true})
vim.keymap.set('t', '<leader>bn', '<C-\\><C-N>:FloatermNext<CR>', {noremap = true, silent = true})
vim.keymap.set('t', '<leader>bl', '<C-\\><C-N>:FloatermLast<CR>', {noremap = true, silent = true})
