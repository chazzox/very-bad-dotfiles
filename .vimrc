set encoding=UTF-8
set cursorline
set number
set mouse=a

" no backup files
set nobackup
set nowritebackup

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" configure vim title string
set title
set titlestring=%F

" saving and closing 
map <C-s> :w<CR>

func! QuitFile()
  try
	:wq
  catch /.*/
	:q!
  endtry
endfunc
map <c-w> :call QuitFile()<CR>

" toggle nerdtree
map <f1> :NERDTreeToggle<CR>

" configure amount of lines that must be above or below cursor to trigger auto
" scroll
set scrolloff=12

" use Ctrl + Shift + V for pasting
nmap <C-S-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

" specify a directory for plugins
call plug#begin('~/.vim/plugged')
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
	Plug 'preservim/nerdtree'
	Plug 'tpope/vim-fugitive'
	Plug 'lervag/vimtex'
	Plug 'mboughaba/i3config.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'sheerun/vim-polyglot'
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
	Plug 'itchyny/lightline.vim'
call plug#end()

" color highlights
let g:Hexokinase_highlighters = ['backgroundfull']

" color theme and syntax highlighting
let g:tokyonight_style = "storm"
colorscheme tokyonight

" lightline
let g:lightline = {'colorscheme': 'tokyonight'}

" 4 character width tabs
set tabstop=4 
set shiftwidth=2

" configure nerd tree
let NERDTreeIgnore = ['\~$','\.pyc$','\*NTUSER*','\*ntuser*','\NTUSER.DAT','\ntuser.ini','\node_modules']
autocmd StdinReadPre * let s:std_in=1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusUseNerdFonts = 1

"i3 config file detection
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

