local options = vim.o
local global_vars = vim.g
local window = vim.w

function set_options()
    local opts = {
        termguicolors = true,
    }

    for k, v in pairs(opts) do
        options[k] = v
    end
end

function set_global_vars()
    local vars = {
    }
    for k, v in pairs(vars) do
        global_vars[k] = v
    end

    vim.cmd([[
        colo gruvbox
    ]])
    vim.cmd([[
        let g:lightline = {
            \ 'colorscheme': 'gruvbox',
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
    ]])
end

set_options()
set_global_vars()
