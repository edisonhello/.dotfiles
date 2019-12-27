
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
filetype indent on

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
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent loadview
augroup END

" Filetype different settings
" autocmd Filetype c,cpp,java  set cindent
" autocmd Filetype markdown    inoremap $aligned<ENTER> $$ \begin{aligned}<ENTER><ENTER><ENTER><ENTER>\end{aligned} $$<Esc>kki

" Auto reload vimrc
augroup myvimrc
	au! BufWritePost .vimrc so $MYVIMRC
augroup END

autocmd FileType tex syn region texMathZoneZ matchgroup=texStatement start="\\eqn{" start="\\eqns{" start="\\eqna{" start="\\eqnas{" matchgroup=texStatement end="}" end="%stopzone\>" contains=@texMathZoneGroup

" Plugin settings: vim-plug
" First time installation
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" vim-airline
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'paste'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.dirty='⚡'

let g:airline_theme = 'night_owl' " bubblegum / night_owl
let g:airline#extensions#tabline#enabled = 1

