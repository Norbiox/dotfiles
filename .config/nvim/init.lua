-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key before loading plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Initialize lazy.nvim
require("lazy").setup({
  -- LSP Configuration & Plugins
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'j-hui/fidget.nvim', -- Useful status updates for LSP
      'mfussenegger/nvim-lint', -- Linters
      'ray-x/lsp_signature.nvim', -- Signature
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
    },
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim', -- Pictograms in LSP
    },
  },

  -- Which-key for keybinding help
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {}
    end
  },

  -- Status bar with code context
  {
    'utilyre/barbecue.nvim',
    dependencies = {
      'SmiteshP/nvim-navic',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('barbecue').setup()
    end
  },

  -- Treesitter for syntax highlighting and more
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/nvim-treesitter-context',
    },
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- Escape with jk and kj
  {
    'jdhao/better-escape.vim',
    event = 'InsertEnter'
  },

  -- Auto pairs for brackets
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = function()
      require('nvim-autopairs').setup {
        fast_wrap = {},
      }
    end
  },

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    'lewis6991/gitsigns.nvim',
    config = true,
  },
  'sindrets/diffview.nvim',

  -- Theme and UI
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('onedark').setup {
        style = 'dark',
        code_style = {
          comments = 'italic',
        },
        highlights = {
          ["@keyword"] = {fg = "$red"}
        },
        lualine = {
          transparent = true
        }
      }
      require('onedark').load()
    end,
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
  },

  'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'sansyrox/vim-python-virtualenv', -- Python virtualenv support

  -- Floating terminal
  {
    'voldikss/vim-floaterm',
    cmd = {'FloatermToggle', 'FloatermNew', 'FloatermKill'},
  },

  'ojroques/vim-oscyank', -- Copy from anywhere to system clipboard
  'stevearc/dressing.nvim', -- Better UI for nvim-ui-select
  'nvim-tree/nvim-web-devicons', -- Icons

  -- Lualine status bar
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
  },

  -- Telescope for fuzzy finding
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-media-files.nvim',
      'debugloop/telescope-undo.nvim',
    },
  },

  -- Jenkinsfile linter
  {
    'ckipp01/nvim-jenkinsfile-linter',
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  -- Surround selections
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  -- Rainbow CSV
  {
    'cameron-wags/rainbow_csv.nvim',
    config = function()
      require('rainbow_csv').setup()
    end,
    ft = {
      'csv',
      'tsv',
      'csv_semicolon',
      'csv_whitespace',
      'csv_pipe',
      'rfc_csv',
      'rfc_semicolon'
    }
  },

  -- Codeium AI completion
  'Exafunction/codeium.vim',

  -- Obsidian integration
  {
    'epwalsh/obsidian.nvim',
    version = "*",
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('obsidian').setup({
        workspaces = {
          {
            name = "myallnotes",
            path = "~/Notes/MyAllNotes"
          }
        }
      })
    end,
  },

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
})

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

-- Tab width settings for JSON files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end
})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Make line numbers relative
vim.o.relativenumber = true

-- Set copying to system clipboard
vim.o.clipboard = 'unnamedplus'

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Vertical line
vim.o.colorcolumn="80,100,120"

-- Enable formatting concealment features
vim.o.conceallevel = 1

-- Set linters
require('lint').linters_by_ft = {
  -- python = {'pylint'}
  python = {'ruff'}
}
vim.api.nvim_create_autocmd({"BufWritePost"}, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

-- Set cursor line
vim.o.cursorline = true

-- Set default shiftwidth
vim.bo.shiftwidth = 2

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

-- Set lualine as statusline
-- See `:help lualine.txt`
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'%F'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {
    'fugitive',
    'nvim-tree',
  }
}

-- Enable Comment.nvim
require('Comment').setup({
  ignore = '^$'
})

-- Enable `lukas-reineke/indent-blankline.nvim`
local indentation_highlight = {
  "CursorColumn",
  "Whitespace",
}
require("ibl").setup {
  indent = { highlight = indentation_highlight, char = "" },
  whitespace = { highlight = indentation_highlight, remove_blankline_trail = true },
  scope = { enabled = true }
}

-- Gitsigns config
require('gitsigns').setup {
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>hs', gitsigns.stage_hunk)
    map('v', '<leader>hs', function() gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end)
    map('n', '<leader>hS', gitsigns.stage_buffer)
    map('n', '<leader>hr', gitsigns.reset_hunk)
    map('v', '<leader>hr', function() gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end)
    map('n', '<leader>hR', gitsigns.reset_buffer)
    map('n', '<leader>hp', gitsigns.preview_hunk)
    map('n', '<leader>hi', gitsigns.preview_hunk_inline)
    map('n', '<leader>hb', function() gitsigns.blame_line({ full = true }) end)
    map('n', '<leader>hd', gitsigns.diffthis)
    map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
    map('n', '<leader>hQ', function() gitsigns.setqflist('all') end)
    map('n', '<leader>hq', gitsigns.setqflist)

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>td', gitsigns.toggle_deleted)
    map('n', '<leader>tw', gitsigns.toggle_word_diff)

    -- Text object
    map({'o', 'x'}, 'ih', gitsigns.select_hunk)
  end
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<esc>'] = require('telescope.actions').close,
        ['jk'] = require('telescope.actions').close,
        ['<C-d>'] = require('telescope.actions').delete_buffer,
      },
    },
  },
  extensions = {
    media_files = { },
    fzf = { },
    undo = { }
  }
}

