" JSON highlighter
let g:vim_json_syntax_conceal = 0

" vim-go
let g:go_auto_type_info = 1     " automatically show call signature when hovering over a function
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_rename_command = 'gopls'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

autocmd FileType go nmap <localleader>grfs :GoReferrers<CR>
autocmd FileType go nmap <localleader>gts :GoAddTags<CR>
autocmd FileType go nmap <localleader>ga :GoAlternate<CR>

au FileType go nmap <F2> :GoRename<cr>
au FileType go nmap <F9> :GoCoverageToggle -short<cr>
au FileType go nmap <F10> :GoTest -short<cr>
au FileType go nmap <localleader>gdb :GoDebugBreakpoint<CR>
au FileType go nmap <localleader>gds :GoDebugStart<CR>
au FileType go nmap <localleader>gdc :GoDebugContinue<CR>
au FileType go nmap <localleader>gdn :GoDebugNext<CR>
au FileType go nmap <localleader>gdt :GoDebugStep<CR>
au FileType go nmap <localleader>gdo :GoDebugStepOut<CR>
au FileType go nmap <localleader>gdx :GoDebugStop<CR>

" neosnippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
" use honza/vim-snippets instead
let g:neosnippet#disable_runtime_snippets = {
\   '_' : 1,
\ }
let g:neosnippet#snippets_directory='~/.config/nvim/dein/repos/github.com/honza/vim-snippets/snippets'

