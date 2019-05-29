" Disable arrow keys
nnoremap <Left> :echo "No left for you!"<CR>
nnoremap <Right> :echo "No right for you!"<CR>
nnoremap <Up> :echo "No up for you!"<CR>
nnoremap <Down> :echo "No down for you!"<CR>

" NerdTree
map <leader>tf :NERDTreeToggle<CR>
map <leader>r :NERDTreeFind<cr>

" fzf
map <leader>ff :Files<cr>
map <leader>fg :GFiles<cr>
map <leader>ft :Tags<cr>
map <leader>bl :Buffers<cr>
map <leader>al :Lines<cr>

" Neoformat
map <Leader>cf :Neoformat<Enter>

" Fugitive
map <Leader>gst :Gstatus<Enter>
map <Leader>gcmsg :Gcommit<Enter>
map <Leader>gaa :Gwrite<Enter>
map <Leader>ga :Gwrite<Space>
map <Leader>gp :Gpush<Enter>
map <Leader>gb :Gblame<Enter>
map <Leader>gl :Gpull<Enter>
map <Leader>gg :Glog<Enter>

" Mapping buffers
nnoremap <Leader>bd :bd<CR>
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bl :Buffers<CR>
nnoremap <Leader>bn :bn<CR>

" Mapping windows
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
nnoremap <leader>ws <C-W><C-S>
nnoremap <leader>wv <C-W><C-V>
nnoremap <leader>wq <C-W><C-Q>

" Search code
map <Leader>s :Ack<Space>

" Tagbar: See the structure of the current file via tags
map <leader>tt :TagbarToggle<CR>

" Run Python on current file
nnoremap <buffer> <Leader>a :exec '!python3' shellescape(@%, 1)<cr>

" Help
map <Leader>hm :Maps<CR>
map <Leader>hc :Commands<CR>

" Emmet
let g:user_emmet_leader_key="vv"
let g:user_emmet_settings = {
\  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
\}
