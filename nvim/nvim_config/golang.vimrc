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
autocmd FileType go nmap <localleader>gi :GoImport 

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

