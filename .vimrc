let mapleader=" "
let maplocalleader=" "

set number
set relativenumber
set mouse="a"
set noshowmode
set clipboard="unnamedplus"
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
set guifont=Cascadia_Code:h14
set mouse=a

set title
set showcmd
set tabstop=2 shiftwidth=2
set backspace=indent,eol,start
set autoindent

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

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

nnoremap <Leader>e :Explore<CR>

imap jk <Esc>

set backupdir=~/.vim/.backup/
set undodir=~/.vim/.undo/
set noswapfile

set statusline=
set statusline +=\ %n\ %*         " buffer number
set statusline +=%{&ff}%*         " file format
set statusline +=%y%*             " file type
set statusline +=\ %<%f%*         " full path
set statusline +=%m%*             " modified flag
set statusline +=%=%5l%*          " current line
set statusline +=/%L%*            " total lines
set statusline +=%4v\ %*          " virtual column number
set statusline +=0x%04B\ %*       " character under cursor

" Tweaks for file browsing
let g:netrw_banner=0              " disable banner
let g:netrw_liststyle=3           " tree view
