set nocompatible
filetype plugin on
filetype indent on
syntax enable

call plug#begin('~/.vim/plugged')

Plug 'drewtempelmeyer/palenight.vim'
Plug 'tpope/vim-dadbod'
Plug 'ntpeters/vim-better-whitespace'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'gorodinskiy/vim-coloresque'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-eunuch'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-endwise'

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

set guifont=IosevkaNerdFontComplete-Light:h18

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" coc.nvim settings
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-styled-components',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-python',
    \ 'coc-elixir',
    \ 'coc-highlight',
    \ 'coc-go'
  \ ]

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set shortmess+=c
set signcolumn=yes

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

command! -nargs=0 Format :call CocAction('format')

" gitgutter settings
let g:gitgutter_realtime=1
let g:gitgutter_eager=1
set updatetime=300

" Delimitmate settings
let delimitMate_expand_cr=1

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

" FZF settings
map <C-p> :GFiles<CR>

" Vim Go settings
let g:go_diagnostics_enabled = 0
let g:go_metalinter_enabled = []
let g:go_jump_to_error = 0
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 0

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1

" Palenight settings
let g:palenight_terminal_italics=1
if (has("termguicolors"))
  set termguicolors
endif
