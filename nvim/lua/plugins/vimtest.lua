local map = vim.api.nvim_set_keymap
local fn = vim.fn

local keymap_opts = { noremap=true, silent=true }

map('n', '<localleader>tf', '<cmd>TestFile<CR>', keymap_opts)
map('n', '<localleader>tl', '<cmd>TestLast<CR>', keymap_opts)
map('n', '<localleader>tn', '<cmd>TestNearest<CR>', keymap_opts)
map('n', '<localleader>td', '<cmd>lua require("dap-go").debug_test()<CR>', keymap_opts)

vim.g['test#strategy'] = 'neovim'
if fn.getcwd() == "/Users/andrew.chen/Code/mongodb/baas" then
    vim.g['test#go#gotest#options'] = '-exec="env LD_LIBRARY_PATH=/Users/andrew.chen/Code/mongodb/baas/etc/dylib/lib" -v -tags debug'
end

