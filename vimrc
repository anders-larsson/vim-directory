let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir
" Call Pathogen to load all bundled plugins
call pathogen#infect('bundle/{}')
call pathogen#helptags()
" Configure solarized
colorscheme solarized
if has('gui_running')
	set background=light
else
	set background=dark
endif
" Ensure utf-8 encoding
scriptencoding utf-8
set encoding=utf-8
" Enable filetype detection
filetype on
filetype plugin on
filetype indent on
" Enable syntax
syntax on
" Run Neomake on write
autocmd! BufWritePost * Neomake
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
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

set colorcolumn=80

nnoremap <C-n> :call NumberToggle()<cr>
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber
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
highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\  /
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" Set leaderkey
let mapleader = ","
" bind w!! to do sudo tee %
cmap w!! w !sudo tee % >/dev/null
" bind jj to exit insert mode
imap jj <Esc>
" Bind <leader>n to disable search hilight
nmap <silent> <leader>s :silent :nohlsearch<CR>
" Bind <leader>s to disable visible tabs,spaces and EOL
nmap <silent> <leader>l :set nolist!<CR>
" Bind <leader>f to open NERDTree
nmap <leader>f :NERDTreeToggle<CR><CR>
" other
noremap <leader>n :if &number \| set nonumber \| else \| set number \| endif<CR>
" Keybinds for vim-fugitive
nmap <leader>gd :Gdiff<CR><C-W>w<CR>
nmap <leader>gs :Gstatus<CR>
nmap <leader>gc :Gcommit<CR>
" Bind <leader>cd to cd into buffer's dir
map <leader>cd :cd %:p:h<cr>
" Show only lines which differs in vimdiff
map <leader>d :set diffopt=filler,context:0<CR>

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

" Browse help pages easier (helpgrep)
nmap <silent> <RIGHT>           :cnext<CR>
nmap <silent> <RIGHT><RIGHT>    :cnfile<CR><C-G>
nmap <silent> <LEFT>            :cprev<CR>
nmap <silent> <LEFT><LEFT>      :cpfile<CR><C-G>

" Full screen help pages
"Only apply to .txt files...
augroup HelpInTabs
    autocmd!
    autocmd BufEnter  *.txt   call HelpInNewTab()
augroup END

"Only apply to help files...
function! HelpInNewTab ()
    if &buftype == 'help'
        "Convert the help window to a tab...
        execute "normal \<C-W>T"
    endif
endfunction

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

setlocal spell
set spelllang=sv,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

if !empty(glob("~/.vim/local.vimrc"))
  source ~/.vim/local.vimrc
endif
