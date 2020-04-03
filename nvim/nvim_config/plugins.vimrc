" JSON highlighter
let g:vim_json_syntax_conceal = 0

" Use deoplete.
let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" vim-go
" Remove mapping for vim-go and delegate it to coc to go to def
let g:go_def_mapping_enabled = 0
