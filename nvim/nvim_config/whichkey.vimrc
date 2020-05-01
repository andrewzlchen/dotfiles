" which-key mappings
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map = {}

" Files
let g:which_key_map.f = { 
    \ 'name' : '+file',
    \ 's': ['w', 'save-file'],
    \ }


" Windows
let g:which_key_map.w = {
    \ 'name' : '+windows' ,
    \ 'w' : ['<C-W>w'     , 'other-window']          ,
    \ 'd' : ['<C-W>c'     , 'delete-window']         ,
    \ '-' : ['<C-W>s'     , 'split-window-below']    ,
    \ '|' : ['<C-W>v'     , 'split-window-right']    ,
    \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
    \ 'h' : ['<C-W>h'     , 'window-left']           ,
    \ 'j' : ['<C-W>j'     , 'window-below']          ,
    \ 'l' : ['<C-W>l'     , 'window-right']          ,
    \ 'k' : ['<C-W>k'     , 'window-up']             ,
    \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
    \ 'J' : ['resize +5'  , 'expand-window-below']   ,
    \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
    \ 'K' : ['resize -5'  , 'expand-window-up']      ,
    \ '=' : ['<C-W>='     , 'balance-window']        ,
    \ 's' : ['<C-W>s'     , 'split-window-below']    ,
    \ 'v' : ['<C-W>v'     , 'split-window-below']    ,
    \ '?' : ['Windows'    , 'fzf-window']            ,
    \ }

" Buffers
let g:which_key_map.b = {
    \ 'name' : '+buffer' ,
    \ '1' : ['b1'        , 'buffer 1']        ,
    \ '2' : ['b2'        , 'buffer 2']        ,
    \ 'd' : ['bd'        , 'delete-buffer']   ,
    \ 'l' : ['Buffers'   , 'fzf-buffer']      ,
    \ 'n' : ['bnext'     , 'next-buffer']     ,
    \ 'p' : ['bprevious' , 'previous-buffer'] ,
    \ }

" Git
let g:which_key_map.g = {
    \ 'name' : '+git' ,
    \ 'st'   : ['Gstatus'        , 'git status']        ,
    \ 'lg'   : ['Glog'           , 'git log']           ,
    \ 'll'   : ['Gpull'          , 'git checkout']      ,
    \ 'lr'   : ['Gpull --rebase' , 'git pull --rebase'] ,
    \ 'p'    : ['Gpush'          , 'git push']          ,
    \ }

let g:which_key_map.l = {
    \ 'name' : '+language' ,
    \ 'g'    : {
    \     'name' : '+golang',
    \     'tf'   : ['GoTestFunc -exec="env LD_LIBRARY_PATH=$LD_LIBRARY_PATH" -v -tags debug', "GoTestFunc"],
    \  },
    \ 'st'   : ['Gstatus'   , 'git status']      ,
    \ 'lg'   : ['Glog'      , 'git log']         ,
    \ 'd'    : ['bd'        , 'git checkout']    ,
    \ 'l'    : ['Buffers'   , 'fzf-buffer']      ,
    \ 'n'    : ['bnext'     , 'next-buffer']     ,
    \ 'p'    : ['bprevious' , 'previous-buffer'] ,
    \ }
