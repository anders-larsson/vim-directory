" Call Pathogen to load all bundled plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" Load colorscheme
colorscheme ir_black
" Enable filetype detection
filetype on
filetype plugin on
filetype indent on
" Disable vi compatibility
set nocompatible
" Add ruler (statusbar) with fugitive (git) support
set ruler
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set laststatus=2 
" Allow backspacing over ident, end of line and start-of-line
set backspace=indent,eol,start

" No bells on error
set noerrorbells
" Use autoindenting on newlines
set autoindent
" Expand tabs to spaces
set expandtab
" Set tabstop and shiftwidth to 2 
set tabstop=2
set shiftwidth=2
" Show line numbering
set number
" Show command in statusbar
set showcmd
" Show matching matching bracket temporarly
set showmatch
" Smart case when searching
set smartcase

inoremap <C-U> <C-G>u<C-U>