-- Load telescope extensions
require('telescope').load_extension('fzf')
require('telescope').load_extension('media_files')
require('telescope').load_extension('undo')
vim.keymap.set('n', '<leader>u', "<cmd>Telescope undo<cr>")

-- Set telescope keymaps
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sv', require('telescope.builtin').git_files, { desc = '[S]earch [V]ersion controlled files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>c', require('telescope.builtin').commands, { desc = '[C]ommands' })
vim.keymap.set('n', '<leader>sc', require('telescope.builtin').command_history, { desc = '[S]earch [C]ommand History' })
vim.keymap.set('n', '<leader>m', require('telescope.builtin').marks, { desc = '[M]arks' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  modules = {},
  ensure_installed = {
    'bash',
    'c',
    'clojure',
    'cpp',
    'css',
    'csv',
    'dart',
    'dockerfile',
    'diff',
    'dot',
    'fish',
    'git_config',
    'git_rebase',
    'gitattributes',
    'gitcommit',
    'gitignore',
    'go',
    'gpg',
    'groovy',
    'gleam',
    'html',
    'ini',
    'json',
    'json5',
    'java',
    'lua',
    'markdown',
    'nim',
    'nix',
    'python',
    'requirements',
    'ssh_config',
    'rust',
    'toml',
    'typescript',
    'vim',
    'yaml',
  },
  sync_install = true,
  auto_install = true,
  ignore_install = { },

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
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Setup navic
local navic = require("nvim-navic")

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    if vim.lsp.buf.format then
      vim.lsp.buf.format()
    elseif vim.lsp.buf.formatting then
      vim.lsp.buf.formatting()
    end
  end, { desc = 'Format current buffer with LSP' })
  nmap('<leader>lf', ':Format<CR>', '[L]SP [F]ormat buffer')

  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

-- Signature setup
require('lsp_signature').setup()

-- Setup mason so it can manage external tooling
require('mason').setup({
  PATH = "append",
})

-- Enable the following language servers
-- Feel free to add/remove any LSPs that you want here. They will automatically be installed
local servers = {
  'clangd',
  'rust_analyzer',
  'pyright',
  -- 'python-lsp-server',
  -- 'pylsp',
  'ruff',
  'ts_ls',
  'lua_ls',
  'nim_langserver',
  'gopls',
  'clojure_lsp',
  'groovyls',
  'yamlls',
}

-- Configure mason-lspconfig
require('mason-lspconfig').setup {
  ensure_installed = servers,
}

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Turn on lsp status information
require('fidget').setup({
  integration = {
    ["nvim-tree"] = {
      enable = false,
    },
  },
})

-- Example custom configuration for lua
--
-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

require('lspconfig').lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = { library = vim.api.nvim_get_runtime_file('', true) },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = { enable = false },
    },
  },
}

-- Navic setup
require('lspconfig').clangd.setup {
  on_attach = on_attach,
}

-- Load snippets
require("luasnip.loaders.from_vscode").lazy_load({})
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets/python" } })

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'
local lspkind = require 'lspkind'
local source_mapping = {
  buffer = "[Buffer]",
  nvim_lsp = "[LSP]",
  nvim_lua = "[Lua]",
  path = "[Path]",
}
local compare = require 'cmp.config.compare'

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
  },
  sources = {
    { name = 'nvim_lsp_signature_help' },
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      compare.offset,
      compare.exact,
      compare.score,
      compare.recently_used,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    }
  },
  formatting = {
    format = function(entry, vim_item)
      -- if you have lspkind installed, you can use it like
      -- in the following line:
      vim_item.kind = lspkind.symbolic(vim_item.kind, {mode = "symbol"})
      vim_item.menu = source_mapping[entry.source.name]
      local maxwidth = 100
      vim_item.abbr = string.sub(vim_item.abbr, 1, maxwidth)
      return vim_item
    end,
  },
}

-- Insert '(' after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- nvim-tree setup
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  hijack_cursor = true,
  diagnostics = {
    enable = true,
  },
  git = {
    ignore = false,
  },
  view = {
    centralize_selection = true,
    number = true,
    relativenumber = true,
    width = 40,
  },
  renderer = {
    group_empty = true,
    full_name = true,
  },
  filters = {
    dotfiles = false,
    custom = { '__pycache__' },
  }
})

-- Python virtualenv config
vim.g.python3_host_prog = '/usr/bin/python3.10'

-------------
-- KEYMAPS --
-------------

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<leader>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- NvimTree keymaps
vim.keymap.set('n', '<leader>n', ':NvimTreeToggle<CR>', {noremap = true, silent = true})

-- Black keymaps
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

-- Keymap for ChatGTP

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
