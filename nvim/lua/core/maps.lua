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

-- NvimTree
map('n', '<leader>ft', '<cmd>NvimTreeToggle<CR>', keymap_opts)
map('n', '<leader>ff', '<cmd>NvimTreeFindFile<CR>', keymap_opts)

-- Git
map('n', '<leader>gst', '<cmd>G<CR>', keymap_opts)
map('n', '<leader>gbl', '<cmd>G blame<CR>', keymap_opts)
map('n', '<leader>gpu', '<cmd>G push<CR>', keymap_opts)
map('n', '<leader>gpf', '<cmd>G push --force<CR>', keymap_opts)
map('n', '<leader>glum', '<cmd>G pull upstream master<CR>', keymap_opts)
map('n', '<leader>gre', '<cmd>G reset<CR>', keymap_opts)
map('n', '<leader>grsh', '<cmd>G reset --soft HEAD~<CR>', keymap_opts)
map('n', '<leader>gj', '<cmd>GitGutterNextHunk<CR>', keymap_opts)
map('n', '<leader>gk', '<cmd>GitGutterPrevHunk<CR>', keymap_opts)
map('n', '<leader>gp', '<cmd>GitGutterPreviewHunk<CR>', keymap_opts)
map('n', '<leader>guh', '<cmd>GitGutterUndoHunk<CR>', keymap_opts)
