local map = vim.api.nvim_set_keymap

local keymap_opts = { noremap=true, silent=true }

-- use alt+hjkl to resize buffer
map('n', '<C-h>', '<cmd>resize -2<CR>', keymap_opts)
map('n', '<C-j>', '<cmd>resize +2<CR>', keymap_opts)
map('n', '<C-k>', '<cmd>vertical resize -2<CR>', keymap_opts)
map('n', '<C-l>', '<cmd>vertical resize -2<CR>', keymap_opts)

