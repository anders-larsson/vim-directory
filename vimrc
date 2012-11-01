" Call Pathogen to load all bundled plugins
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
" Configure solarized
let g:solarized_termtrans = 1
let g:solarized_termcolors=256
colorscheme solarized
if has('gui_running')
	set background=light
else
	set background=dark
endif
" Enable filetype detection
filetype on
filetype plugin on
filetype indent on
" Enable syntax
syntax on
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
" Ignore/Smart case when searching
set ignorecase
set smartcase
"" Highlight search terms...
set hlsearch
set incsearch
" Line wrapping
set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0
set formatoptions+=l
" Keep at least 5 lines above and below cursor
set scrolloff=5
" Scanwrap on. Continues searching at beginning of file after reaching end.
set wrapscan
" Show tabs, spaces of end of lines and end of lines.
set list
"set listchars=tab:>-,trail:·,eol:$
set list listchars=tab:·\ ,trail:↜,nbsp:•
" Set leaderkey
let mapleader = ","

" bind w!! to do sudo tee %
cmap w!! w !sudo tee % >/dev/null

" bind jj to exit insert mode
imap jj <Esc>

" Bind <leader>n to disable search hilight
nmap <silent> <leader>n :silent :nohlsearch<CR>
" Bind <leader>s to disable visible tabs,spaces and EOL
nmap <silent> <leader>s :set nolist!<CR>
" Bind <leader>f to open NERDTree
nmap <leader>f :NERDTreeToggle<CR><CR>
" Keybinds for vim-fugitive
nmap <leader>gd :Gdiff<CR><C-W>w<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
" Bind <leader>cd to cd into buffer's dir
map <leader>cd :cd %:p:h<cr>

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

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
