" Call Pathogen to load all bundled plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" Enable filetype detection
filetype on
filetype plugin on
filetype indent on
" Enable syntax
syntax on
" Colors are different depending on terminal.
" If $TERM == linux (console) load default colorscheme
if match($TERM, "linux" )!=-1
  colorscheme default
" If $TERM == screen enable 256 colors, set dark background
" and load ir_black color scheme
elseif match($TERM, "screen" )!=-1
  set t_Co=256
  set background=dark
  colorscheme ir_black
" If anything else set background to dark and load colorscheme ir_black
else
  set background=dark
  colorscheme ir_black
endif

" Disable vi compatibility
set nocompatible
" Add ruler (statusbar) with fugitive (git) support
set ruler
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2 
" Allow backspacing over ident, end of line
set backspace=indent,eol,start
" No bells on error
set noerrorbells
" Use autoindenting on newlines
set autoindent
" Expand tabs to spaces
set expandtab
" Set tabstop and shiftwidth to 2 
set tabstop=2
set softtabstop=2
set shiftwidth=2
" Show line numbering
set number
" Show command in statusbar
set showcmd
" Show matching matching bracket temporarly
set showmatch
" Smart case when searching
set smartcase
" Line wrapping
set nowrap
set linebreak
" Keep at least 5 lines above and below cursor
set scrolloff=5
" Scanwrap on. Continues searching at beginning of file after reaching end.
set wrapscan

" bind w!! to do sudo tee %
cmap w!! w !sudo tee % >/dev/null

" bind jj to exit insert mode
imap jj <Esc>

" Unbind arrow keys
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <C-U> <C-G>u<C-U>
