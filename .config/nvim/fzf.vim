
Plug '/bin/fzf'
Plug 'junegunn/fzf.vim'

nnoremap <leader>f :Files<CR>
nnoremap <leader>F :Files

nnoremap <leader>w :W<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
