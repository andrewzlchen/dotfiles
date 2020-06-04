" Disable arrow keys
nnoremap <Left> :echo "No left for you!"<CR>
nnoremap <Right> :echo "No right for you!"<CR>
nnoremap <Up> :echo "No up for you!"<CR>
nnoremap <Down> :echo "No down for you!"<CR>

" Neoformat
nmap <Leader>cf :Neoformat<Enter>

" Mundo undo tree
nmap U :MundoToggle<CR>

" Fzf Rg
nmap <Leader>* :Rg<Space>

" Emmet
let g:user_emmet_leader_key="vv"
let g:user_emmet_settings = {
\  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
\}
