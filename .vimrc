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
set listchars=lead:\ ,trail:·,nbsp:◇,tab:→\ ,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:\│\ \ \ ,
set hlsearch
set tabstop=4

set nocompatible
filetype plugin on
filetype indent on
syntax enable

set encoding=utf-8
set wildmenu
set ruler
set laststatus=2
set colorcolumn=80

if has('termguicolors')
		set termguicolors
endif

set title
set showcmd
set tabstop=2 shiftwidth=2
set expandtab
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
