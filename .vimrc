packadd! matchit

" Space as leader key
let mapleader=" "
let maplocalleader=" "

set nocompatible
syntax enable
filetype plugin on
filetype indent on

set encoding=utf-8

set number
set relativenumber
set wildmenu
set wildmode=list:longest,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.o,*.obj,.git,node_module,build
set showmatch
set ruler
set colorcolumn=80

set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

if has('gui_running')
  if has('mac')
    set guifont=JetBrainsMonoNFM-Regular:h16
  else
    set guifont=JetBrains\ Mono\ Regular\ 10
  endif
endif

set mouse=a
set clipboard=unnamed,unnamedplus
set breakindent

set hidden
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

set ignorecase
set smartcase

set signcolumn=yes

set updatetime=250
set timeoutlen=300

set splitright
set splitbelow

set cursorline
set scrolloff=10

set path-=.
set path+=.,**
set path-=*/build/**
set path-=*/bin/**
set path-=*/obj/**

set incsearch
set hlsearch
nnoremap <leader>h :nohlsearch<CR>
nnoremap <silent> <Esc><Esc> :let @/ = ""<CR>:nohlsearch<CR>

set list
set listchars=lead:\ ,trail:·,nbsp:◇,tab:→\ ,extends:▸,precedes:◂,leadmultispace:\│\ ,

if has('termguicolors')
  set termguicolors
endif

"==============================================================================
" Plugins
"==============================================================================

" Plugin Management (vim-plug)
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sleuth', { 'tag': 'v2.0' }
Plug 'tpope/vim-commentary', { 'commit': '64a654ef4a20db1727938338310209b6a63f60c9' }
Plug 'airblade/vim-gitgutter', { 'commit': '0acb772e76064cc406664ab595b58b3fac76488a' }
Plug 'junegunn/fzf', { 'tag': 'v0.67.0', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim', { 'commit': '34a564c81f36047f50e593c1656f4580ff75ccca' }
Plug 'sainnhe/everforest', { 'commit': 'b03a03148c8b34c24c96960b93da9c8883d11f54' }
Plug 'sheerun/vim-polyglot', { 'commit': 'f061eddb7cdcc614c8406847b2bfb53099832a4e' }
Plug 'vim-airline/vim-airline', { 'commit': 'b03fdc542f5155b54959102a2aecaf6c792dce01' }
Plug 'preservim/nerdtree', { 'tag': '7.1.3' }

Plug 'ryanoasis/vim-devicons'

call plug#end()

" Everforest theme
set background=dark
let g:everforest_background='hard'
let g:everforest_better_performance=1
colorscheme everforest

" Airline
let g:airline_theme='everforest'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ' ㏇:'

" FZF
nnoremap <leader>sf :Files<CR>
nnoremap <leader>sg :Rg<CR>
nnoremap <leader>sb :Buffers<CR>
nnoremap <leader>sh :Helptags<CR>
nnoremap <leader>/ :BLines<CR>

" NERDTree
nnoremap <leader>e :NERDTreeToggle<CR>
nnoremap <leader>E :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0

" vim-gitgutter
set updatetime=100
let g:gitgutter_sign_added='+'
let g:gitgutter_sign_modified='~'
let g:gitgutter_sign_removed='-'

"==============================================================================
" Keymaps
"==============================================================================

" Diagnostics
nnoremap [d :lprev<CR>
nnoremap ]d :lnext<CR>
nnoremap <leader>q :lopen<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize with arrows
nnoremap <C-S-Up> :resize +2<CR>
nnoremap <C-S-Down> :resize -2<CR>
nnoremap <C-S-Left> :vertical resize -2<CR>
nnoremap <C-S-Right> :vertical resize +2<CR>

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Stay in indent mode
vnoremap < <gv
vnoremap > >gv

" Move text up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

imap jk <Esc>

"==============================================================================
" Autocommands
"==============================================================================

" Remove trailing whitespace on save
augroup remove_whitespace
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup END
