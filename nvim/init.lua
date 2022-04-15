-- CHAZZOX NVIM CONFIG
local count = 0
function test()
	count = count + 1
	vim.api.nvim_command("echo " .. count)
end
vim.api.nvim_create_autocmd("FocusGained", {callback=test})

-- plugins
require('packer').startup(function(use) 
  use 'wbthomason/packer.nvim' -- package manager

  -- editor 
  use 'folke/tokyonight.nvim' -- theme
  use 'andweeb/presence.nvim' -- discord Rich Presence 
  use {'nvim-lualine/lualine.nvim', 
	requires = { 'kyazdani42/nvim-web-devicons', opt = true } -- status line
  } 
  use {'norcalli/nvim-colorizer.lua',
	ft={'css', 'scss', 'typescript', 'javascript', 'html', 'svelte'}
  } -- syntax highlighting

  -- languages
  use {'nvim-treesitter/nvim-treesitter', run=':TSUpdate' } --syntax highlighting
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
vim.o.termguicolors = true 
vim.g.tokoyonight_style = "storm"
vim.cmd [[ colorscheme tokyonight ]]

-- status line config
require('lualine').setup {options = { theme = 'tokyonight' }}

-- treesitter config
require('nvim-treesitter.configs').setup {
  highlight = { enable = true, additional_vim_regex_highlighting = false}
}

-- nvim colorizer
require('colorizer').setup(nil, {mode='foreground'})

-- vimtex
vim.g.vimtex_view_general_viewer = "zathura"
vim.g.vimtex_compiler_latexmk = {options = {'-shell-escape'}} -- enabling the syntax highlighting

-- check for file updates every time the window is entered/focused
vim.api.nvim_create_autocmd(
  {"WinEnter", "TabEnter", "FocusGained"}, 
  {pattern = "*", command = "checktime" }
)


-- i3 config detection
vim.api.nvim_create_autocmd(
{"BufNewFile","BufRead"}, 
  {pattern = "~/.config/i3/config",command = "set filetype=i3config"}
)


