
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

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

let g:airline_theme = 'owo' " bubblegum / night_owl / owo
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#branch#enabled=1

let g:load_ctrlp = 1
