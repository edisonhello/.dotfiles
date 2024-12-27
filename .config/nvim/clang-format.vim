

if executable('clang-format')
  Plug 'rhysd/vim-clang-format'

  " let g:clang_format#style_options = { }

  " map to <Leader>cf in C++ code
  autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
  autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>

  " Toggle auto formatting
  nmap <Leader>C :ClangFormatAutoToggle<CR>

  " Format when saving the file
  " let g:clang_format#auto_format=0

  autocmd FileType c,cpp,objc ClangFormatAutoEnable
endif
