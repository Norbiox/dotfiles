-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy

require("lazy").setup({
  checker = {
    enabled = true,  -- automatically check for plugin updates
    notify = false,   -- get a notification when new updates are found
  },
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  require "plugins.ui",
  require "plugins.git",
  require "plugins.telescope",
  require "plugins.treesitter",
  require "plugins.lsp",
  require "plugins.completion",
  require "plugins.editor",
  require "plugins.misc",
})
