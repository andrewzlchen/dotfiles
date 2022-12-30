-- local map = vim.api.nvim_set_keymap

-- local keymap_opts = { noremap=true, silent=true }

-- map('n', '<localleader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', keymap_opts)
-- map('n', '<localleader>dc', '<cmd>lua require"dap".continue()<CR>', keymap_opts)
-- map('n', '<localleader>dn', '<cmd>lua require"dap".step_over()<CR>', keymap_opts)
-- map('n', '<localleader>di', '<cmd>lua require"dap".step_into()<CR>', keymap_opts)
-- map('n', '<localleader>do', '<cmd>lua require"dap".repl.open()<CR>', keymap_opts)
-- map('n', '<localleader>dt', '<cmd>lua require"dap-go".debug_test()<CR>', keymap_opts)
-- map('n', '<localleader>dui', '<cmd>lua require"dapui".toggle()<CR>', keymap_opts)


-- -- require('dap-go').setup()
-- -- require("dapui").setup()
-- require("nvim-dap-virtual-text").setup {
--     enabled = true,                     -- enable this plugin (the default)
--     enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
--     highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
--     highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
--     show_stop_reason = true,            -- show stop reason when stopped for exceptions
--     commented = false,                  -- prefix virtual text with comment string
--     -- experimental features:
--     virt_text_pos = 'eol',              -- position of virtual text, see `:h nvim_buf_set_extmark()`
--     all_frames = false,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
--     virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)
--     virt_text_win_col = nil             -- position the virtual text at a fixed window column (starting from the first text column) ,
--                                         -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
-- }



-- local dap = require"dap"

-- require('dap-go').setup()
