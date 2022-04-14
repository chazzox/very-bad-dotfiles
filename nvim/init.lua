-- CHAZZOX NVIM CONFIG

-- plugins
require('packer').startup(function(use) 
  use 'wbthomason/packer.nvim' -- package manager

  -- editor 
  use 'folke/tokyonight.nvim' -- theme
  use 'andweeb/presence.nvim' -- discord Rich Presence 
  use {'nvim-lualine/lualine.nvim', 
	requires = { 'kyazdani42/nvim-web-devicons', opt = true } -- status line
  } 
  use {'rrethy/vim-hexokinase', run ='make hexokinase', opt=true} -- highlight colors in files

  -- languages
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate' } --syntax highlighting
  use {'dag/vim-fish', opt=true} -- fish syntax 
  use {'mboughaba/i3config.vim', opt=true} -- i3 config support 
  use {'lervag/vimtex', opt=true} -- latex compilation
  use {"ellisonleao/glow.nvim", opt=true} -- markdown preview

  use 'lewis6991/impatient.nvim' -- speedy load times
end)

--enabling speedy
require('impatient').enable_profile()

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

-- future api: 
-- vim.api.nvim_create_autocmd({"WinEnter", "TabEnter",
-- "FocusGained"}, {pattern = "*", callback = checktime })

-- spell check
vim.wo.spell = true 
vim.opt.spelllang = {"nl", "en_us"}

-- configure title string
vim.opt.title = true 
vim.opt.titlestring = "%F"
-- status line config
require('lualine').setup {options = { theme = 'tokyonight' }}

-- treesitter config
require('nvim-treesitter.configs').setup {
  highlight = { enable = true, additional_vim_regex_highlighting = false}
}

-- Theme Configuration
vim.o.termguicolors = true 
vim.g.tokoyonight_style = "storm"
vim.cmd [[ colorscheme tokyonight ]]

-- vimtex
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_compiler_latexmk = {options = {'-shell-escape'}} -- enabling the syntax highlighting

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
