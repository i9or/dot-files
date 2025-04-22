packadd! matchit

let mapleader=" "
let maplocalleader=" "

set number
set relativenumber
set mouse=a
set noshowmode

if has('win32') || has('win64')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

set breakindent
set undofile
set ignorecase
set smartcase
set updatetime=250
set timeoutlen=300
set scrolloff=5
set showmatch
set splitright
set splitbelow
set list
set listchars=lead:\ ,trail:·,nbsp:◇,tab:→\ ,extends:▸,precedes:◂,leadmultispace:\│\ ,
set hlsearch
set tabstop=4

set nocompatible
filetype plugin on
filetype indent on
syntax enable

set encoding=utf-8
set path+=**
set wildmenu
set ruler
set laststatus=2
set colorcolumn=80

set termguicolors

set background=dark
colorscheme sorbet

if has('gui_running')
	if has('gui_macvim')
		set guifont=Menlo:h16 
	elseif has('gui_win32')
		set guifont=Cascadia_Code:h12
	endif
endif

set title
set showcmd
set tabstop=2 shiftwidth=2
set backspace=indent,eol,start
set autoindent

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

set wildmode=list:longest,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.obj,.git,node_modules

set incsearch
set hlsearch

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

noremap <C-h> <C-w><C-h>
noremap <C-l> <C-w><C-l>
noremap <C-j> <C-w><C-j>
noremap <C-k> <C-w><C-k>

noremap <silent> <C-S-Up> :vertical resize +1<CR>
noremap <silent> <C-S-Down> :vertical resize -1<CR>

nnoremap <Leader>/ :nohlsearch<CR>
nnoremap <silent> <Esc><Esc> :let @/ = ""<CR>:nohlsearch<CR>

vnoremap > >gv
vnoremap < <gv

nnoremap <Leader>b :ls<CR>:b<Space>

nnoremap ]e :m .+1<CR>==
nnoremap [e :m .-2<CR>==
vnoremap [e :m '<-2<CR>gv=gv
vnoremap ]e :m '>+1<CR>gv=gv

imap jk <Esc>

set backupdir=~/.vim/.backup/
set undodir=~/.vim/.undo/
set noswapfile

set noshowmode

let mode_map = {
	\ 'n': ['NORMAL', 'CursorIM'],
	\ 'i': ['INSERT', 'DiffChange'],
	\ 'R': ['REPLACE', 'DiffDelete'],
	\ 'v': ['VISUAL', 'Visual'],
	\ 'V': ['V-LINE', 'Visual'],
	\ "\<C-v>": ['V-BLOCK', 'Visual'],
	\ 'c': ['COMMAND', 'DiffText'],
	\ 's': ['SELECT', 'IncSearch'],
	\ 'S': ['S-LINE', 'IncSearch'],
	\ "\<C-s>": ['S-BLOCK', 'IncSearch'],
	\ 't': ['TERMINAL', 'Question'],
	\ }

highlight! link StatusLine StatusLineNC

function! ModeStatusLine()
	let l:mode = mode()
	let l:mode_info = get(g:mode_map, l:mode, ['???', 'Normal'])

	return '%#' . l:mode_info[1] . '#' . ' ' . l:mode_info[0] . ' %#StatusLine#'
endfunction

set statusline=
set statusline +=%(%{%ModeStatusLine()%}%)\   " show current mode
set statusline +=\ %n\                        " buffer number
set statusline +=%{&ff}                       " file format
set statusline +=%y                           " file type
set statusline +=\ %<%f                       " full path
set statusline +=%m                           " modified flag
set statusline +=%=                           " right side
set statusline +=%p%%\                        " total lines
set statusline +=%4v\                         " virtual column number
set statusline +=0x%04B\                      " character under cursor

" Tweaks for file browsing
let g:netrw_banner=0                          " disable banner
let g:netrw_liststyle=3                       " tree view
let g:netrw_browse_split=4                    " open in previous window
let g:netrw_altv=1                            " split to the right
let g:netrw_winsize=33                        " width 33%

nnoremap <Leader>e :Lexplore<CR>

let g:netrw_preview=1
let g:netrw_special_syntax=1
let g:netrw_sizestyle="H"

highlight! link netrwDir Special
highlight! link netrwExe DiffChange
highlight! link netrwSymLink Search
highlight! link netrwCompress WarningMsg
