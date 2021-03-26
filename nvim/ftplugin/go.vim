" vim-go
let g:go_auto_type_info = 1     " automatically show call signature when hovering over a function
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_rename_command = 'gopls'
let g:go_highlight_types = 1
let g:go_highlight_fields = 1

nmap <localleader>grfs :GoReferrers<CR>
nmap <localleader>gts :GoAddTags<CR>
nmap <localleader>ga :GoAlternate<CR>
nmap <localleader>gi :GoImport 
