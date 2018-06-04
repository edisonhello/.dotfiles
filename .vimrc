set number relativenumber
syntax on
set t_Co=256
set autoindent
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set background=dark
colorscheme solarized

inoremap {<ENTER> {}<LEFT><ENTER><ENTER><UP><TAB>
inoremap :w<ENTER> <ESC>:w<ENTER>i<RIGHT>
inoremap :wq<ENTER> <ESC>:wq<ENTER>
inoremap kj <ESC>

hi Normal guibg=NONE ctermbg=NONE
