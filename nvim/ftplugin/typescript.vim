" set prettier as formatter
set formatprg=prettier\ --stdin
" tab size = 2
setlocal ts=2 sts=2 sw=2

" Use prettier if it's installed in the project
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

" Use eslint if it's installed in the project
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
