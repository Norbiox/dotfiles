-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Linters
      'mfussenegger/nvim-lint',

      -- Signature
      'ray-x/lsp_signature.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
    },
  }

  use { -- Pictograms in LSP
    'onsails/lspkind.nvim'
  }

  use { -- Displays popup with possible key bindings
    "folke/which-key.nvim",
    config = function ()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup { }
    end
  }

  use { -- Statusline with code context
    'utilyre/barbecue.nvim',
    requires = {
      'SmiteshP/nvim-navic',
      'neovim/nvim-lspconfig',
    },
    after = "nvim-web-devicons",
    config = function()
      require('barbecue').setup()
    end
  }

  use { -- Tabline enhancer
    'romgrk/barbar.nvim',
    requires = {
      'nvim-tree/nvim-web-devicons',
      'lewis6991/gitsigns.nvim',
    },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Nvim-tree
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    tag = 'nightly'
  }

  -- Better escape with jk and kj
  use {
    'jdhao/better-escape.vim',
    event = 'InsertEnter'
  }

  -- TabNine
  use { 'codota/tabnine-nvim', run = './dl_binaries.sh' }

  -- Automatically closes brackets 
  use {
    'windwp/nvim-autopairs',
    config = function () require('nvim-autopairs').setup {
      fast_wrap = {},
    } end
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'
  use 'sindrets/diffview.nvim'

  -- Miscallenous
  use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  use 'sansyrox/vim-python-virtualenv' -- Python virtualenv support
  -- use 'jiangmiao/auto-pairs' -- Automatically closes brackets
  use 'voldikss/vim-floaterm' -- Terminal in floating window
  use 'ojroques/vim-oscyank' -- Copy from anywhere to system clipboard using ANSI OSC52 sequence
  use 'stevearc/dressing.nvim'
  use 'nvim-tree/nvim-web-devicons' -- Icons

  -- Markdown preview
  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  -- Lualine
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true}
  }

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  -- Conjure - interactive evaluation for Neovim
  -- use { 'Olical/conjure' }
  -- use { 'PaterJason/cmp-conjure' }

  -- ChatGPT
  use ({
    'jackMort/ChatGPT.nvim',
      config = function()
        require("chatgpt").setup({
          -- custom setup
        })
      end,
      requires = {
        'MunifTanjim/nui.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim'
      }
  })

  use ({
    'ckipp01/nvim-jenkinsfile-linter',
    requires = { "nvim-lua/plenary.nvim" }
  })

  -- Surround - surround selections

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  })

  -- Rainbow CSV for colourful CSV
  use {
      'cameron-wags/rainbow_csv.nvim',
      config = function()
          require 'rainbow_csv'.setup()
      end,
      -- optional lazy-loading below
      module = {
          'rainbow_csv',
          'rainbow_csv.fns'
      },
      ft = {
          'csv',
          'tsv',
          'csv_semicolon',
          'csv_whitespace',
          'csv_pipe',
          'rfc_csv',
          'rfc_semicolon'
      }
  }

  use {
    'Exafunction/codeium.vim',
    config = function ()
      -- Change '<C-g>' here to any keycode you like.
      vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  }

  -- END OF PLUGINS --

  -- START OF CONFIGS --

  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
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
vim.o.colorcolumn="80,100"

-- Set colorscheme
-- vim.opt.termguicolors = true
require('onedark').setup {
  style = 'dark',
  highlights = {
    ["@keyword"] = {fg = "$red"}
  },
  lualine = {
    transparent = true
  }
}
require('onedark').load()

-- Set linters
require('lint').linters_by_ft = {
  python = {'pylint'}
}
vim.api.nvim_create_autocmd({"BufWritePost"}, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- Set cursor line
vim.o.cursorline = true

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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
    component_separators = { left = '|', right = '|'},
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
    lualine_c = {'filename'},
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
-- See `:help indent_blankline.txt`
local indentation_highlight = {
  "CursorColumn",
  "Whitespace",
}
require("ibl").setup {
  indent = { highlight = indentation_highlight, char = "" },
  whitespace = { highlight = indentation_highlight, remove_blankline_trail = true },
  scope = { enabled = true }
}

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
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
  ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'typescript', 'help', 'clojure' },

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
local servers = { 'clangd', 'rust_analyzer', 'pyright', 'tsserver', 'lua_ls', 'gopls', 'clojure_lsp', 'groovyls', 'yamlls' }

