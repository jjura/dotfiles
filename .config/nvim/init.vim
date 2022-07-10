" directory for backup:
let &backupdir = expand('$HOME/.config/nvim/backup//')

if !isdirectory(&backupdir) |
        call mkdir(&backupdir, "p") |
endif

" directory for undo:
let &undodir = expand('$HOME/.config/nvim/undo//')

if !isdirectory(&undodir) |
        call mkdir(&undodir, "p") |
endif

" directory for swap:
let &directory = expand('$HOME/.config/nvim/swap//')

if !isdirectory(&directory) |
        call mkdir(&directory, "p") |
endif

set writebackup
set nobackup
set undofile
set swapfile

" indentation:
set tabstop=8
set shiftwidth=8
set expandtab

" line numbers:
set number
set relativenumber
set colorcolumn=81

" searching:
set incsearch
set hlsearch

" interface:
set termguicolors
set background=dark
set mouse=a

" file search:
set wildmenu

" explorer:
let g:netrw_banner=0
let g:netrw_winsize=-30
let g:netrw_liststyle=3

" key mapping:
let mapleader=' '

nnoremap <Leader><Tab> :Lexplore<CR>
nnoremap <Leader>p :e **/*
