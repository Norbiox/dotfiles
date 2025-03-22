-- Python virtualenv support
return {
  'sansyrox/vim-python-virtualenv',
  config = function()
    vim.g.python3_host_prog = '/usr/bin/python3.10'
  end
}
