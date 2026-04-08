-- Treesitter for syntax highlighting and more
return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',
  dependencies = {
    {
      'nvim-treesitter/nvim-treesitter-textobjects',
      branch = 'main',
      config = function()
        -- move: configure jumplist, then set keymaps
        require('nvim-treesitter-textobjects').setup { move = { set_jumps = true } }

        local sel = require('nvim-treesitter-textobjects.select')
        local move = require('nvim-treesitter-textobjects.move')
        local swap = require('nvim-treesitter-textobjects.swap')

        -- select
        local sel_maps = {
          ['aa'] = '@parameter.outer', ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',  ['if'] = '@function.inner',
          ['ac'] = '@class.outer',     ['ic'] = '@class.inner',
        }
        for key, obj in pairs(sel_maps) do
          vim.keymap.set({ 'x', 'o' }, key, function()
            sel.select_textobject(obj, 'textobjects')
          end)
        end

        -- move
        vim.keymap.set({ 'n', 'x', 'o' }, ']m', function() move.goto_next_start('@function.outer', 'textobjects') end)
        vim.keymap.set({ 'n', 'x', 'o' }, ']]', function() move.goto_next_start('@class.outer', 'textobjects') end)
        vim.keymap.set({ 'n', 'x', 'o' }, ']M', function() move.goto_next_end('@function.outer', 'textobjects') end)
        vim.keymap.set({ 'n', 'x', 'o' }, '][', function() move.goto_next_end('@class.outer', 'textobjects') end)
        vim.keymap.set({ 'n', 'x', 'o' }, '[m', function() move.goto_previous_start('@function.outer', 'textobjects') end)
        vim.keymap.set({ 'n', 'x', 'o' }, '[[', function() move.goto_previous_start('@class.outer', 'textobjects') end)
        vim.keymap.set({ 'n', 'x', 'o' }, '[M', function() move.goto_previous_end('@function.outer', 'textobjects') end)
        vim.keymap.set({ 'n', 'x', 'o' }, '[]', function() move.goto_previous_end('@class.outer', 'textobjects') end)

        -- swap
        vim.keymap.set('n', '<leader>a', function() swap.swap_next('@parameter.inner') end)
        vim.keymap.set('n', '<leader>A', function() swap.swap_previous('@parameter.inner') end)
      end,
    },
    {
      'nvim-treesitter/nvim-treesitter-context',
      opts = {
        enable = function()
          return vim.bo.filetype ~= 'markdown'
        end,
      },
    },
  },
  config = function()
    local ts = require('nvim-treesitter')
    local languages = require('plugins.treesitter.languages')

    if ts.install then
      -- main branch (Neovim 0.12+)
      ts.install(languages)

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local buf = args.buf
          local ok = pcall(vim.treesitter.start, buf)
          if ok then
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    else
      -- master branch fallback (until :Lazy update pulls main)
      require('nvim-treesitter.configs').setup {
        ensure_installed = languages,
        sync_install = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<c-space>',
            node_incremental = '<c-space>',
            scope_incremental = '<c-s>',
            node_decremental = '<c-backspace>',
          },
        },
      }
    end
  end,
}
