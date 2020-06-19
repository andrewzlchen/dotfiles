" which-key mappings
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map = {
            \ 'x' : ['x'        , 'save and quit']           ,
            \ ' ' : ['GFiles'   , 'git files']               ,
            \ 's' : ['BLines'   , 'search lines in buffer']  ,
            \ 'S' : ['Lines'    , 'search lines in project'] ,
            \ }

let g:which_key_map.b = {
            \ 'name' : '+buffer' ,
            \ 'a' : ['A'         , 'alternate file']  ,
            \ 'd' : ['bd'        , 'delete-buffer']   ,
            \ 'l' : ['Buffers'   , 'fzf-buffer']      ,
            \ 'n' : ['bnext'     , 'next-buffer']     ,
            \ 'p' : ['bprevious' , 'previous-buffer'] ,
            \ 'h' : ['Startify'  , 'home']            ,
            \ }

let g:which_key_map.c = {
            \ 'name' : '+cmenu'     ,
            \ 'n'    : ['cnext'     , 'cnext']     ,
            \ 'p'    : ['cprevious' , 'cprevious'] ,
            \ }

let g:which_key_map.f = { 
            \ 'name' : '+file',
            \ 's'    : ['w'      , 'save-file']             ,
            \ 'f'    : ['Files'  , 'fzf-files']             ,
            \ 'g'    : ['GFiles' , 'fzf-git-files']         ,
            \ 't'    : ['Tags'   , 'fzf-tags']              ,
            \ 'a'    : {
            \    'b' : ['A'      , 'git log']               ,
            \    't' : ['AT'     , 'git checkout']          ,
            \    's' : ['AS'     , 'alternate file split']  ,
            \    'v' : ['AV'     , 'alternate file vsplit'] ,
            \ }                  ,
            \ }

let g:which_key_map.g = {
            \ 'name' : '+git'                            ,
            \ 's'    : ['Gstatus'                        , 'git status']        ,
            \ 'l'    : {
            \    'g' : ['Glog'                           , 'git log']           ,
            \    'l' : ['Gpull'                          , 'git checkout']      ,
            \    'r' : ['Gpull upstream master --rebase' , 'git pull --rebase'] ,
            \ }                                          ,
            \ 'p'    : ['Gpush'                          , 'git push']          ,
            \ 'b'    : ['Gblame'                         , 'git blame']         ,
            \ 'd'    : ['Gvdiffsplit'                    , 'git vdiffsplit']    ,
            \ 'j'    : ['GitGutterNextHunk'              , 'git next hunk']     ,
            \ 'k'    : ['GitGutterPrevHunk'              , 'git prev hunk']     ,
            \ 'u'    : ['GitGutterUndoHunk'              , 'git undo hunk']     ,
            \ }

let g:which_key_map.h = {
            \ 'name' : '+help'     ,
            \ 'm'    : ['Maps'     , 'fzf-maps']     ,
            \ 'c'    : ['Commands' , 'fzf-commands'] ,
            \ }

let g:which_key_map.p = {
            \ 'name' : '+project' ,
            \ 'p'    : [':CocList project'   , 'open projects'],
            \ }

let g:which_key_map.t = {
            \ 'name' : '+toggles' ,
            \ 'f'    : [':CocCommand explorer'   , 'toggle file tree'],
            \ }

let g:which_key_map.w = {
            \ 'name' : '+windows' ,
            \ 'w' : ['<C-W>w'  , 'other-window']          ,
            \ 'd' : ['<C-W>c'  , 'delete-window']         ,
            \ '-' : ['<C-W>s'  , 'split-window-below']    ,
            \ '|' : ['<C-W>v'  , 'split-window-right']    ,
            \ '2' : ['<C-W>v'  , 'layout-double-columns'] ,
            \ 'h' : ['<C-W>h'  , 'window-left']           ,
            \ 'j' : ['<C-W>j'  , 'window-below']          ,
            \ 'l' : ['<C-W>l'  , 'window-right']          ,
            \ 'k' : ['<C-W>k'  , 'window-up']             ,
            \ 'H' : ['<C-W>H'  , 'move-window-left']      ,
            \ 'J' : ['<C-W>J'  , 'move-window-bottom']    ,
            \ 'L' : ['<C-W>L'  , 'move-window-right']     ,
            \ 'K' : ['<C-W>K'  , 'move-window-top']       ,
            \ 'o' : ['<C-W>o'  , 'maximize-window']       ,
            \ '=' : ['<C-W>='  , 'balance-window']        ,
            \ 's' : ['<C-W>s'  , 'split-window-below']    ,
            \ 'v' : ['<C-W>v'  , 'split-window-right']    ,
            \ '?' : ['Windows' , 'fzf-window']            ,
            \ }


