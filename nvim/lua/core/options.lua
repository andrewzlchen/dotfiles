local options = vim.o
local global_vars = vim.g
local window = vim.wo
local buffer = vim.bo

vim.cmd [[ highlight WinSeparator guibg=None ]]

function set_options()
  local opts = {
    -- defaults
    hidden = true,
    encoding = 'utf-8',
    pumheight = 10,
    ruler = true,
    ignorecase = true,
    smartcase = true,
    laststatus = 3,

    -- appearance
    termguicolors = true,

    -- completion
    completeopt = "menuone,noinsert,noselect",
  }

    for k, v in pairs(opts) do options[k] = v end
end

function set_window_options()
    local opts = {
	-- defaults
        number = true,
        relativenumber = true,
    }

    for k, v in pairs(opts) do
        window[k] = v
        options[k] = v
    end
end

function set_buffer_options()
    local opts = {
	-- defaults
	fileencoding = 'utf-8',
    }

    for k, v in pairs(opts) do
        buffer[k] = v
        options[k] = v
    end
end

function set_global_vars()
    local vars = {
        completion_enable_auto_popup = 1,
        completion_matching_strategy_list = {"exact", "substring", "fuzzy"},
        lightline = {
            colorscheme = "onedark",
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

set_options()
set_window_options()
set_global_vars()

