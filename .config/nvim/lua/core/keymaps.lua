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

-- NvimTree keymaps
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Format keymaps
vim.keymap.set('n', '<leader>f', ':Format<CR>', {noremap = true, silent = true})

-- Map Esc to exit terminal mode
vim.keymap.set('t', '<esc>', '<C-\\><C-N>', {noremap = true, silent = true})

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

-- Keymap for OSCYank
vim.keymap.set('v', '<leader>c', ':OSCYank<CR>', {noremap = true, silent = true})

-- Keymap for saving/loading session
vim.keymap.set('n', '<leader>ss', ':mksession! .nvimsession<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>sl', ':source .nvimsession<CR>', {noremap = true, silent = true})

-- Keymap for DiffView
vim.keymap.set('n', '<leader>do', '<Cmd>DiffviewOpen<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>dc', '<Cmd>DiffviewClose<CR>', {noremap = true, silent = true})

-- Keymap for fugitive
vim.keymap.set('n', '<leader>gg', ':G<CR>', {noremap = true, silent = true})

-- Telescope keymaps
vim.keymap.set('n', '<leader>u', "<cmd>Telescope undo<cr>")
vim.keymap.set('n', '<leader>?', "<cmd>Telescope oldfiles<cr>", { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', "<cmd>Telescope buffers<cr>", { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', "<cmd>Telescope current_buffer_fuzzy_find theme=dropdown winblend=10 previewer=false<cr>", { desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set('n', '<leader>sf', "<cmd>Telescope find_files<cr>", { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sv', "<cmd>Telescope git_files<cr>", { desc = '[S]earch [V]ersion controlled files' })
vim.keymap.set('n', '<leader>sh', "<cmd>Telescope help_tags<cr>", { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', "<cmd>Telescope grep_string<cr>", { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', "<cmd>Telescope live_grep<cr>", { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', "<cmd>Telescope diagnostics<cr>", { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>c', "<cmd>Telescope commands<cr>", { desc = '[C]ommands' })
vim.keymap.set('n', '<leader>sc', "<cmd>Telescope command_history<cr>", { desc = '[S]earch [C]ommand History' })
vim.keymap.set('n', '<leader>m', "<cmd>Telescope marks<cr>", { desc = '[M]arks' })

-- vim: ts=2 sts=2 sw=2 et
