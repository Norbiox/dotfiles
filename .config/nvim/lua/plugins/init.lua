return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
    lazy = false,
  	opts = {
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
  	},
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
  },

  {
    "sansyrox/vim-python-virtualenv",
    lazy = false,
  },

}
