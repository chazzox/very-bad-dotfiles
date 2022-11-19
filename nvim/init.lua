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
  use 'rrethy/vim-hexokinase' -- color highlighting

  -- languages
  -- use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate' } --syntax highlighting
  use 'dag/vim-fish' -- fish syntax 
  use {'mboughaba/i3config.vim', ft="i3config"} -- i3 config support 
  use {'lervag/vimtex', ft="tex"} -- latex compilation
  use {"ellisonleao/glow.nvim", ft="markdown"} -- markdown preview
  
  use 'github/copilot.vim'
  use 'lewis6991/impatient.nvim' -- speedy load times
end)

--enabling speedy
require('impatient').enable_profile()

-- editor stuff
vim.o.termguicolors = true 
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

-- spell check
vim.wo.spell = true 
vim.opt.spelllang = {"nl", "en_us"}

-- configure title string
vim.opt.title = true 
vim.opt.titlestring = "%F"


-- PLUGINS 

-- Theme Configuration
vim.g.tokoyonight_style = "storm"
vim.cmd [[ colorscheme tokyonight ]]

-- status line config
require('lualine').setup {options = { theme = 'tokyonight' }}

-- treesitter config
--require('nvim-treesitter.configs').setup {
--  highlight = { enable = true, additional_vim_regex_highlighting = false}
-- }

-- nvim colorizer
vim.g.Hexokinase_highlighters = {'foregroundfull'}

-- vimtex
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_compiler_latexmk = {options = {'-shell-escape'}} -- enabling the syntax highlighting

