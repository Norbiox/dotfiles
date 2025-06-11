vim.api.nvim_create_user_command("CopyRelPath", function()
    vim.fn.setreg("+", vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")) 
end, {})
