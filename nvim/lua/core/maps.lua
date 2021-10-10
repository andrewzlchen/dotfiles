local map = vim.api.nvim_set_keymap

local keymap_opts = { noremap=true, silent=true }

-- use alt+hjkl to resize buffer
map('n', '<C-h>', '<C-w><', keymap_opts)
map('n', '<C-j>', '<cmd>resize +2<CR>', keymap_opts)
map('n', '<C-k>', '<cmd>resize -2<CR>', keymap_opts)
map('n', '<C-l>', '<C-w>>', keymap_opts)

-- Buffers
map('n', '<leader>bd', '<cmd>bd<CR>', keymap_opts)
map('n', '<leader>bb', '<cmd>Telescope buffers<CR>', keymap_opts)

-- Tabs
map('n', '<leader>tn', '<cmd>tabnext<CR>', keymap_opts)
map('n', '<leader>tp', '<cmd>tabprevious<CR>', keymap_opts)
map('n', '<leader>t-', '<cmd>tabclose<CR>', keymap_opts)
map('n', '<leader>t+', '<cmd>tabnew<CR>', keymap_opts)

-- Windows
map('n', '<leader>wd', '<cmd>wd<CR>', keymap_opts)
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
map('n', '<leader>gj', '<cmd>GitGutterNextHunk<CR>', keymap_opts)
map('n', '<leader>gk', '<cmd>GitGutterPrevHunk<CR>', keymap_opts)
map('n', '<leader>gp', '<cmd>GitGutterPreviewHunk<CR>', keymap_opts)

-- Diff
map('n', '<leader>gd', '<cmd>DiffviewOpen<CR>', keymap_opts)

-- Programming
--- Testing
map('n', '<localleader>tf', '<cmd>TestFile<CR>', keymap_opts)
map('n', '<localleader>tl', '<cmd>TestLast<CR>', keymap_opts)
map('n', '<localleader>tn', '<cmd>TestNearest<CR>', keymap_opts)
map('n', '<localleader>td', '<cmd>lua require("dap-go").debug_test()<CR>', keymap_opts)

-- Debugging
map('n', '<localleader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', keymap_opts)
map('n', '<localleader>dc', '<cmd>lua require"dap".continue()<CR>', keymap_opts)
map('n', '<localleader>dn', '<cmd>lua require"dap".step_over()<CR>', keymap_opts)
map('n', '<localleader>di', '<cmd>lua require"dap".step_into()<CR>', keymap_opts)
map('n', '<localleader>do', '<cmd>lua require"dap".repl.open()<CR>', keymap_opts)
