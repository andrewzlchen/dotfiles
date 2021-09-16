local map = vim.api.nvim_set_keymap

local keymap_opts = { noremap=true, silent=true }

-- use alt+hjkl to resize buffer
map('n', '<C-h>', '<C-w><', keymap_opts)
map('n', '<C-j>', '<cmd>resize +2<CR>', keymap_opts)
map('n', '<C-k>', '<cmd>resize -2<CR>', keymap_opts)
map('n', '<C-l>', '<C-w>>', keymap_opts)

-- NvimTree
map('n', '<leader>ft', '<cmd>NvimTreeToggle<CR>', keymap_opts)
map('n', '<leader>ff', '<cmd>NvimTreeFindFile<CR>', keymap_opts)
