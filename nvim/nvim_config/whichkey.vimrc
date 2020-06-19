" which-key mappings
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map = {
            \ 'x' : ['x'        , 'save and quit']           ,
            \ ' ' : ['GFiles'   , 'git files']               ,
            \ 's' : ['BLines'   , 'search lines in buffer']  ,
            \ 'S' : ['Lines'    , 'search lines in project'] ,
            \ ';' : ['Commands' , 'commands']                ,
            \ 'z' : ['Goyo'     , 'zen']                     ,
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
            \ 'name' : '+file'   ,
            \ 's'    : ['w'      , 'save-file']             ,
            \ 'f'    : ['Files'  , 'fzf-files']             ,
            \ 'g'    : ['GFiles' , 'fzf-git-files']         ,
            \ 't'    : ['Tags'   , 'fzf-tags']              ,
            \ 'a'    : {
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
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'line action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : ['<Plug>(coc-openlink)'                , 'open link'],
      \ 'O' : [':CocList outline'                    , 'outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 'R' : ['<Plug>(coc-references)'              , 'references'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'v' : [':Vista!!'                            , 'tag viewer'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }

let g:which_key_map.p = {
            \ 'name' : '+project' ,
            \ 'p'    : [':CocList project'   , 'open projects'],
            \ }

let g:which_key_map.t = {
            \ 'name' : '+toggles' ,
            \ 'f'    : [':CocCommand explorer'   , 'file tree']           ,
            \ 'p'    : [':RainbowToggle'         , 'rainbow parentheses'] ,
            \ 'r'    : [':set norelativenumber!' , 'relativenumber']      ,
            \ 'n'    : [':set nonumber!'         , 'number']              ,
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


