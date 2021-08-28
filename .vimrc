set nocompatible
filetype plugin on
filetype indent on
syntax enable

call plug#begin('~/.vim/plugged')

Plug 'drewtempelmeyer/palenight.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'gorodinskiy/vim-coloresque'
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-endwise'
Plug 'andrejlevkovitch/vim-lua-format'
Plug 'hail2u/vim-css3-syntax'
Plug 'cdelledonne/vim-cmake'
Plug 'preservim/tagbar'
Plug 'ervandew/supertab'
Plug 'AndrewRadev/splitjoin.vim'

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

set background=dark
colorscheme palenight

if has ("gui_running")
  set macligatures
endif

set guifont=FiraCodeNerdFontComplete-Light:h16

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

let mapleader = ","

" gitgutter settings
let g:gitgutter_realtime=1
let g:gitgutter_eager=1
set updatetime=300

" Delimitmate settings
let delimitMate_expand_cr=1
let delimitMate_jump_expansion=1

" vim-airline settings
let g:airline_theme='palenight'
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

" Vim Go settings
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

let g:go_list_type="quickfix"
let g:go_fmt_command="goimports"
let g:go_auto_sameids=1

let g:go_highlight_types=1
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_highlight_operators=1
let g:go_highlight_extra_types=1
let g:go_highlight_build_constraints=1
let g:go_highlight_generate_tags=1

" Palenight settings
let g:palenight_terminal_italics=1
if (has("termguicolors"))
  set termguicolors
endif

" Vim Cmake settings
nmap <leader>cg :CMakeGenerate<cr>
nmap <leader>cb :CMakeBuild<cr>

" Tagbar settings
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus=1

" Lua Format settings
autocmd BufWrite *.lua call LuaFormat()
