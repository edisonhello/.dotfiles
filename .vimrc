set number relativenumber
syntax on
set t_Co=256
set cindent
set smartindent
set autoindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set background=dark
let g:solarized_termcolors=256
colorscheme solarized


set hlsearch
set incsearch

set viminfo='100
set backup
set backupdir=~/.vim/backup

inoremap {<CR>  {<CR>}<Esc>O
inoremap :w<CR> <ESC>:w<CR>i<RIGHT>
inoremap :wq<CR> <ESC>:wq<CR>
inoremap kj <ESC>

hi Normal guibg=NONE ctermbg=NONE
