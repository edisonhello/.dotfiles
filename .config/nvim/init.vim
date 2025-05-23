
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

set colorcolumn=+1        " highlight column after 'textwidth'
set colorcolumn=+1,+2,+3  " highlight three columns after 'textwidth'
highlight ColorColumn ctermbg=lightgrey guibg=lightgrey
set colorcolumn=80

set splitright
set splitbelow

" Theme settings
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
set guicursor=n-v-c-ve-o-i-r-ci-cr-sm-a:block

" Global inoremaps
inoremap {<CR>  {<CR>}<Esc>O
inoremap <silent> kj <ESC>

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

command Bdelother :bd! | e#
cabbrev bdelother <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Bdelother' : 'bdelother')<CR>

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
" source $HOME/.config/nvim/typescript.vim
source $HOME/.config/nvim/clang-format.vim
source $HOME/.config/nvim/ack-ag.vim
source $HOME/.config/nvim/coc.vim

Plug 'github/copilot.vim'

" NERDTree
Plug 'preservim/nerdtree'
" nmap <silent> <leader>t :NERDTreeToggle<CR>
nmap <silent> <F5> :NERDTreeToggle<CR>
nmap <silent> <leader>rr :NERDTreeRefreshRoot<CR>
nmap <silent> <leader><F5> :NERDTreeFind<CR>
let NERDTreeShowHidden=1
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
			\ quit | endif
" Close the tab if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') > 1 && !len(filter(tabpagebuflist(), 'getbufvar(v:val,"&ft") != "nerdtree"')) | tabclose | endif
" Auto open NERDTree in every window
" autocmd VimEnter * NERDTree
" autocmd BufWinEnter * NERDTreeMirror

" File history preview
Plug 'mbbill/undotree'
nnoremap <F6> :UndotreeToggle<CR>

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'ntpeters/vim-better-whitespace'
" Plug 'wakatime/vim-wakatime'

Plug 'preservim/tagbar'
nnoremap <silent> <leader>tb :TagbarToggle<CR>

Plug 'airblade/vim-gitgutter'

Plug 'AndrewRadev/linediff.vim'
map <silent> <leader>== :Linediff<CR>
map <silent> <leader>=<backspace> :LinediffReset<CR>

" Snippets
" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. You need to change this to something other than <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

Plug 'chrisbra/Recover.vim'

call plug#end()
