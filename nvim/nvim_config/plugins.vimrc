" Ack
" use silver searcher instead of ack
let g:ackprg = 'ag --vimgrep'

" JSON highlighter
" Not conceal double quotes in json
let g:vim_json_syntax_conceal = 0

" ALE
"
let g:ale_linters = {
\   'javascript': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'scss': ['prettier'],
\}
let g:ale_fix_on_save = 1
