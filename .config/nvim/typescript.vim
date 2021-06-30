
" https://github.com/mhartington/nvim-typescript

" REQUIRED: Add a syntax file. YATS is the best
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
" For async completion
Plug 'Shougo/deoplete.nvim'
" " For Denite features
"  Plug 'Shougo/denite.nvim'

let g:deoplete#enable_at_startup = 1

