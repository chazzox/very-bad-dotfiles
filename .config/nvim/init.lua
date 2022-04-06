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
vim.wo.spell = true 
vim.opt.spelllang = {"nl", "en_us"}

-- configure title string
vim.opt.title = true 
vim.opt.titlestring = "%F"

-- plugins
local use = require('packer').use
require('packer').startup(function() 
  use 'wbthomason/packer.nvim' -- package manager
  use 'folke/tokyonight.nvim' -- theme
  use 'andweeb/presence.nvim' -- discord Rich Presence 
  
  -- status line
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {'rrethy/vim-hexokinase', run = 'make hexokinase' } -- highlight colors in files

  -- languages
  use 'dag/vim-fish' -- fish syntax 
  use 'mboughaba/i3config.vim' -- i3 config support 
  use 'sheerun/vim-polyglot' -- syntax highlighting lang pack 
  use 'lervag/vimtex' -- latex compilation

  -- ai autocompletion
  use 'github/copilot.vim' -- copilot
end)

-- status line config
require('lualine').setup({options = { theme = 'tokyonight' }})

-- Theme Configuration
vim.o.termguicolors = true 
vim.g.tokoyonight_style = "storm"
vim.cmd [[ colorscheme tokyonight ]]

-- vimtex
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_compiler_latexmk = {options = {'-shell-escape'}} -- enabling the syntax highlighting module

-- i3 config detection
vim.cmd [[ au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config ]]

-- highlight colors :)
vim.g.Hexokinase_highlighters = {'foregroundfull'}

-- future api:
--[[
local set_i3_filetype = function() vim.opt.filetype = "i3config"
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, { pattern =
    "~/.config/i3/config", callback = set_i3_filetype })
--]]

