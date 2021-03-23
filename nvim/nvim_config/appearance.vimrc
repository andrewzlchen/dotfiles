set termguicolors     " enable true colors support
set background=dark
set colorcolumn=81

if(has("termguicolors"))
    set termguicolors
endif

" let ayucolor="dark"   " for dark version of theme
colo gruvbox

" lightline.nvim {{
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'FilenameForLightline'
      \ },
      \ }

" Show full path of filename
function! FilenameForLightline()
    return expand('%')
endfunction
" }}


" rainbow parentheses {{
let g:rainbow_active = 1
" }}
