" JSON highlighter {{
let g:vim_json_syntax_conceal = 0
" }}

" neosnippets {{
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" use honza/vim-snippets instead
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }
let g:neosnippet#snippets_directory='~/.config/nvim/dein/repos/github.com/honza/vim-snippets/snippets'
" }}
