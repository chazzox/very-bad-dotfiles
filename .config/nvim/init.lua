-- editor stuff
vim.opt.encoding = "UTF-8"
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.scrolloff = 12

-- 4 character width tabs
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2

-- no annoying backup files
vim.opt.backup = false
vim.opt.writebackup = false

-- auto check for file updates every time the window is entered/focused
-- future api:

-- vim.api.nvim_create_autocmd({"WinEnter", "TabEnter", "FocusGained"}, {pattern = "*", callback = checktime })

--[[
local set_i3_filetype = function() vim.opt.filetype = "i3config"
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "~/.config/i3/config",
  callback = set_i3_filetype
})
--]]


-- spell check
vim.wo.spell = true
vim.opt.spelllang = {"nl", "en_us"}

-- configure title string
vim.opt.title = true
vim.opt.titlestring = "%F"

-- plugins
vim.cmd [[packadd packer.nvim]]
local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager

  -- LSP stuff
  use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client

  -- theme
  use 'folke/tokyonight.nvim'
end)

-- theme configuration
vim.o.termguicolors = true
vim.g.tokoyonight_style = "storm"
vim.cmd[[colorscheme tokyonight]]
