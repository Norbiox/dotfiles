-- Main entry point for Neovim configuration
--
-- Set leader key before loading plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set current directory as project folder for Augment
vim.g.augment_workspace_folders = { vim.fn.getcwd() }

require "options"
require "user_commands"
require "keymaps"
require "autocmd"
require "lazy-bootstrap"
require "lazy-plugins"

-- Set up notifications
vim.notify = require("notify")
