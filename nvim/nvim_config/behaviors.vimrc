" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
augroup vimrc
    autocmd BufReadPost *
                \ if line("'\"") > 0 && line("'\"") <= line("$") |
                \   exe "normal g`\"" |
                \ endif
augroup END

let g:projectionist_heuristics = {
            \ "*": {
            \     "*.go": {
            \       "alternate": "{basename}_test.go",
            \       "type": "source",
            \     },
            \     "*_test.go": {
            \       "alternate": "{basename}.go",
            \       "type": "test",
            \     }
            \   }
            \ }

