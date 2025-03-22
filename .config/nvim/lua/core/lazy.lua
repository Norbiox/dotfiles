-- Initialize lazy.nvim plugins
return require("lazy").setup({

  spec = {
    { import = "plugins" },
  },

  -- Lazy options
  defaults = { lazy = true },
  checker = { enabled = true },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
