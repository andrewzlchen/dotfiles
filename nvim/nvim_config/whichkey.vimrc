" which-key mappings
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map = {
            \ 'n' : ['tabnext'  , 'next tab'],
            \ 'p' : ['tabprev'  , 'prev tab'],
            \ 'x' : ['x' , 'exit vim'],
            \ 'z' : ['Goyo'     , 'zen'],
            \ }

let g:which_key_map.b = {
            \ 'name' : '+buffer' ,
            \ 'a' : ['A'         , 'alternate file']  ,
            \ 'd' : ['bd'        , 'delete-buffer']   ,
            \ 'n' : ['bnext'     , 'next-buffer']     ,
            \ 'p' : ['bprevious' , 'previous-buffer'] ,
            \ }

let g:which_key_map.c = {
            \ 'name' : '+cmenu'     ,
            \ 'n'    : ['cnext'     , 'cnext']     ,
            \ 'p'    : ['cprevious' , 'cprevious'] ,
            \ }

let g:which_key_map.f = { 
            \ 'name' : '+file'   ,
            \ 's'    : ['w'      , 'save-file']             ,
            \ 't'    : ['Tags'   , 'fzf-tags']              ,
            \ 'a'    : {
            \    'name': '+alternates',
            \    'b' : ['A'      , 'alternate file buffer'] ,
            \    't' : ['AT'     , 'alternate file tab']    ,
            \    's' : ['AS'     , 'alternate file split']  ,
            \    'v' : ['AV'     , 'alternate file vsplit'] ,
            \ }                  ,
            \ }

let g:which_key_map.g = {
            \ 'name' : '+git'                            ,
            \ 'b'    : ['Gblame'                         , 'git blame']         ,
            \ 'd'    : ['Gvdiffsplit'                    , 'git vdiffsplit']    ,
            \ 'g'    : [':GFiles'              , 'git files']     ,
            \ 'l'    : {
            \    'g' : ['Glog'                           , 'git log']           ,
            \    'l' : ['Gpull'                          , 'git checkout']      ,
            \    'r' : ['Gpull upstream master --rebase' , 'git pull --rebase'] ,
            \ }                                          ,
            \ 'j'    : ['GitGutterNextHunk'              , 'git next hunk']     ,
            \ 'k'    : ['GitGutterPrevHunk'              , 'git prev hunk']     ,
            \ 'm'    : [':GFiles?'                       , 'modified git files'],
            \ 'p'    : ['Gpush'                          , 'git push']          ,
            \ 's'    : ['Gstatus'                        , 'git status']        ,
            \ 'u'    : ['GitGutterUndoHunk'              , 'git undo hunk']     ,
            \ }

let g:which_key_map.h = {
            \ 'name' : '+help'     ,
            \ 'm'    : ['Maps'     , 'fzf-maps']     ,
            \ 'c'    : ['Commands' , 'fzf-commands'] ,
            \ }

let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ }

let g:which_key_map.t = {
            \ 'name' : '+toggles/tabs'           ,
            \ 'f'    : [':NvimTreeFindFile'   , 'file tree']           ,
            \ 'p'    : [':RainbowToggle'         , 'rainbow parentheses'] ,
            \ 'r'    : [':set norelativenumber!' , 'relativenumber']      ,
            \ 'n'    : [':set nonumber!'         , 'number']              ,
            \ 't'    : {
            \    'name': '+tabs'                 ,
            \    'j'   : ['tabprevious'          , 'previous tab']        ,
            \    'k'   : ['tabnext'              , 'next tab']            ,
            \    'n'   : ['tabnew'               , 'create tab']          ,
            \ }                                  ,
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


