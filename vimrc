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
" Ignore/Smart case when searching
set ignorecase
set smartcase
"" Highlight search terms...
set hlsearch
set incsearch
" Line wrapping
set nowrap
set linebreak
" Keep at least 5 lines above and below cursor
set scrolloff=5
" Scanwrap on. Continues searching at beginning of file after reaching end.
set wrapscan
" Show tabs, spaces of end of lines and end of lines.
set list
set listchars=tab:>-,trail:·,eol:$
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
" Add keybinds for vim-fugitive
nmap <leader>d :Gdiff<CR><C-W>w<CR>
nmap <leader>s :Gstatus<CR>
nmap <leader>c :Gcommit<CR>

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

" backup settings
set backup

function InitBackupDir()
  let separator = "."
  let parent = $HOME .'/' . separator . 'vim/'
  let backup = parent . 'backup/'
  let tmp    = parent . 'swap/'
  if exists("*mkdir")
    if !isdirectory(parent)
    call mkdir(parent)
  endif
  if !isdirectory(backup)
    call mkdir(backup)
  endif
  if !isdirectory(tmp)
    call mkdir(tmp)
    endif
  endif
  let missing_dir = 0
  if isdirectory(tmp)
    execute 'set backupdir=' . escape(backup, " ") . "/,."
  else
    let missing_dir = 1
  endif
  if isdirectory(backup)
    execute 'set directory=' . escape(tmp, " ") . "/,."
  else
    let missing_dir = 1
  endif
  if missing_dir
    echo "Warning: Unable to create backup directories: " . backup ." and " . tmp
    echo "Try: mkdir -p " . backup
    echo "and: mkdir -p " . tmp
    set backupdir=.
    set directory=.
  endif
endfunction
call InitBackupDir()

