set nocompatible
filetype plugin on
filetype indent on
syntax enable

call plug#begin('~/.vim/plugged')

Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'gorodinskiy/vim-coloresque'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'ervandew/supertab'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'robertmeta/nofrils'
Plug 'itchyny/lightline.vim'

call plug#end()

set encoding=utf-8

set wildmenu
set noshowmode
set number

set ruler
set showmatch
set listchars=eol:¬,space:·,tab:»⠀,trail:~
set list

set laststatus=2
set colorcolumn=80

colorscheme nofrils-dark
let g:nofrils_strbackgrounds=1
let g:nofrils_heavycomments=1

set hlsearch
set incsearch
set smartcase

set title
set showcmd
set nowrap
autocmd BufRead,BufNewFile *.md,*.txt setlocal wrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set autoindent

autocmd Filetype go setlocal noexpandtab
autocmd Filetype go setlocal tabstop=4 shiftwidth=4
autocmd Filetype python setlocal tabstop=4 shiftwidth=4
autocmd Filetype lua setlocal tabstop=4 shiftwidth=4
set magic

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

inoremap <S-CR> <Esc>o
inoremap <C-S-CR> <Esc>O

let mapleader = ","

" gitgutter settings
let g:gitgutter_realtime=1
let g:gitgutter_eager=1
set updatetime=300

" Delimitmate settings
let delimitMate_expand_cr=1
let delimitMate_jump_expansion=1

" lightline settings
let g:lightline = {
      \ 'colorscheme': 'seoul256',
      \ }
