" settings specifically for gVIM on Windows
if has("gui_running")
  if has("gui_win32")
    map <F1> :NERDTreeToggle<CR>
    map <F12> :quitall
    set guioptions -=m " hide menubar
    set guioptions -=T " hide toolbar
    set guioptions -=r " hide right scrollbar
    set guioptions -=L " hide left scrollbar
    set guifont=FiraCode\ Nerd\ Font\ Mono:h12:cANSI " set editor font
    set lines=50 " set window height
    set columns=180 " set window width
    au GUIEnter * simalt ~x " maximise VIM window
  endif
endif

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
let g:NERDTreeDirArrowExpandable = '?'
let g:NERDTreeDirArrowCollapsible = '?'
let g:NERDTreeWinSize=30
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeIgnore = ['\.DAT$', '\.LOG1$', '\.LOG1$']
let g:NERDTreeIgnore = ['^node_modules$']
