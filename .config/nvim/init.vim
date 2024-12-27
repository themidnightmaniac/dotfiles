let mapleader=" "

" Visual
filetype indent on
syntax on
set ruler
set nowrap
set noshowcmd
set hlsearch
set incsearch
set title
set showmatch
set number relativenumber

" Set filetype to unix and
" encoding to utf-8
filetype plugin on
set ffs=unix
set encoding=utf-8

" Search
set autoread 
set ignorecase
set smartcase

" Use system's clipboard
set clipboard+=unnamedplus

" Configure tabs
set foldcolumn=2
set expandtab
set smarttab
set shiftwidth=4
set ai
set si
set tabstop=4

" Performance
set lazyredraw

" Disable mouse
set mouse=

" Make background transparent
" for suported terminal (emulators)
highlight Normal ctermbg=none
highlight Normal guibg=none
highlight NonText ctermbg=none
highlight NonText guibg=none

" Useful mappings
nnoremap <silent> <Esc> :nohlsearch<CR>
map <silent> <C-k> <C-w><up>
map <silent> <C-j> <C-w><down>
map <silent> <C-h> <C-w><left>
map <silent> <C-l> <C-w><right>
map <silent> <leader>tn :tabnew<cr>
map <silent> <leader>to :tabonly<cr>
map <silent> <leader>tc :tabclose<cr>
nmap <silent> <M-L> :+tabnext<cr>
nmap <silent> <M-H> :-tabnext<cr>
nmap <silent> <M-J> mz:m+<cr>`z
nmap <silent> <M-K> mz:m-2<cr>`z

