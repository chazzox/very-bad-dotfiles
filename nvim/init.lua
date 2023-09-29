-- CHAZZOX NVIM CONFIG

-- plugins
require('packer').startup(function(use) 
  use 'wbthomason/packer.nvim' -- package manager

  -- editor 
  use 'folke/tokyonight.nvim' -- theme
  use 'andweeb/presence.nvim' -- discord Rich Presence 

  -- languages
  -- use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate' } --syntax highlighting
  use 'dag/vim-fish' -- fish syntax 
  use {'mboughaba/i3config.vim', ft="i3config"} -- i3 config support 
  use 'wuelnerdotexe/vim-astro'
  
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
vim.opt.relativenumber = true

-- configure title string
vim.opt.title = true 

-- PLUGINS 

-- Theme Configuration
vim.g.tokoyonight_style = "storm"
vim.cmd [[ colorscheme tokyonight ]]

