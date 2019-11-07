
" Code style settings
set number relativenumber
syntax on
set t_Co=256
set autoindent
set smartindent
set smarttab
" set expandtab " do not replace tab with spaces
set tabstop=4
set shiftwidth=4
set softtabstop=0

" Theme settings
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Search settings
set hlsearch
set incsearch
nmap <F5> :nohlsearch<CR>

" Undo and backup settings
set viminfo='100
set backup
set backupdir=~/.vim/backup

" Global inoremaps
inoremap {<CR>  {<CR>}<Esc>O
inoremap kj <ESC>

" Forgot
hi Normal guibg=NONE ctermbg=NONE

" Auto memorize folding
augroup AutoSaveFolds
    autocmd!
    autocmd BufWinLeave * mkview
    autocmd BufWinEnter * silent loadview
augroup END

" Filetype different settings
autocmd Filetype c,cpp,java  set cindent
autocmd Filetype markdown    inoremap $aligned<ENTER> $$ \begin{aligned}<ENTER><ENTER><ENTER><ENTER>\end{aligned} $$<Esc>kki

autocmd FileType tex syn region texMathZoneZ matchgroup=texStatement start="\\eqn{" start="\\eqns{" start="\\eqna{" start="\\eqnas{" matchgroup=texStatement end="}" end="%stopzone\>" contains=@texMathZoneGroup
