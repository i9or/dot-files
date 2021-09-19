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
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'preservim/tagbar'
Plug 'ervandew/supertab'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'plan9-for-vimspace/acme-colors'
Plug 'arzg/vim-plan9'

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

set background=light
colorscheme acme
hi! SpecialKey guibg=NONE guifg=#dadada gui=NONE ctermbg=NONE ctermfg=253 cterm=NONE
hi! NonText guibg=NONE guifg=#dadada ctermbg=NONE ctermfg=253
hi! String guibg=#d7ffaf guifg=#000000 ctermbg=193 ctermfg=232

if has ("gui_running")
  set macligatures
endif

set guifont=FiraCodeNerdFontComplete-Light:h18

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

" vim-airline settings
let g:airline_theme='sol'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

" NERDTree settings
function ToggleFileExplorer()
  if bufname('%') =~ "NERD_tree"
    :NERDTreeClose
  else
    :NERDTreeFocus
  endif
endfunction

map <silent> <F2> :call ToggleFileExplorer()<CR>

let NERDTreeMinimalUI=1
let NERDTreeShowHidden=1

" Tagbar settings
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus=1

" Gutentags settings
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]
