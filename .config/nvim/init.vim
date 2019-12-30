
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
set guicursor=n-v-c:block

" Global inoremaps
inoremap {<CR>  {<CR>}<Esc>O
inoremap kj <ESC>

" Auto memorize folding
augroup AutoSaveFolds
	autocmd!
	autocmd BufWinLeave *.* mkview
	autocmd BufWinEnter *.* silent! loadview
augroup END

autocmd BufRead,BufNewFile *.tmuxtheme set filetype=tmux

autocmd FileType tex syn region texMathZoneZ matchgroup=texStatement start="\\eqn{" start="\\eqns{" start="\\eqna{" start="\\eqnas{" matchgroup=texStatement end="}" end="%stopzone\>" contains=@texMathZoneGroup

" Plugin settings: vim-plug
" First time installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
	silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/fzf.vim

call plug#end()

