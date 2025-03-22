return {
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
}
