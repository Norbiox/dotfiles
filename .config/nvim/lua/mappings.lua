require "nvchad.mappings"

local map = vim.keymap.set

-- Misc
--
-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "kj", "<ESC>")

-- Telescope
map('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
map('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
map('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
map('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles', hidden=True })
map('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>c', require('telescope.builtin').commands, { desc = '[C]ommands' })
map('n', '<leader>sc', require('telescope.builtin').command_history, { desc = '[S]earch [C]ommand History' })
map('n', '<leader>m', require('telescope.builtin').marks, { desc = '[M]arks' })

-- Codeium
map('i', '<C-j>', function () return vim.fn['codeium#Complete']() end, { expr = true, silent = true })
map('i', '<C-k>', function () return vim.fn['codeium#AcceptNextWord']() end, { expr = true, silent = true })
map('i', '<C-l>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
map('i', '<C-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
map('i', '<C-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
map('i', '<C-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })

