if (has('termguicolors'))
  set termguicolors
endif

set encoding=UTF-8
set cursorline
set autochdir
set number
set cursorline
set relativenumber
set notitle

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" tab switching
map tj :tabnext<CR>
map tp :tabprev<CR>
map td :tabclose<CR>

" toggle nerdtree
map <f1> :NERDTreeToggle<CR>

" buffer switching 
map gn :bn<cr>
map gb :bp<cr>
map gd :bd<cr> 

" configure amount of lines that must be above or below cursor to trigger auto
" scroll
set scrolloff=12

" use jj to exit edit mode (Esc)
imap jj <Esc>

" use Ctrl+[hjkl] or arrows to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" use Ctrl + V for pasting from system clipboard
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

" specify a directory for plugins
call plug#begin('~/.vim/plugged')
Plug 'ghifarit53/tokyonight-vim'
Plug 'vim-airline/vim-airline' |
			\ Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'lervag/vimtex'
Plug 'ap/vim-css-color'
Plug 'severin-lemaignan/vim-minimap'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" color theme and syntax highlighting
set background=dark
colorscheme tokyonight

" disable background highlight for comments
" hi Comment ctermbg=0

" 4 character width tabs
set tabstop=4
set shiftwidth=2

" configure file icons in tree
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" configure git status in tree
let g:NERDTreeGitStatusUseNerdFonts = 1

" configure airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'deus'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
call airline#parts#define_accent('mode','none')

" configure nerd tree
let NERDTreeIgnore = ['\~$','\.pyc$','\*NTUSER*','\*ntuser*','\NTUSER.DAT','\ntuser.ini']
autocmd VimEnter * silent NERDTree | wincmd p
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
