filetype plugin indent on
syntax on
set tabstop=4
set shiftwidth=2
set number
set cursorline

if (has('termguicolors'))
  set termguicolors
endif 

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
" Install Plugins
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'airblade/vim-gitgutter/'
Plug 'ryanoasis/vim-devicons'
Plug 'rainglow/vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'tpope/vim-fugitive'
Plug 'hugolgst/vimsence'
Plug 'preservim/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'makerj/vim-pdf'
call plug#end()

set background=dark
colorscheme tokyonight
let g:airline_theme = "tokyonight"


" configure airline
let g:airline_powerline_fonts = 1

" configure nerd tree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeWinSize=30
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeIgnore = ['\.DAT$', '\.LOG1$', '\.LOG1$']
let g:NERDTreeIgnore = ['^node_modules$']