-- Ensure the servers above are installed
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
require('fidget').setup()

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
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    -- ['<Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   elseif luasnip.expand_or_jumpable() then
    --     luasnip.expand_or_jump()
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
    -- ['<S-Tab>'] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { 'i', 's' }),
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
  -- update_focused_file = {
  --   enable = true,
  -- },
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

-- Setup Barbar
require('barbar').setup({
})

-- Python virtualenv config
vim.g.python3_host_prog = '/usr/bin/python'

-- Activate TabNine
-- require('tabnine').setup({
--   disable_auto_comment = true,
--   accept_keymap = '<Tab>',
--   dismiss_keymap = '<C-]>',
--   debounce_ms = 500,
--   suggestion_color = { gui='#808080', cterm=244 },
--   exclude_filetypes = { 'TelescopePrompt', 'NvimTree' },
--   log_file_path = '.dev/tabnine.log',
-- })

-------------
-- KEYMAPS --
-------------

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

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
vim.keymap.set('n', '<leader>b', ':!black -l 100 %<CR>', {noremap = true, silent = true})

-- Map Esc to exit terminal mode
vim.keymap.set('t', '<esc>', '<C-\\><C-N>', {noremap = true, silent = true})

-- Keymap and settings for terminal floating window
vim.keymap.set('n', '<leader>;', ':FloatermToggle<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>;', '<Esc>:FloatermToggle<CR>', {noremap = false, silent = true})
vim.keymap.set('t', '<leader>;', '<C-\\><C-N>:FloatermToggle<CR>', {noremap = false, silent = true})
vim.keymap.set('t', '<leader><F4>', '<C-\\><C-N>:FloatermNew<CR>', {noremap = true, silent = true})
vim.keymap.set('t', '<leader><F5>', '<C-\\><C-N>:FloatermKill<CR>', {noremap = true, silent = true})
vim.keymap.set('t', '<leader><F6>', '<C-\\><C-N>:FloatermFirst<CR>', {noremap = true, silent = true})
vim.keymap.set('t', '<leader><F7>', '<C-\\><C-N>:FloatermPrev<CR>', {noremap = true, silent = true})
vim.keymap.set('t', '<leader><F8>', '<C-\\><C-N>:FloatermNext<CR>', {noremap = true, silent = true})
vim.keymap.set('t', '<leader><F9>', '<C-\\><C-N>:FloatermLast<CR>', {noremap = true, silent = true})

-- Keymap for OSCYank
vim.keymap.set('v', '<leader>c', ':OSCYank<CR>', {noremap = true, silent = true})

-- Keymap for saving/loading session
vim.keymap.set('n', '<leader>ss', ':mksession! .nvimsession<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>sl', ':source .nvimsession<CR>', {noremap = true, silent = true})

-- Keymap for Barbar
-- Move to previous/next
vim.keymap.set('n', '<A-,>', '<Cmd>BufferPrevious<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<A-.>', '<Cmd>BufferNext<CR>', {noremap = true, silent = true})
-- Re-order to previous/next
vim.keymap.set('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<A->>', '<Cmd>BufferMoveNext<CR>', {noremap = true, silent = true})
-- Goto buffer in position...
vim.keymap.set('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<A-0>', '<Cmd>BufferLast<CR>', {noremap = true, silent = true})
-- Pin/unpin buffer
vim.keymap.set('n', '<A-p>', '<Cmd>BufferPin<CR>', {noremap = true, silent = true})
-- Close buffer
vim.keymap.set('n', '<A-c>', '<Cmd>BufferClose<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<A-x>', '<Cmd>BufferCloseAllButVisible<CR>', {noremap = true, silent = true})
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', {noremap = true, silent = true})
-- Sort automatically by...
vim.keymap.set('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', {noremap = true, silent = true})

-- Keymap for DiffView
vim.keymap.set('n', '<Space>do', '<Cmd>DiffviewOpen<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<Space>dc', '<Cmd>DiffviewClose<CR>', {noremap = true, silent = true})

-- Keymap for ChatGTP

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
