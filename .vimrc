
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

" practice not to use array keys
inoremap <LEFT> <NOP>
inoremap <RIGHT> <NOP>
inoremap <UP> <NOP>
inoremap <DOWN> <NOP>
nnoremap <LEFT> <NOP>
nnoremap <RIGHT> <NOP>
nnoremap <UP> <NOP>
nnoremap <DOWN> <NOP>
vnoremap <LEFT> <NOP>
vnoremap <RIGHT> <NOP>
vnoremap <UP> <NOP>
vnoremap <DOWN> <NOP>

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
autocmd Filetype markdown    inoremap $aligned<ENTER> $$<ENTER>\begin{aligned}<ENTER>\end{aligned}<ENTER>$$<Esc>kko
