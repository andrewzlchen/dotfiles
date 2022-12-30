local map = vim.api.nvim_set_keymap

local keymap_opts = { noremap=true, silent=true }

-- use ctl+hjkl to resize buffer
map('n', '<C-h>', '<C-w><', keymap_opts)
map('n', '<C-j>', '<cmd>resize +2<CR>', keymap_opts)
map('n', '<C-k>', '<cmd>resize -2<CR>', keymap_opts)
map('n', '<C-l>', '<C-w>>', keymap_opts)

-- Buffers
map('n', '<leader>bn', '<cmd>bn<CR>', keymap_opts)
map('n', '<leader>bp', '<cmd>bp<CR>', keymap_opts)
map('n', '<leader>bb', '<cmd>Telescope buffers<CR>', keymap_opts)
map('n', '<leader>bd', '<cmd>bd<CR>', keymap_opts)

-- Tabs
map('n', '<leader>tn', '<cmd>tabnext<CR>', keymap_opts)
map('n', '<leader>tp', '<cmd>tabprevious<CR>', keymap_opts)
map('n', '<leader>t-', '<cmd>tabclose<CR>', keymap_opts)
map('n', '<leader>t+', '<cmd>tabnew<CR>', keymap_opts)

-- Windows
map('n', '<leader>wh', '<C-w>h', keymap_opts)
map('n', '<leader>wj', '<C-w>j', keymap_opts)
map('n', '<leader>wk', '<C-w>k', keymap_opts)
map('n', '<leader>wl', '<C-w>l', keymap_opts)
map('n', '<leader>ws', '<cmd>sp<CR>', keymap_opts)
map('n', '<leader>wv', '<cmd>vsp<CR>', keymap_opts)

-- Telescope
map('n', '<leader>lm', '<cmd>Telescope marks<CR>', keymap_opts) -- list marks

-- navigate to config
map('n', '<localleader>co', '<cmd>e /users/andrew.chen/code/tools/dotfiles/nvim/lua/plugins/init.lua<cr>', keymap_opts)
