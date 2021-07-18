local options = vim.o
local global_vars = vim.g
local window = vim.wo

function set_options()
    local opts = {
        termguicolors = true,
        completeopt = "menuone,noinsert,noselect",
    }

    for k, v in pairs(opts) do options[k] = v end
end

function set_window_options()
    local opts = {
        number = true,
        relativenumber = true,
    }

    for k, v in pairs(opts) do
        window[k] = v
        -- options[k] = v
    end
end

function set_global_vars()
    local vars = {
        completion_enable_auto_popup = 0,
        completion_matching_strategy_list = {"exact", "substring", "fuzzy"},
        lightline = {
            colorscheme = "gruvbox",
            active = {
                left = {
                    {"mode", "paste"},
                    {"gitbranch", "readonly", "filename", "modified"}
                }
            },
            component_function = {
                gitbranch = "FugitiveHead",
                filename = "FilenameForLightline"
            }
        },

        user_emmet_leader_key = ",",
        user_emmet_settings = {['javascript.jsx'] = {extends = 'jsx'}},

        BASH_Ctrl_j = 'off',
    }
    for k, v in pairs(vars) do global_vars[k] = v end

end

vim.cmd([[
    colo gruvbox
    function! FilenameForLightline()
        return expand('%')
    endfunction

    autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 1000)
    autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)
    autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)
    autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 1000)
    autocmd BufWritePre *.json lua vim.lsp.buf.formatting_sync(nil, 1000)

    command -complete=file -bang -nargs=? W  :w<bang> <args>
    command -complete=file -bang -nargs=? Wq :wq<bang> <args>
    command -complete=file -bang -nargs=? WQ :wq<bang> <args>
    command -complete=file -bang -nargs=? Q :q<bang> <args>


    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    augroup vimrc
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif
    augroup END
]])

set_options()
set_window_options()
set_global_vars()
