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


" Builtin LSP

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Prevent completions from popping up automatically
let g:completion_enable_auto_popup = 0
let g:completion_matching_strategy_list = ["exact", "substring", "fuzzy"]

" Using <Tab> as trigger completion keys
imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

" Autoformat lua files
" autocmd BufWritePre *.lua lua vim.lsp.buf.formatting_sync(nil, 100)
