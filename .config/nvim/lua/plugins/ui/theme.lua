-- Color theme
return {
  'navarasu/onedark.nvim',
  priority = 1000,
  config = function()
    require('onedark').setup {
      style = 'dark',
      code_style = {
        comments = 'italic',
      },
      highlights = {
        ["@keyword"] = { fg = "$red" }
      },
      lualine = {
        transparent = true
      }
    }
    require('onedark').load()
    vim.cmd.colorscheme("onedark")
  end,
}
