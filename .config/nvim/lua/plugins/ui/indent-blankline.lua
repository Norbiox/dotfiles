return {
  'lukas-reineke/indent-blankline.nvim',
  main = "ibl",
  config = function()
    local indentation_highlight = {
      "CursorColumn",
      "Whitespace",
    }
    require("ibl").setup ({
      indent = { highlight = indentation_highlight, char = "" },
      whitespace = { highlight = indentation_highlight, remove_blankline_trail = true },
      scope = { enabled = true }
    })
  end
}
