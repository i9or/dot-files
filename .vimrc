set nocompatible
filetype plugin on
filetype indent on
syntax enable

set encoding=utf-8

set wildmenu
set number

set ruler

set laststatus=2
set colorcolumn=80

if has('termguicolors')
      set termguicolors
endif

set title
set showcmd
set nowrap
autocmd BufRead,BufNewFile *.md,*.txt setlocal wrap
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
