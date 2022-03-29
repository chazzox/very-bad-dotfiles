-- CHAZZOX NVIM CONFIG

-- editor stuff
vim.opt.encoding = "UTF-8" 
vim.opt.cursorline = true 
vim.opt.number = true
vim.opt.mouse = "a" 
vim.opt.scrolloff = 12
vim.opt.tabstop = 4 
vim.opt.shiftwidth = 2 -- 4 character width tabs
vim.opt.textwidth = 80 
vim.opt.wrapmargin = 2 -- word wrap
vim.opt.backup = false 
vim.opt.writebackup = false -- no annoying backup files

-- auto check for file updates every time the window is entered/focused
vim.cmd [[ au WinEnter, TabEnter, FocusGained * checktime ]]

-- future api: vim.api.nvim_create_autocmd({"WinEnter", "TabEnter",
-- "FocusGained"}, {pattern = "*", callback = checktime })

-- spell check
vim.wo.spell = true vim.opt.spelllang = {"nl", "en_us"}

-- configure title string
vim.opt.title = true vim.opt.titlestring = "%F"

-- plugins
vim.cmd [[packadd packer.nvim]] 

local use = require('packer').use
require('packer').startup(function() 
  use 'wbthomason/packer.nvim' -- Package manager
  use 'folke/tokyonight.nvim' -- Theme
  use 'andweeb/presence.nvim' -- Discord Rich Presence 

  -- Languages
  use 'dag/vim-fish' -- Fish syntax 
  use 'mboughaba/i3config.vim'-- i3 config support 
  use 'sheerun/vim-polyglot' -- Syntax highlighting lang pack 
  use 'lervag/vimtex' -- latex compilation

  use 'github/copilot.vim' -- copilot
end)

-- Theme Configuration
vim.o.termguicolors = true 
vim.g.tokoyonight_style = "storm"
vim.cmd [[colorscheme tokyonight]]

-- vimtex
vim.g.vimtex_view_general_viewer = "zathura"
-- vim.g.vimtex_compiler_latexmk.options = ["-shell-escape"]

-- i3 config detection
vim.cmd[[ au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config ]]


-- future api:
--[[
local set_i3_filetype = function() vim.opt.filetype = "i3config"
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, { pattern =
    "~/.config/i3/config", callback = set_i3_filetype })
--]]

