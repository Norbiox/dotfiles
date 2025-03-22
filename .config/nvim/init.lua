-- Main entry point for Neovim configuration
--
-- Set leader key before loading plugins
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require "options"
require "keymaps"
require "autocmd"
require "lazy-bootstrap"
require "lazy-plugins"

