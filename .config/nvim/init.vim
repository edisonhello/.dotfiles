
" Code style settings
set number relativenumber
syntax on
set t_Co=256
set autoindent
set smartindent
set smarttab
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
filetype indent on

set splitright
set splitbelow

" Theme settings
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
set guicursor=n-v-c-ve-o-i-r-ci-cr-sm-a:block

" Global inoremaps
inoremap {<CR>  {<CR>}<Esc>O
inoremap kj <ESC>

" Auto save view
augroup AutoSaveViews
  autocmd!
  autocmd BufWinLeave *.* diffoff
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

" # Function to permanently delete views created by 'mkview'
function! MyDeleteView()
  let path = fnamemodify(bufname('%'),':p')
  " vim's odd =~ escaping for /
  let path = substitute(path, '=', '==', 'g')
  if empty($HOME)
  else
    let path = substitute(path, '^'.$HOME, '\~', '')
  endif
  let path = substitute(path, '/', '=+', 'g') . '='
  " view directory
  let path = &viewdir.'/'.path
  call delete(path)
  echo "Deleted: ".path
endfunction

" # Command Delview (and it's abbreviation 'delview')
command Delview call MyDeleteView()
" Lower-case user commands: http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev delview <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Delview' : 'delview')<CR>
" https://stackoverflow.com/questions/28384159/vim-how-to-remove-clear-views-created-by-mkview-from-inside-of-vim
" Now, if syntax has broken, :delview then :noa wq then re-open the file

autocmd BufRead,BufNewFile,BufWinEnter *.tmuxtheme set filetype=tmux
autocmd BufRead,BufNewFile,BufWinEnter *.ejs set filetype=html

autocmd FileType tex syn region texMathZoneZ matchgroup=texStatement start="\\eqn{" start="\\eqns{" start="\\eqna{" start="\\eqnas{" matchgroup=texStatement end="}" end="%stopzone\>" contains=@texMathZoneGroup

" Plugin settings: vim-plug
" First time installation
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if executable('volta')
  let g:node_host_prog = trim(system("volta which neovim-node-host"))
endif

call plug#begin()

source $HOME/.config/nvim/airline.vim
source $HOME/.config/nvim/fzf.vim
source $HOME/.config/nvim/typescript.vim
source $HOME/.config/nvim/clang-format.vim
source $HOME/.config/nvim/ack-ag.vim

call plug#end()
