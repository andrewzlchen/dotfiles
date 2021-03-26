" Emmet
let g:user_emmet_leader_key=","
let g:user_emmet_settings = {
\  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
\}

" Maximizing buffers
nn <leader>+ :MaximizerToggle<CR>

" quickfix list navigation
let g:BASH_Ctrl_j = 'off'
nnoremap <silent><c-k> :cnext<CR>
nnoremap <silent><c-j> :cprevious<CR>
