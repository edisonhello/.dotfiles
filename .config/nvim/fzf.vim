

if executable('fzf')
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  
  " Find files in current directory
  nnoremap <leader>f :Files<CR> 
  " Find files in some directory
  nnoremap <leader>F :Files
  " Find text in current directory
  nnoremap <leader>g :Rg<CR>
  " Find text in current directory
  nnoremap <leader>G :Rg
  " Switch to opened tab
  nnoremap <leader>w :W<CR>
  " Find files in current directory
  nnoremap <leader>b :Buffers<CR> 
  
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

  command! -bang -nargs=* RgHidden
    \ call fzf#vim#grep(
    \   'rg --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

endif
